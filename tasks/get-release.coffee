https = require 'https'

module.exports = (grunt) ->
  grunt.registerTask 'get-release', ->
    releaseUrl = grunt.config 'releaseUrl'
    done = @async()
    json = ''
    https.get releaseUrl, (response) ->
      response.on 'data', (chunk) ->
        json += chunk
      response.on 'end', ->
        for release in JSON.parse(json) ? []
          for asset in release.assets ? [] when asset.name is 'atom-windows.zip'
            grunt.config 'release', release
            done()
            return
        done(new Error('No release found with an atom-windows.zip asset'))
