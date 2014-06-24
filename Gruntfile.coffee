path = require 'path'
https = require 'https'
releasesUrl =
  hostname: 'api.github.com',
  path: '/repos/atom/atom/releases?per_page=1',
  headers:
    'User-Agent': 'node.js/' + process.version

module.exports = (grunt) ->
  grunt.loadTasks('tasks')
  grunt.initConfig

  grunt.registerTask 'pack', () ->
    grunt.util.spawn

  grunt.registerTask 'getRelease', () ->
    done = this.async()
    json = ''
    console.log releasesUrl
    https.get releasesUrl, (response) ->
      response.on 'data', (chunk) ->
        json += chunk
      response.on 'end', () ->
        [releaseJson] = JSON.parse json
        console.log releaseJson.tag_name
        grunt.config 'release', releaseJson
        done()
  
  grunt.registerTask 'update', ['getRelease', 'updateNuspec', 'updateInstall']
  grunt.registerTask('default', ['update'])
