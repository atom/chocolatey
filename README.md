This repository contains source code and templates for building a [Chocolatey](http://chocolatey.org) package for [Atom](http://atom.io).

To build an Atom chocolatey package, you'll need access to a Windows machine with the following tools:

### Requirements
+ [Chocolatey](http://chocolatey.org/)
+ [node.js 0.10.x](http://nodejs.org/)
+ [Grunt](http://gruntjs.com/)

#### You will also need output from a Windows build of [Atom](http://github.com/atom/atom) published as a release or otherwise hosted in zip archive.

### Instructions
1. Clone this repository (as a sibling to your Atom working copy)
1. Publish an Atom release including binary output for Windows
1. Execute grunt update and pack tasks (default)

    ````bash
    npm install
    grunt
    ````
