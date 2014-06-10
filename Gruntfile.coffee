fs = require 'fs'
path = require 'path'

module.exports = (grunt) ->
  grunt.loadTasks('tasks')
  grunt.initConfig
    pkg: grunt.file.readJSON '../atom/package.json'
  grunt.registerTask('update', ['updateNuspec', 'updateInstall'])
  grunt.registerTask('default', ['update'])
