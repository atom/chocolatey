module.exports = (grunt) ->
  grunt.registerTask 'install', ->
    cinst = grunt.config 'cinst'
    done = @async()
    grunt.util.spawn cinst, (error, output, code) ->
      grunt.log.error error if error
      grunt.log.writeln output if output
      done(error)
