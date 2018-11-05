---
id: intro-to-swift
title: Introduction to Swift
sidebar_label: Introduction to Swift
---

The remainder of this chapter will be a crash-course through Swift. Swift began development in 2010 and was first released in 2014, making it one of the newest languages on the block. The language ideas for Swift were taken from Rust, Ruby, Haskell, C#, CLU, Python, Go, and a range of other programming languages, so if you're familiar with any of those you may be able to draw some parallels.

Prior to the announcement of Swift, iOS apps were primarily written in Objective-C. The language has been around for more than 20 years and was chosen by Apple as the primary programming language for Mac and iOS development. However, Objective-C was pretty hard to learn and had non-standard syntax, which scared off a lot of beginners from getting started with iOS development.

The release of Swift programming language is probably Apple's answer to some of these comments - the syntax is much cleaner and easier to read, and it's [open source](https://github.com/apple/swift) too!

## Swift Playgrounds

I don't want to bore you by just showing you the code. There is no better way to explore coding than actually writing code. Xcode has a built-in feature called *Playgrounds*. It's an interactive development environment for developers to experiment Swift programming and allows you to see the result of your code in real-time - a bit like a Jupyter Notebook for Python but fancier.

When you start up Xcode, you can create a Playground by selecting "Get Started with a Playground" in the startup dialog and choosing a template ("Blank" usually suffices).

Once you save the file somewhere, Xcode opens the Playground interface:

<center>![](assets/basics/xcode_playground.png)</center>

The left pane of the screen is an editor area where you can write code. When you want to test your code and see how it works, hit the Play button. Playground immediately interprets the code (up to the line of the Play button) and displays the result on the right pane.

Let's get started!

## Hello World!

As is computing tradition, let's start with a simple "hello world" program. We can do this in one line using Swift:

```swift
print("Hello World!")
```

If you have experience with pretty much any programming language out there, this syntax probably looks familiar to you - Swift's "hello world" is actually exactly the same as Python 3's!

This and the following couple of sections will hopefully give you enough information to start writing code in Swift by showing you how to accomplish a variety of basic programming tasks. For the best learning experience, open a Swift Playground in Xcode and follow along with the code!

## Variables and Constants

Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you can only assign it a value once! This means you can use constants to name a value that you determine once but use in many places.

```swift
var myVariable = 42
myVariable = 50
```

```swift
let myConstant = 42
// myConstant = 50 would be invalid!
```

A constant or variable must have the same type as the value you want to assign to it. However, much like Python and Javascript, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the
compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is a integer.

If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon:

```swift
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
```

Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.

```swift
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
```

Alternatively, there’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. For example:

```swift
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
```

## Arrays and Dictionaries

Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets.

```swift
var shoppingList = ["cheese", "eggs", "donuts"]
shoppingList[1]		// returns "eggs"
shoppingList[1] = ["pizza"]
// shoppingList is now ["cheese", "pizza", "donuts"] 
```

```swift
var phones = [
	"David": "Android",
	"RJ": "iOS",
]
phones["Kevin"] = "iOS"
```

To create an empty array or dictionary, use the initializer syntax:

```swift
let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()
```

If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`. This might happen when you set a new value for a variable or pass an argument to a function.

```swift
emptyArray = []
```
