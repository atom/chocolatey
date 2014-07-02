https = require 'https'

module.exports = (grunt) ->
  grunt.registerTask 'getRelease', ->
    releaseUrl = grunt.config 'releaseUrl'
    done = @async()
    json = ''
    https.get releaseUrl, (response) ->
      response.on 'data', (chunk) ->
        json += chunk
      response.on 'end', ->
        [releaseJson] = JSON.parse json
        grunt.config 'release', releaseJson
        done()
