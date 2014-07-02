module.exports = (grunt) ->
  grunt.registerTask 'install', ->
    cinst = grunt.config 'cinst'
    done = @async()
    grunt.util.spawn cinst, (err, output, code) ->
      grunt.log.error err unless !err
      grunt.log.writeln output unless !output
      done()
