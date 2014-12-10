This repository contains source code and templates for building a
[Chocolatey](http://chocolatey.org) package for [Atom](http://atom.io).
The package can be downloaded from the
[Atom package page](https://chocolatey.org/packages/Atom).

The Atom Chocolatey package simply kicks off the `AtomSetup.exe` installer.

## Building

To build an Atom chocolatey package, you'll need access to a Windows machine
with the following tools:

### Requirements

+ [Chocolatey](http://chocolatey.org/)
  + You will need to close and reopen your command prompt or PowerShell window
    after installing.
+ [node.js 0.10.x](http://nodejs.org/)
+ [Grunt](http://gruntjs.com/)
+ Run `apm install language-powershell` to add PowerShell syntax
  highlighting to Atom (optional).

You will also need output from a Windows build of
[Atom](http://github.com/atom/atom/releases) published as a release or
otherwise hosted in a zip archive.

### Instructions

1. Clone this repository
2. Publish an Atom release that includes an `atom-windows.zip` file
3. Build the Atom `.nupkg` file

    ```bash
    npm install
    grunt
    ```

4. Install the package locally (optional):

    ```bash
    grunt reinstall
    ```

### Publishing

Follow [these](https://github.com/chocolatey/chocolatey/wiki/CommandsPush)
instructions to setup your API key so you can publish. You can find
your API key in your chocolatey [account page](https://chocolatey.org/account).

Once you've built the `.nupkg` file you can push it up the chocolatey by
running:

```
cpush .\Atom.0.XXX.0.nupkg
```
