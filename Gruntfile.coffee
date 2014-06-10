path = require 'path'

module.exports = (grunt) ->
  grunt.loadTasks('tasks')

  packageJsonPath = '../atom/package.json'
  unless grunt.file.isFile(packageJsonPath)
    packageJsonPath = path.resolve('/atom/package.json')

  grunt.initConfig
    pkg: grunt.file.readJSON(packageJsonPath)

  grunt.registerTask('update', ['updateNuspec', 'updateInstall'])
  grunt.registerTask('default', ['update'])
