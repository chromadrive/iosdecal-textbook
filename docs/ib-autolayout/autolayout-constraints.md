---
id: autolayout-constraints
title: Defining Constraints with Autolayout
sidebar_label: Defining Constraints with Autolayout
---

## Overview

**AutoLayout** is Apple's constraint-based layout system. It provides a convenient way for you to describe how the size and position of your views should change when the size and position their parent views or neighboring views change. This can happen for example when:

 - Your application is run on different devices, ranging from the tiny iPhone SE to the massive iPad Pro
 - The user rotates the orientation of the device
 - The size of or number of neighboring views change to reflect a change in the content the application is displaying (such as expanding a menu, for example)

In AutoLayout you describe a view's layout by providing one or more constraints that describe how it is size and position are related to the size and position of other views. But it can get quite complicated - if you've ever tried to center a `div` in CSS you know how clumsy constraint-based systems can get!

Here's an example of how bad things can get if you don't use AutoLayout:

<p align="center">
  <img width="90%" src="https://i.imgur.com/VzPpUJY.png">
</p>


## Constraints

In order for Auto Layout to work you'll need to provide enough constraints for each view so that the system can determine its **size** (width and height) and **location** (the x and y coordinates of the top left corner of the view).

You can add constraints in Interface Builder by selecting one or more views and using the the Auto Layout controls (boxed in red below).

<p align="center">
  <img width="90%" src="https://i.imgur.com/CU1gNNr.png">
</p>

The buttons are:

<p align="center">
  <img width="70%" src="https://i.imgur.com/tayfHfR.png">
</p>

- Stack tool - A quick way to make a stack view from selected elements
<p align="center">
  <img width="70%" src="https://i.imgur.com/iEC6fBM.gif">
</p>

- Align tool - specify how views should be aligned relative to each other
<p align="center">
  <img width="20%" src="https://i.imgur.com/1kY5w9e.png">
</p>
- Pin tool - specify that a view should be a fixed distance from another view
<p align="center">
  <img width="20%" src="https://i.imgur.com/KiNz1tc.png">
</p>
- Issues tool - quick fixes for errors or warnings that may come up as you add constraints.

You can also add constraints by control-dragging from one view to the relevant area of another view and selecting the appropriate item in the context menu.
<p align="center">
<img width="90%" src="https://imgur.com/download/h5zMp23"> </p>

## Basic Constraints

### Center a view within a parent view
Sometimes you'll want to center a view (either vertically, horizontally, or both) within another view. Here, we're centering the label view in the parent frame.

<p align="center">
<img width="90%" src="https://imgur.com/download/l2Z800F"> </p>

Here's what it looks like on a device:
<p align="center">
<img width="80%" src="https://i.imgur.com/bP8Afdm.png"> </p>

### Align and resize with parent view

Another common situation is for a view to resize its dimensions (either height, width or both) to match the parent view's dimensions.

Here we specify that the blue label view should be pinned to the top of the screen with fixed height, but it should resize to span the width of the screen. This might be useful for an alert message, or some other banner.


<p align="center">
<img width="90%" src="https://imgur.com/download/XaTdpkK"> </p>

Here's what it looks like on a device:
<p align="center">
<img width="80%" src="https://i.imgur.com/4UFyHsa.png"> </p>

### Relative constraints between views

The pin tool by default will try to create a constraint relative to the nearest neighbor. You can change which view a constraint is relative to by clicking on the small arrow and selecting the right view in the drop down menu.

In this example, I've already constrained the blue view to have a fixed height and pinned to the top/left/right edges, and pinned the green view to the bottom/left/right edges. Here, I'm specifying that there should be no space between the blue and green views, effectively forcing the height of the green view to be `total_height - blue_height`.

<p align="center">
<img width="90%" src="https://imgur.com/download/jiNTP2P"> </p>

Here's what it looks like on a device:
<p align="center">
<img width="80%" src="https://i.imgur.com/r9I4qDL.png"> </p>

## Flexible Content Size

So far we've only looked at views whose content and size do not change during run time. However, many views that you'll encounter will be dynamically sized depending on their content - such as `UILabels`, `UIButtons`, and `UIImageViews`.

### Intrinsic content size of a view

