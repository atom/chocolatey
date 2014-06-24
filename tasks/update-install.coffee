module.exports = (grunt) ->
  grunt.registerTask 'updateInstall', 'Updates the nuspec for chocolatey', ->
    release = grunt.config 'release'
    installScriptPath = 'chocolatey/tools/chocolateyInstall.ps1'
    versionExp = /(download\/)v[.0-9]*\//i
    installScript = grunt.file.read installScriptPath
    installScript = installScript.replace versionExp, '$1' + release.tag_name + '/'
    grunt.file.write installScriptPath, installScript
