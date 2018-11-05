---
id: intro-to-swift
title: Introduction to Swift
sidebar_label: Introduction to Swift
---

As is computing tradition, let's start with a simple "Hello World" program. We can do this in one line using Swift:

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
