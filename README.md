This repository contains source code and templates for building a [Chocolatey](http://chocolatey.org)
package for [Atom](http://atom.io).

The install script does the following:

  * Installs [apm](https://github.com/atom/apm) to the `Chocolatey\bin` folder
  * Adds an Atom desktop shortcut
  * Adds an Atom start menu shortcut inside the *GitHub Inc.* folder
  * Adds an *Open with Atom* context menu in the Explorer

## Building

To build an Atom chocolatey package, you'll need access to a Windows machine
with the following tools:

### Requirements
+ [Chocolatey](http://chocolatey.org/)
+ [node.js 0.10.x](http://nodejs.org/)
+ [Grunt](http://gruntjs.com/)
+ Run `apm install language-powershell` to add PowerShell syntax
  highlighting to Atom (optional).

You will also need output from a Windows build of [Atom](http://github.com/atom/atom)
published as a release or otherwise hosted in a zip archive.

### Instructions
1. Clone this repository (as a sibling to your Atom working copy)
2. Publish an Atom release including binary output for Windows
3. Execute grunt update and pack tasks (default)

    ```bash
    npm install
    grunt
    ```

4. Install the package locally (optional):

    ```bash
    grunt reinstall
    ```

5. Publish the package (optional):

    ```bash
    chocolatey push [output.nupkg] -ApiKey [apikey]
    ```
