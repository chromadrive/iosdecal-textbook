---
id: contributing
title: Contributing to this Book
sidebar_label: Contributing to this Book
---

## Markdown

If you aren't familiar with Markdown yet, please read [this guide](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) to get acquainted with the basics.

## Style Guidelines

### Code Blocks

When inserting a code block, make sure to specify the language as Swift in order to get the code highlighting to work properly!

<code>
\`\`\`swift<br>
print("Hello world!")<br>
\`\`\`
</code>

```swift
print("Hello world!")
```

### Images

Images should be placed in `docs/assets/` under the folder of the section you're currently working in. Non-inline images should always be inserted centered for readability purposes. This can be achieved using the `<center>` HTML tag:

```
<center>![](assets/demo.png)</center>
```
<center>![](assets/demo.png)</center>

### Notices/Alerts

If you'd like to create a "note" for the reader, use the blockquote format:

```
> **Note**: Documentation for Table View can be found [here](https://developer.apple.com/documentation/uikit/uitableview) 
```

> **Note**: Documentation for Table View can be found [here](https://developer.apple.com/documentation/uikit/uitableview) 








