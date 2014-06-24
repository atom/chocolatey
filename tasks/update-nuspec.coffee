cheerio = require 'cheerio'

module.exports = (grunt) ->
  grunt.registerTask 'updateNuspec', 'Updates the nuspec for chocolatey', ->
    release = grunt.config 'release'
    nuspecPath = 'chocolatey/atom.nuspec'
    nuspec = grunt.file.read nuspecPath
    $ = cheerio.load nuspec,
      xmlMode: true
    $('version').text release.tag_name.replace 'v', ''
    grunt.file.write nuspecPath, $.xml()
