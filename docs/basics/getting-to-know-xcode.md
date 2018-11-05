---
id: getting-to-know-xcode
title: Getting to Know Xcode
sidebar_label: Getting to Know Xcode
---

Xcode is Apple's first-party IDE (Integrated Development Environment), and it contains a bunch of software development tools for developing macOS, iOS, watchOS, and tvOS apps.

## Installing Xcode

We'll be using the latest version of Xcode and Swift in this class, so make sure your Mac is up-to-date in terms of software updates! Xcode is available on the Mac App store ([link here](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)) - it's a fairly large download, so make sure you have the space for it!

Xcode should automatically install its command line tools so you can compile and debug your code, but if it doesn't automatically install, you can run `xcode-select --install` in Terminal and follow the instructions there.

You can also download it manually if you don’t have the Mac App Store - it's also available on the [Apple Developer](https://developer.apple.com/xcode/).

## The Xcode Interface

Here's the [full documentation for Xcode](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/), it may be useful if you'd like to go a bit more into detail than what's written here. Feel free to skip this section and go on to the next one if you're already familiar with the Xcode interface, this section is primarily intended to be used as reference later on.

This is what the interface looks like when you're writing code for an Xcode project (`.xcodeproj`) - there are 4 major areas: the Navigator, Editor, Debug Area and Utility Areas:

<center>![](assets/basics/xcode_interface.jpg)</center>

### Navigator Area

This is where you’ll see all the files associated with your project. If you click on a file in the project navigator, it will display the file’s contents in the Editor area.

<center>![](assets/basics/xcode_navigator.jpg)</center>

You can right click on the project navigator and create new files or add existing files to your project, or you can drag folders or files from your computer directly onto the project navigator and a dialog will pop up asking how you want to add the files.

The root node of the project navigator is your Xcode project file (indicated by the blue icon). If you click that, the project properties will open in the editor area. You can use that area to set your app's properties, such as its name, deployment targets, orientation modes, etc.

### Editor Area

The editor area is where we’ll probably be spending most of our time! This is where all the coding happens.

<center>![](assets/basics/xcode_editor.jpg)</center>

Notice the navigation bar along the top of the editor area - this is know as the Jump Bar and is another way to quickly get to the file you need. It looks like a breadcrumb at the top of the editor area:

<center>![](assets/basics/xcode_jumpbar.jpg)</center>

If you click the tail segment of the jump bar (which is the current file you’re looking at), it will open up a menu showing you all the methods in the file which is not only useful to jump to another area within the file, but it will show you at a glance what methods are available in this file.

<center>![](assets/basics/xcode_jumpbar_tail.jpg)</center>

The editor area also has three different views, and you can toggle between them with the set of buttons in the upper right corner:

<center>![](assets/basics/xcode_editor_views.jpg)</center>

- The left most button is for the single editor pane view. This is probably what you'll be working in most of the time

- The middle button is the Assistant Editor view which will show you the accompanying file to the file you’re currently looking at. It looks like a two pane view.

- The right most button is the Version Editor view where you can compare two files. 

### Utility Area

The Xcode utility area is comprised of two panes: the inspector pane and the library pane. You'll usually have this hidden most of the time when you're coding, but it can come in handy when you're working with Storyboard / Interface Builder.

<center>![](assets/basics/xcode_utility.jpg)</center>

- The Inspector pane will give you details about the file you’ve got highlighted in your project navigator. 

- The Library pane won’t be very useful either until you’re looking at a XIB/StoryBoard file. When you’re using the Interface Builder part of Xcode, you can drag UI elements from the library pane onto the editor area to add that element to your user interface.

### Debug Area

The debug area will show you console output and the state of various variables when you run your application. You’ll be using this a lot while debugging your code and trying to figure out why things aren’t working out the way you expect them to!

<center>![](assets/basics/xcode_debug.jpg)</center>

### Toolbar

We’ve talked about some of the buttons on this tool bar already. Let’s start from the left.

<center>![](assets/basics/xcode_toolbar.jpg)</center>

The left-most button is the run button. This will build and run your application and launch your app in the iOS Simulator. The button beside it will stop the execution of your application and return you to Xcode.

The dropdown beside the Stop button allows you to choose your build target, be it an actual device or the iOS Simulator. If you see a listing for “iOS Device”, you can run your app on your device if you have it plugged in and [properly provisioned](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/YourFirstAppStoreSubmission/ProvisionYourDevicesforDevelopment/ProvisionYourDevicesforDevelopment.html).

And finally in the far right side of the toolbar, we have the editor view buttons, the buttons to toggle various Xcode panels on or off and the Organizer button.