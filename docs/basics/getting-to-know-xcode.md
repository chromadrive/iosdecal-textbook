---
id: getting-to-know-xcode
title: Getting to Know Xcode
sidebar_label: Getting to Know Xcode
---

## Section 1


Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed rutrum tellus, a pellentesque mi. Pellentesque quis auctor arcu. In hac habitasse platea dictumst. Cras in quam dolor. Fusce egestas, sem sit amet ullamcorper blandit, turpis tortor dictum libero, id sodales turpis ex in ipsum. Ut et dolor faucibus orci tincidunt condimentum non in turpis. Ut accumsan ex nec mi vestibulum luctus. Praesent dolor ipsum, faucibus et enim eget, pharetra ullamcorper sem. Quisque viverra justo eget mauris placerat accumsan. Nunc gravida eget turpis et congue. Cras pretium rutrum erat a condimentum. Aliquam at neque lobortis, vulputate eros at, mollis massa.

## Section 2

```swift
@IBAction func showMessage(sender: UIButton) {

    // Initialize the dictionary for the emoji icons
    // If you forgot how to do it, refer to the previous chapter
    // Fill in the code below




    // The sender is the button that is tapped by the user.
    // Here we store the sender in the selectedButton constant
    let selectedButton = sender

    // Get the emoji from the title label of the selected button
    if let wordToLookup = selectedButton.titleLabel?.text {

        // Get the meaning of the emoji from the dictionary
        // Fill in the code below



        // Change the line below to display the meaning of the emoji instead of Hello World
        let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
```