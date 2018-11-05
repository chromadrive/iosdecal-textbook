---
id: functions-closures
title: Functions and Closures
sidebar_label: Functions and Closures
---

## Functions

Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.

Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.

```swift
func greet(name: String, city: String) -> String {
	return "Hello \(name), nice day in \(city) today."
}

// Call our function
greet(name: "David", city: "Berkeley")
// returns "Hello David, nice day in Berkeley today"
```

We can also use a tuple to return multiple values from a function.

```swift
func getOperatingSystems() -> (String, String) {
	return ("iOS", "Android")
}

getOperatingSystems() 	// returns ("iOS", "Android")
```

Functions can also take a variable number of arguments, collecting them into an array.

```swift
func sumOf(numbers: Int...) -> Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}

sumOf() 	// returns 0
sumOf(numbers: 42, 597, 12) 	// returns 651
```

Functions can be nested too. Nested functions have access to variables that were declared in the outer function.

```swift
func returnFifteen() -> Int {
	var y = 10
	func addFive() {
			y += 5
		}
	addFive()
	return y
}

returnFifteen() 	// returns 15 (what a shocker)
```

A function can take another function as one of its arguments.

```swift
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
	// Note: the "(Int) -> Bool" above refers to any function
	//    that takes in an Int and returns a Bool

	for item in list {
		if condition(item) {
			return true
		}
	}
	return false
}

func lessThanTen(number: Int) -> Bool {
	return number < 10
}

var numbers = [20, 19, 7, 12]


hasAnyMatches(list: numbers, condition: lessThanTen)  	// returns true
```

### A Note About Argument Labels

You may have noticed that in our function calls we include the name of the variable in front of the value we'd like to assign to it. Those are called "parameter names".

```swift
myFunction(arg1: 1, arg2: 2) // arg1 and arg2 are parameter names
```

In Swift, we can specify one label for use inside the function, and one for the function call. The one we specify for the function call is called the "argument label". The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent.

Here's an example of the `greet` function from earlier, but using an argument label:

```swift
func greet(name: String, from city: String) -> String {
    return "return "Hello \(name), nice day in \(city) today.""
}
greet(name: "David", from: "Berkeley")
// returns "Hello David, nice day in Berkeley today."
```

If you don’t want an argument label for a parameter, write an underscore (`_`) instead of an explicit argument label for that parameter.

```swift
func addFive(_ num: Int) -> Int{
	return num + 5
}

addFive(7) 		// returns 12
```

## Closures

Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages. 

**Functions are actually special cases of closures**! As such, closures take one of three forms:

- *Global functions* are closures that have a name and do not capture any values.

- *Nested functions* are closures that have a name and can capture values from their enclosing function.

- *Closure expressions* are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

You can write a closure expression by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body:

```swift
numbers.map({
	(number: Int) -> Int in
	let result = 3 * number
	return result
	})
```

There are a couple more ways to write closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement
closures implicitly return the value of their only statement.

```swift
numbers.map({ number in 3 * number })
```

You can refer to parameters by number instead of by name; this approach is especially useful in very short closures but it can lead to clutter if used improperly. A closure passed as the last argument to a function can appear immediately after the parentheses.

```swift
sort([1, 5, 3, 12, 2]) { $0 > $1 }
```