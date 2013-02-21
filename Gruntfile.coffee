grunt = require 'grunt'

gruntConfig =
  pkg: grunt.file.readJSON('package.json')

  reload: {}

  clean:
    public: ["public"]

  jaded:
    app:
      expand: true
      cwd: "client/templates"
      src: [ "*.jade" ]
      dest:  "public/templates"
      options:
        amd: true
        development: false
        rivets: false

  coffee:
    app:
      expand: true
      cwd: "client/js/"
      src: [ "*.coffee", "*.js" ]
      dest:  "public/js/"
      ext: ".js"
      options:
        bare: true

    views:
      expand: true
      cwd: "client/js/views"
      src: [ "*.coffee", "*.js" ]
      dest:  "public/js/views"
      ext: ".js"
      options:
        bare: true

    layouts:
      expand: true
      cwd: "client/js/layouts"
      src: [ "*.coffee", "*.js" ]
      dest:  "public/js/layouts"
      ext: ".js"
      options:
        bare: true

    models:
      expand: true
      cwd: "client/js/models"
      src: [ "*.coffee", "*.js" ]
      dest:  "public/js/models"
      ext: ".js"
      options:
        bare: true

    vendor:
      expand: true
      cwd: "client/js/vendor"
      src: [ "*.coffee" ]
      dest:  "public/js/vendor"
      ext: ".js"
      options:
        bare: true

  copy:
    dist:
      files: [
        expand: true
        src: ["**"]
        dest: "public/js/vendor/"
        cwd: "client/js/vendor"
      ,
        expand: true
        src: ["**"]
        dest: "public/css"
        cwd: "client/css"
      ,
        expand: true
        src: ["**"]
        dest: "public/img"
        cwd: "client/img"
      ,
        src: "client/index.html"
        dest: "public/index.html"
      ]

  watch:
    client: 
      files: [
        "client/js/vendor/**",
        "client/css/**",
        "client/img/**",
        "client/index.html"
      ]
      tasks: ["copy", "reload"]
      options:
        debounceDelay: 100

    templates:
      files: ["<%= jaded.app.src %>"]
      tasks: ["jaded", "reload"]
      options:
        debounceDelay: 100

    coffee:
      files: [
       "<%= coffee.app.src %>",
       "<%= coffee.views.src %>",
       "<%= coffee.models.src %>",
       "<%= coffee.layouts.src %>",
       "<%= coffee.vendor.src %>"
      ]
      tasks: ["coffee", "reload"]
      options:
        debounceDelay: 100

  globals:
    exports: true

module.exports = (grunt) ->
  ## init config 
  grunt.initConfig gruntConfig

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-jaded"
  grunt.loadNpmTasks "grunt-reload"

  ## default 
  grunt.registerTask "default", ["clean",
    "copy","coffee",
    "jaded","start",
    "reload","watch"]

  ## start
  grunt.registerTask "start", "start up servers", ->
    grunt.log.writeln "Starting server..."
    server = require "./server/start"