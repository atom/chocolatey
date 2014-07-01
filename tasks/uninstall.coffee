module.exports = (grunt) ->
  grunt.registerTask 'pack', ->
    cuinst = grunt.config 'cuninst'
    done = @async()
    grunt.util.spawn cuninst, (err, output, code) ->
      grunt.log.error err unless !err
      grunt.log.writeln output unless !output
      done()
