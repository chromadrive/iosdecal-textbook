---
id: gestures
title: Gestures and Recognizers
sidebar_label: Gestures and Recognizers
---

## Overview

If you need to detect gestures in your app, such as taps, pinches, pans, or rotations, you can use the `UIGestureRecognizer` classes. [Here's the Apple Documentation for the class](https://developer.apple.com/documentation/uikit/uigesturerecognizer).

Gesture recognizers operate on interactions with a specific view and must be associated with a particular view. We can do that by using the `addGestureRecognizer()` method found in `UIView`.

`UIGestureRecognizer` is a parent class of more specific gesture recognizers that can recognize a type of gestures. More specifically, these subclasses are:

- `UITapGestureRecognizer`

- `UIPinchGestureRecognizer`

- `UIRotationGestureRecognizer`

- `UISwipeGestureRecognizer`

- `UIPanGestureRecognizer`

- `UIScreenEdgePanGestureRecognizer`

- `UILongPressGestureRecognizer`

Implementing a gesture recognizer is really quite simple. For each recognizer, we perform the following actions:

1) **Initiate a gesture recognizer**. When you create a gesture recognizer, you specify a callback function so the gesture recognizer can send you updates when the gesture starts, changes, or ends.

2) **Add the gesture recognizer to a view**. Each gesture recognizer is associated with one (and only one) view. When a touch occurs within the bounds of that view, the gesture recognizer will look to see if it matches the type of touch it’s looking for, and if a match is found it will notify the callback function.

We can perform these steps both programatically and through the Storyboard - it's much easier through Storyboard, but as usual implementing these programatically gives us much more control of the specifics of our gesture recognizers.

## Example

### Adding a Gesture Recognizer

Create a new project, and open up Main.storyboard. Create an Image View, and set the image to any arbitrary image you wish.

Inside the Object Library, look for the **Pan Gesture Recognizer** object. Then drag the Pan Gesture Recognizer object onto the Image View. This both creates the pan gesture recognizer, and associates it with the Image View:

<center>![](assets/complex-apps/gestures/gesture1.jpg)</center>

You can verify that the recognizer is connected properly by checking the `gestureRecognizer` field of the Outlet Inspector:

<center>![](assets/complex-apps/gestures/gesture2.jpg)</center>

There's a small catch here: touches are disabled by default on views that normally don’t accept touches, like image views. In order to enable touches, we'll need to select the image view, open up the Attributes Inspector, and check the "*User Interaction Enabled*" checkbox.


<center>![](assets/complex-apps/gestures/gesture3.jpg)</center>

Now that we've created the pan gesture recognizer and associated it to the image view, we have to write the callback function so something actually happens when the pan occurs. Open up ViewController.swift and add the following function to the class:

```swift
@IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
  let translation = recognizer.translation(in: self.view)
  if let view = recognizer.view {
    view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
  }
  recognizer.setTranslation(CGPoint.zero, in: self.view)
}
```

The `UIPanGestureRecognizer` will call this function when a pan gesture is first detected, and then continuously as the user continues to pan, and one last time when the pan is complete (usually the user lifting their finger).

The `UIPanGestureRecognizer` passes itself as an argument to this function. We can retrieve the amount the user has moved their finger by calling the translation(in:) function. Here, we use that amount to move the center of the image the same amount the finger has been dragged. It’s important to set the translation back to zero once we're done, otherwise the translation will keep compounding each time and we'll see the the image fly off the screen.

Note that instead of hard-coding the image view into this function, you get a reference to the image view by calling recognizer.view. This makes our code more generic, so we can re-use it for any other image views we might also want to be able to drag around.

Now that our callback function is complete, let's hook it up to the `UIPanGestureRecognizer`. In Main.storyboard, ctrl-drag from the Pan Gesture Recognizer to View Controller. Select the option that corresponds to `handlePan(recognizer:)` in the popup that appears:

<center>![](assets/complex-apps/gestures/gesture4.gif)</center>

At this point your Connections Inspector for the Pan Gesture Recognizer should look like this:

<center>![](assets/complex-apps/gestures/gesture5.jpg)</center>

Compile and run the app. You can drag the image around the screen now!

<center>![](assets/complex-apps/gestures/gesture6.gif)</center>


### Handling Multiple Gesture Recognizers

Using the same technique, let's add pinch and rotation gesture recognizers. Drag and drop a **Pinch Gesture Recognizer** and a **Rotation Gesture Recognizer** onto the image view, and put these two functions inside ViewController.swift:

```swift
@IBAction func handlePinch(recognizer:UIPinchGestureRecognizer) {
  if let view = recognizer.view {
    view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    recognizer.scale = 1
  }
}
```

```swift
@IBAction func handleRotate(recognizer:UIRotationGestureRecognizer) {
  if let view = recognizer.view {
    view.transform = view.transform.rotated(by: recognizer.rotation)
    recognizer.rotation = 0
  }
}
```

Every view has a transform that is applied to it, which you can think of as information on the rotation, scale, and translation that should be applied to the view. Apple has a lot of built in functions to make working with a transform easy, such as `CGAffineTransform(scaleX: y:)` to scale a given transform and `CGAffineTransform(rotationAngle:)` to rotate a given transform. Here, we use these to update the view’s transform based on the gesture.

Again, since we’re updating the view each time the gesture updates, it’s very important to reset the scale and rotation back to the default state so things don't zoom or rotate into oblivion.

Go back into Main.storyboard, and link the two recognizers to the View Controller by ctrl-dragging and specifying our function as the sent action (as we have done before). Compiling and running our app shows that we can now drag, rotate, and pinch our image!

<center>![](assets/complex-apps/gestures/gesture7.gif)</center>

Notice that we can only perform one gesture at a time - if we've begun the pinch gesture, we can't start the rotation gesture at the same time. By default, once one gesture recognizer on a view “claims” the gesture, no others can recognize a gesture from that point on. This makes for some pretty awkward user interaction!

Luckily, we can change this by overriding a function in the `UIGestureRecognizer` delegate. To do that, we'll need create an extension of `ViewController` and adopt it to the `UIGestureRecognizerDelegate`. Place this below your `ViewController` class in ViewController.swift:

```swift
extension ViewController: UIGestureRecognizerDelegate {

}
```

Inside, we'll implement one of the delegate's optional functions, `shouldRecognizeSimultaneouslyWith`

```swift
func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
  return true
}
```

This function tells the gesture recognizer whether it is OK to recognize a gesture if another (given) recognizer has already detected a gesture. The default implementation always returns false, but we switch it here to always return true.

Next, open Main.storyboard, and for each gesture recognizer connect its delegate outlet to the View Controller.

<center>![](assets/complex-apps/gestures/gesture8.gif)</center>

Build and run the app again, and now we should be able to drag the image, pinch to scale it, and continue dragging afterwards! We can even scale and rotate at the same time in a natural way. 

<center>![](assets/complex-apps/gestures/gesture9.gif)</center>


