fs = require 'fs'
path = require 'path'
cheerio = require 'cheerio'

module.exports = (grunt) ->
  grunt.registerTask 'updateNuspec', 'Updates the nuspec for chocolatey', ->
    pkg = grunt.config 'pkg'
    nuspecPath = 'chocolatey/atom.nuspec'
    nuspec = grunt.file.read nuspecPath
    $ = cheerio.load nuspec,
      xmlMode: true
    $('version').text pkg.version
    grunt.file.write nuspecPath, $.xml()
