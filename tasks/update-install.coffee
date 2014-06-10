fs = require 'fs'
path = require 'path'
cheerio = require 'cheerio'

module.exports = (grunt) ->
  grunt.registerTask 'updateInstall', 'Updates the nuspec for chocolatey', ->
    pkg = grunt.config 'pkg'
    installScriptPath = 'chocolatey/tools/chocolateyInstall.ps1'
    versionExp = /(download\/v)[.0-9]*\//i
    installScript = grunt.file.read installScriptPath
    installScript = installScript.replace versionExp, '$1' + pkg.version + '/'
    grunt.file.write installScriptPath, installScript
