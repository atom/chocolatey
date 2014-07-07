module.exports = (grunt) ->
  grunt.registerTask 'uninstall', ->
    cuninst = grunt.config 'cuninst'
    done = @async()
    grunt.util.spawn cuninst, (error, output, code) ->
      grunt.log.error error if error
      grunt.log.writeln output if output
      done(error)
