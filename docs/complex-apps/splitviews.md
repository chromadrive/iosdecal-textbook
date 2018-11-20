---
id: splitviews
title: SplitViews
sidebar_label: SplitViews
---

## Overview

*Split Views* let you carve up the screen into two sections and display a view controller on each side. It’s typically used to display navigation on the left hand side, and a detail view on the right hand side. Here's the [Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uisplitviewcontroller).

<center> **Screenshot Here (SVC on iPad vs iPhone)** </center>

Split views have actually been around since the introduction of the iPad, but have only recently been made available for all devices. On iPads and large iPhones, the two view controllers can be arranged so that they are side-by-side, so that only one at a time is visible, or so that one only partially hides the other - but the former is far more common. On other devices, split views take the form of your typical navigation controller.

## Example

Create a new project, open up Main.storyboard, and delete all the default views that have been placed. Drag a **Split View Controller** from the Object Library into the empty storyboard.

<center> **Screenshot Here (Dragging SVC into Storyboard)** </center>

This will automatically add a few elements to our storyboard:

- A **Split View Controller**. This is the root view of the application – the split view that will contain the entire rest of the app.

- A **Navigation Controller**. This represents the `UINavigationController` that will be the root view of the master view controller (ie, the left pane of the split view when on iPad or Landscape on large iPhones). If we look in the split view controller, we'll see the navigation controller has a relationship segue of master view controller. This allows us to create an entire navigation hierarchy in the master view controller without needing to affect the detail view controller at all.

- A **View Controller**. This will eventually display all the details of our items. The view controller has a relationship segue of detail view controller, much like that of our friends `UINavigationController` and `UITabBarController`.

- A **Table View Controller**. This is the root view controller of the master `UINavigationController`. This will eventually display the master list of items.

Since we deleted the default initial view controller from the storyboard, we'll need to tell the storyboard that we want our split view controller to be the initial view controller. Select the Split View Controller and open the Attributes inspector, then check the `Is Initial View Controller` option.

Let's build and run the app on an iPad simulator, and rotate it to landscape:

<center> **Screenshot Here (Build #1 on iPad)** </center>

Now run it on an iPhone simulator (any of them except a plus-sized phone, which is large enough that it will act just like the iPad version in landscape mode) and you will see that it starts off showing the detail view in full screen. It will also allows us to tap the back button on the navigation bar to pop back to the master view controller:

<center> **Screenshot Here (Build #1 on iPad)** </center>

On iPhones other than an iPhone Plus in landscape, a split view controller will act just like a traditional master-detail app with a navigation controller pushing and popping back and forth. This functionality is built-in and requires very little extra configuration from you, the developer!

We want to use own view controllers shown instead of these default ones, so let’s get started creating those.

### Creating Custom View Controllers

The storyboard has the view controller hierarchy set up – split view controller with its master and detail view controllers. Now let's implement the code side of things to get our data to show up.

Create a new Swift class called `MasterViewController`, make it a subclass of `UITableViewController`, and open it up. This will become the Table View on the left that shows the master list of items. The next part should be review from the section on [TableViews](collection-tableviews), so if you feel like you have a solid understanding of that material feel free to skim the next few paragraphs - otherwise, let's do some review on initializing Table Views:

Scroll down to `numberOfSections(in:)` and delete the method. It's not needed in our case since one section is returned. However, depending on your app's functionality, you may want to leave this in.

Next, find `tableView(_:numberOfRowsInSection:)` and replace the implementation with the following:

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return 5
}
```

Finally, uncomment `tableView(_:cellForRowAt:)` and replace its implementation with the following:
```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
  return cell
}
```

This will give us a few empty rows for now for testing purposes.

In Main.storyboard, select the Root View Controller. Click on the Identity inspector, and change the class to MasterViewController. In addition to that, we need to make sure the prototype cell in the table view is given a reuse identifier, or it will cause a crash when the storyboard tries to load. Select the Prototype Cell in the Master View Controller, and change the identifier to `tableCell`. 

Let's create the view controller for the detail side. Create a new Swift class named `DetailViewController`, and make it a subclass of `UIViewController`. In Main.storyboard, select the view controller in the View Controller Scene and change the Class to `DetailViewController` in the Identity inspector. For now, let's also drag a label to the detail view controller just for testing purposes.

Build and run. At this point we should see the custom view controllers:

### Defining a Model

The next thing we need to do is define a model for the data we want to display. For the purposes of this example, let's create a codex of items that we might find in an RPG game.

We first need to find a way to represent the items we'll display. We'll just define a simple class with some attribute properties about each item. Create a new Swift class named `Item`, and replace the code in it with this:

```swift
import UIKit

class Item {
  let name: String
  let type: String
  let description: String

