---
id: contributing
title: Contributing to this Book
sidebar_label: Contributing to this Book
---

## Editing This Book

This book is written using Markdown. If you aren't familiar with Markdown yet, please read [this guide](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) to get acquainted with the basics.

1) Install (or upgrade) [Node](https://nodejs.org/en/download/) and [Yarn](https://yarnpkg.com/en/docs/install)
2) Clone [the textbook repo](https://github.com/chromadrive/iosdecal-textbook) into a directory of your choosing, and `cd` into the `website` folder
3) Install Docusaurus using npm: `npm install docusaurus`

All existing sections are located in the `docs/` folder. To edit an existing section, just open the corresponding Markdown file and start editing!

### Adding New Sections
To add a section, create a new .md file in the appropriate location, and include this small header at the top of each Markdown file (here's an example):

```
---
id: swift-intro
title: Introduction to Swift
sidebar_label: Introduction to Swift
---
```

Then, update `sidebars.json` with the appropriate structure changes - usually just adding the `id` to the appropriate location under a section heading.

### Running the Site

To load the site locally, run `npm start` and go to http://localhost:3000 in your browser. It will autoupdate with any changes you make to the `docs/` folder while it is running, so you can preview your article as you write it!

### Deploying the Site

Make sure you have contributor access to the repo first, and that [GitHub SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) are set up properly on your computer. 

When you want to deploy to Github Pages, run `./deploy_site.sh`. You may need to run `chmod u+x deploy_site.sh` first to give it proper permissions.

See the [project repo's `README.md`](https://github.com/chromadrive/iosdecal-textbook) for more details.

### [new!] Minor Edits

At the top right of each section is an "Edit" button. Clicking that will take you to the Github editor. Once you're done, enter a meaningful commit message and click "commit changes"!


## Style Guidelines

### Tips for Writing Sections

 - **Each section should begin with an introduction to the topic and a link to the Apple documentation**. The introduction can be as long or as short as you think is necessary to introduce the concept of the topic.
 - **Each section** (with some exceptions) **should include a demo**. This demo should be roughly in the style of a lecture demo - it doesn't need to be particularily polished, but it helps if it's easy to follow and understand. Write instructions to be detailed enough such that someone who is new to the topic can follow what's going on, and use images/animated gifs liberally (see below)
 - **Sections should include as many images as necessary to get the point across!** Images should be placed in `docs/assets/` under the folder of the section you're currently working in, and preferably be in either .jpg or .gif format for faster loading.  
 - (Optional) **A conclusion/summary is optional, but very much appreciated.** Conclusions are often quite tricky to write and might be a bit of a waste of space on shorter or more reference-oriented sections, but students may appreciate the core concepts of the intro/demo summarized for them at the end 


### Formatting
**Headers**

Use only second- and third- level headers in sections, as those are the only ones that will show up on the right sidebar. Feel free to break 

**Code Blocks**

When inserting a code block, make sure to specify the language as Swift in order to get the code highlighting to work properly!

<code>
\`\`\`swift<br>
print("Hello world!")<br>
\`\`\`
</code>

```swift
print("Hello world!")
```

**Images**

Non-inline images should always be inserted centered for readability purposes. This can be achieved using the `<center>` HTML tag:

```
<center>![](assets/demo.png)</center>
```
<center>![](assets/demo.png)</center>


**Notices/Alerts**

If you'd like to create a "note" for the reader, use the blockquote format:

```
> **Note**: Documentation for Table View can be found [here](https://developer.apple.com/documentation/uikit/uitableview) 
```

> **Note**: Documentation for Table View can be found [here](https://developer.apple.com/documentation/uikit/uitableview) 








