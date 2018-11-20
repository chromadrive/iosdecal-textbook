# iOS Development DeCal // Textbook

**Currently maintained by David/Ents ([@chromadrive](https://github.com/chromadrive))**

## Getting Started

This textbook is written using Markdown, and uses Facebook's [Docusaurus](https://github.com/facebook/Docusaurus) to generate static webpages. See [their getting started documentation](https://docusaurus.io/docs/en/installation) here for more information.

1) Install (or upgrade) [Node](https://nodejs.org/en/download/) and [Yarn](https://yarnpkg.com/en/docs/install)
2) `cd` into the `website` folder
3) Install Docusaurus using npm: `npm install docusaurus`
4) To load the site, run `npm start` and go to http://localhost:3000 in your browser

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

Docusaurus supports automatically pushing to a `gh-pages` branch in a repo! First make sure that [GitHub SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) are set up properly on your computer and that you have edit permissions in the repo. When you want to deploy, check that the details in `website/siteConfig.js` are accurate, and then run `./deploy_site.sh`. You may need to run `chmod u+x deploy_site.sh` first to give it proper permissions.


You could also do it manually - more information [here](https://github.com/facebook/Docusaurus/blob/master/docs/getting-started-publishing.md).


## TODO:
- Write GH-Wiki article on contributing and style guidelines, and reference it in this readme.
- Figure out how to allow others to contribute!
- Figure out reliable (but not massive) way to host images
- Colors and logo?
- Implement [Algolia Docsearch](https://community.algolia.com/docsearch/)
- Before actual deployment on class website, change lines 25-41 of siteConfig.js to reflect new subdomain