gulp       = require 'gulp'
browserify = require 'gulp-browserify'
webserver  = require 'gulp-webserver'
plumber = require 'gulp-plumber'
rename = require 'gulp-rename'
handleErrors = (error) ->
  console.error 'Error:', error.message

gulp.task 'scripts', ->
  gulp.src 'src/app.cjsx', read: false
    .pipe plumber()
    .pipe browserify
      transform: ['coffee-reactify']
      extensions: ['.cjsx']
      debug: !gulp.env.production
    .pipe rename 'app.js'
    .pipe gulp.dest 'dist'

gulp.task 'html', ->
  gulp.src 'index.html'
    .pipe gulp.dest 'dist'

gulp.task 'webserver', ->
  gulp.src 'dist'
      .pipe webserver
        host: '0.0.0.0'
        port: 3005
        livereload: false
        directoryListing: false
        open: false
        fallback: 'index.html'

gulp.task 'default', ['scripts', 'html']

gulp.task 'watch', ['default', 'webserver'], ->
  gulp.watch ['./src/**/*.cjsx', 'package.json'], ['scripts']
  gulp.watch ['index.html'], ['html']
