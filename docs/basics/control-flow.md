---
id: control-flow
title: Control Flow
sidebar_label: Control Flow
---

Use `if` and `switch` to form conditionals, and use `for ... in`, `for`, `while`, and `repeat ... while` to form loops. The syntax here is very similar to that of Python - so if you're familiar with Python's control structures you're halfway there!

## For and If

Parentheses around the condition or loop variable are optional, and braces around the body are required.

```swift
let individualScores = [10, 3, 6, 1, 2]

var teamScore = 0
for score in individualScores {
	if score > 5 {
		teamScore += 2
	} else {
		teamScore += 1
	}
}
```

## Range Operators

Use `..<` to make a range that omits its upper value, and use `...` to make a range that includes both values

```swift
var a = 10
var b = 12

let inclusiveRange = a...b 	// includes integers 10,11 and 12

let exclusiveRange = a..<b 	// only includes 10 and 11
```

## Switch

Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.

```swift
let numPeople = 3

switch numPeople{
	case 0:
		print("So lonely...")
	case 1, 2:
		print("Some people showed up, but not enough")
	case 3, 4, 5:
		print("This is a good number of people")
	default:
		print("Too many people!")
}
```

After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of
each case’s code.

## For ... In

You use `for ... in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair:

```swift
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largestNum = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largestNum {
            largestNum = number
            largestKind = kind
        }
    }
}

largestKind		// returns "Square"
```

## While and Repeat ... While

Use `while` to repeat a block of code until a condition changes. 

```swift
var n = 2
while n < 100 {
n = n * 2
}

n 		// returns 128
```

If you want, you can place the condition of a `while` loop can be at the end instead (preceded by `repeat`), ensuring that the loop is run at least once. This is the same as a `do ... while` loop in other languages.

```swift
var m = 2
repeat {
m = m * 2
} while m < 100

m 		// also returns 128
```

