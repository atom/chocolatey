module.exports = (grunt) ->
  grunt.registerTask 'pack', ->
    cpack = grunt.config 'cuninst Atom'
    done = @async()
    grunt.util.spawn cpack, (err, output, code) ->
      grunt.log.error err unless !err
      grunt.log.writeln output unless !output
      done()