Views that can determine the size they that "should be" have what is known as an [intrinsic content size](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html). This size is the size the view has determined would be best to display its current content. For example a UILabel's intrinsic content size will change depending the text in the label, and a UIImageView's intrinsic content size will depend on the image it has loaded.

When using Auto Layout, you do not necessary have to provide width and height constraints for views with an intrinsic content size since the system will take this into account when computing the final layout of the views.

### Vertically aligned views
Here, I've pinned the first label to the top left corner, specified the vertical space between the labels, pinned the second label to the left margin and also given both labels a width. Notice that I didn't have to specify the height for either label.

<p align="center">
<img width="90%" src="https://i.imgur.com/lJ7hFz7.png"> </p>

Now let's make one the labels a multi-line label by setting it's "Lines" property to 0 in the attributes inspector (this means that the label can have an arbitray number of lines). Once we add sufficiently long text and update frames, the first label changes its height to match the content and the second label gets automatically pushed lower down the canvas so that the vertical space between the two labels is maintained. 

<p align="center">
<img width="90%" src="https://imgur.com/download/zqABsEr"> </p>

Note that even though I had to first resize the blue label and update the frames manually here, this would be done automatically for us at runtime when we change the content of the label.

### Horizontally aligned views
Consider another example where we have two single-line labels horizontally adjancent to each other. We want to pin one label to the left margin and the other to the right margin—this is common for example in the design of many table view cells.

#### Inequality constraints

We also want to specify that the labels should have a minimum amount of horizontal space between them so that they do not run into each other. We do not know the exact amount of horizontal space since the contents of the labels might change at run time. One way to accomplish this is to define an inequality constraint where we can specify that a certain constraint's value be greater than or less than a constant.

<p align="center">
<img width="90%" src="https://imgur.com/download/h6qPsEa"> </p>

#### Compression resistance

What if the text in our labels becomes long enough so overlap is unavoidable? As seen below, at least one of the labels will start to shrink and compress its content (in this case by using an ellipsis).

We can control this shrinking behavior though! Each view has a horizontal and vertical content compression resistance priority that can be modified. Higher compression resistance means the view is less likely to shrink its content.

<p align="center">
<img width="90%" src="https://imgur.com/download/DbO3uHf"> </p>

In this case I've specified that the blue label is the one whose content should be compressed if there is a conflict by lowering its compression resistance priority.

## Constraint issues

### Editing constraints

**It's important to note that constraints added using the align and pin tools are additive.** They do not update existing constraints, but rather create entirely new ones. 

You can edit an constraint by selecting the view associated with that constraint and using the Size inspector, or simply selecting the constraint directly in the Scene Outline. For example, here we're updating the green label view from above to have a gap of 10px rather than 0px.

<p align="center">
<img width="90%" src="https://imgur.com/download/KLq7kgR"> </p>

### Constraint Errors and Warnings

#### Conflicting Constraints

If you create constraints such that Auto Layout cannot simultaneously satisfy all of your constraints (i.e. your system is overconstrained), then it will give you an error about "Conflicting Constraints". You'll have to remove at least one constraint to resolve the issue. 


_(Note: Sometimes it might just be easier to delete all constraints and start over. You can do this by selecting "Clear Constraints" from the issues button)_


Here our constraints on the green label to be centered along the y axis and to be a specific distance from the top of the parent view conflict with each other. We resolve the issue by removing the specific distance constraint that we added.

<p align="center">
<img width="90%" src="https://imgur.com/download/96RIodo"> </p>

#### Missing Constraints
If you do not provide enough information for Auto Layout to determine both the positioning and dimensions of your view, then it will give you an error about "Missing Constraints". This can be resolved by adding an appropriate constraint. __Be careful when using the automatic issue resolver since this may not add the constraint you expected or it may add a relatively unintuitive constraint.__


Here, we've set constraints on the blue label view specifying its height and leading (left) / trailing (right) space from the edge of its parent, but we are still missing a constraint for the y position. Using the automatic issue resolver gives us a constraint that centers the view vertically in the parent view - which may or may not have been the constraint we wanted.

<p align="center">
<img width="90%" src="https://imgur.com/download/jO1xKfT"> </p>