  init(name: String, type: String, description: String) {
    self.name = name
    self.type = type
    self.description = description
  }
}
```

Let's hook this model up to the master view now! In MasterViewController.swift, we'll add a new property to the class to define the array of items needed to populate the table view:

```swift
let items = [
	Item(name: "Apple", type: "Food",
		 description: "It's a bit sour. Heals 5 HP."),
	Item(name: "Bow", type: "Weapon",
		 description: "Attack from a range. +10 ATK, +5 RANGE."),
	Item(name: "Chest", type: "Storage",
		 description: "Looks more like a suitcase. +10 inventory slots"),
	Item(name: "Dog", type: "Companion",
		 description: "It wants to be your friend. +5 ATK, +20 HP")
	Item(name: "Sword", type: "Weapon",
		 description: "Careful, it's sharp! +15 ATK."),	
]
```

At this point, we would also want to replace the return statement in `tableView(_:numberOfRowsInSection:)` with `items.count`, but it's not strictly necessary for the purposes of this demo.

Now, edit `tableView(_:cellForRowAtIndexPath:)` to add the following code before the final return statement:

```swift
let item = items[indexPath.row]
cell.textLabel?.text = item.name
```

### Displaying Item Details

Now that the table view is showing the list of items, it’s time to get the detail view in order. First, we'll need to delete the test label we placed in the Detail View Controller in Main.storyboard.

Using the screenshot below as a guide, drag the following labels into the Detail View Controller’s view:

<center> **Screenshot Here (Label Layouts)** </center>

In DetailViewController.swift, let's add the following properties to the top of the class:

```swift
@IBOutlet weak var nameLabel: UILabel!
@IBOutlet weak var typeLabel: UILabel!
@IBOutlet weak var descriptionLabel: UILabel!

var item: Item? {
  didSet {
    refreshUI()
  }
}

func refreshUI() {
  loadViewIfNeeded()
  nameLabel.text = item?.name
  typeLabel.text = item?.type
  descriptionLabel.text = item?.description
}
```

Whenever we switch the item, we want the UI to refresh itself and update the details displayed in the outlets. It’s possible that we'll change item and trigger the method even before the view has loaded, so we'll need to call loadViewIfNeeded() to guarantee that the view is loaded and its outlets are connected.

Let's connect the outlets now. In Main.storyboard, right-click the Detail View Controller object from the Document Outline to display the list of outlets, and hook up each of the relevant outlets to their respective labels.

Finally, we'll need to hook up the master with the detail. There are many different strategies for how to best communicate between these two view controllers. In the Master-Detail App template from the Xcode start screen, the master view controller has a reference to the detail view controller. That means the master view controller can set a property on the detail view controller when a row gets selected.

That approach works fine for simple applications where you only ever have one view controller in the detail pane, but we're going to follow the more robust approach suggested in the `UISplitViewController` class documentation for more complex apps and use a delegate.

Open MasterViewController.swift and add the following protocol definition above the MasterViewController class definition:

```swift
protocol ItemSelectionDelegate: class {
  func itemSelected(_ newItem: Item)
}
```

This defines a protocol with a single method, `itemSelected(_:)`. The detail view controller will implement this method, and the master view controller will message it when an item is selected.

Next, update `MasterViewController` to add a property for an object conforming to the delegate protocol:

```swift
weak var delegate: ItemSelectionDelegate?
```

This means that the delegate property is required to be an object that has `itemSelected(_:)` implemented. That object will be responsible for handling what needs to happen within its view after the item was selected.

> **Note**: You need to mark the delegate as weak to avoid a retain cycle. To learn more about retain cycles in Swift, check out [this article](https://medium.com/mackmobile/avoiding-retain-cycles-in-swift-7b08d50fe3ef). We won't cover memory management in this class, but if you're planning to develop anything high perfomance or that requires serious optimization retain cycles are quite useful to learn about!

Since we want DetailViewController to update when the item is selected, we need to implement the delegate we just defined. Open up DetailViewController.swift and add a class extension to the  end of the file:

```swift
extension DetailViewController: ItemSelectionDelegate {
  func itemSelected(_ newItem: Item) {
    item = newItem
  }
}
```

Class extensions are great for separating out delegate protocols and grouping the methods together. In this extension, we are saying DetailViewController conforms to ItemSelectionDelegate and then we implement the one required method.

Now that the delegate method is ready, we need to call it from the master side. Open MasterViewController.swift and add the following method:

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  let selectedItem = items[indexPath.row]
  delegate?.itemSelected(selectedItem)
}
```

Finally, open AppDelegate.swift. In `application(_:didFinishLaunchingWithOptions:)`, add the following code just before the final return statement:

```swift
masterViewController.delegate = detailViewController
```

This defines the final connection between the two view controllers.

Build and run the app on iPad, and you should be able to select an item and see the information pop up on the right side!

<center> **Screenshot Here (Final Build on iPad)** </center>

Looks great! Except there’s one problem left – if you run it on iPhone, selecting items from the master table view does not show the detail view controller. We need to add make a small modification to make sure that the split view works on iPhone, in addition to iPad.

Open up MasterViewController.swift, add the following to the end of `tableView(_:didSelectRowAt:)`:

```swift
if let detailViewController = delegate as? DetailViewController {
  splitViewController?.showDetailViewController(detailViewController, sender: nil)
}
```

First, we need to make sure the delegate is set and that it is a `DetailViewController` instance as we'd expect. We then call `showDetailViewController(_:sender:)` on the split view controller and pass in the detail view controller. Every subclass of `UIViewController` has an inherited property `splitViewController`, which will refer to it’s containing view controller, if one exists.

This new code only changes the behavior of the app on iPhone, causing the navigation controller to push the detail controller onto the stack when we select a new item. It does not alter the behavior of the iPad implementation, since on iPad the detail view controller is always visible. After making this change, run it on iPhone and it should now behave properly. Adding just a few lines of code got you a fully functioning split view controller on both iPad and iPhone!

<center> **Screenshot Here (Final Build on iPhone)** </center>


## Conclusion

For new apps, you’re likely just to use the Master-Detail template from the Xcode start screen to save time, which gives you a split view controller to start and should suffice for most simple applications. But now you’ve seen how to use `UISplitViewController` from the ground up using delegates and have a much better idea of how it works! Split view controllers can be a powerful tool to display data and navigation in a compact and efficient manner, so use them wisely!