# iOS Development DeCal // Textbook

**Currently maintained by David/Ents ([@chromadrive](https://github.com/chromadrive))**

## Getting Started

This textbook is written using Markdown, and uses Facebook's [Docusaurus](https://github.com/facebook/Docusaurus) to generate static webpages. See [their getting started documentation](https://docusaurus.io/docs/en/installation) here for more information.

1) Install (or upgrade) [Node](https://nodejs.org/en/download/) and [Yarn](https://yarnpkg.com/en/docs/install)
2) `cd` into the `website` folder
3) To load the site, run `npm start` and go to http://localhost:3000 in your browser

## Writing Sections

First, include this small header at the top of each Markdown file (here's an example):

```
---
id: swift-intro
title: Introduction to Swift
sidebar_label: Introduction to Swift
---
```

Then, update `sidebars.json` with the appropriate structure changes.

Start new sections with second-level headers (`## Title`). First-level headers won't show up in the right sidebar. To denote code blocks, use the block code format (triple backtick) followed by "swift" for code highlighting.

## Deploying to Github-Pages

Docusaurus supports automatically pushing to a `gh-pages` branch in a repo! Check that the details in `website/siteConfig.js` are accurate, then run `npm run publish-gh-pages`. You may need to specify `GIT_USER` as an environment variable first though.

More information [here](https://github.com/facebook/Docusaurus/blob/master/docs/getting-started-publishing.md).


## TODO:
- Look into syntax highlighting and copying code blocks
- Theming???