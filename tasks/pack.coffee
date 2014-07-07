module.exports = (grunt) ->
  grunt.registerTask 'pack', ->
    cpack = grunt.config 'cpack'
    done = @async()
    grunt.util.spawn cpack, (error, output, code) ->
      grunt.log.error error if error
      grunt.log.writeln output if output
      done(error)
