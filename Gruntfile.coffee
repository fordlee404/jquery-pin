module.exports=(grunt)->
  # Project configuration
  grunt.initConfig {
    pkg: grunt.file.readJSON 'package.json'
    watch:
      coffeecompile:
        files: ['jquery-pin.coffee']
        tasks: ['coffee:compile']
      javascript:
        files: ['jquery-pin.js']
        tasks: ['jshint:all']
    clean: ['jquery-pin.js','jquery-pin.min.js']
    coffee:
      compile:
        options:
          bare: true
          join: false
        files: {
          'jquery-pin.js': 'jquery-pin.coffee'
        }
    jshint:
      all:
        options:
          jshintrc: true
        files:
          src: ['jquery-pin.js']
  }
  # Loading Grunt plugins and tasks
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  # Custom tasks
  grunt.registerTask 'default',['watch']
