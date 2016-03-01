var gulp        = require('gulp')
  , uglify      = require('gulp-uglify')
  , concat      = require('gulp-concat')
  , jade        = require('gulp-jade')
  , stylus      = require('gulp-stylus')
  , connect     = require('gulp-connect')
  , gulpif      = require('gulp-if');

var env = process.env.NODE_ENV || 'development';

var outputPath = 'builds/' + env;

gulp.task('jade', function() {
  return gulp.src( 'src/templates/**/*.jade' )
    .pipe( jade({
      pretty: env === 'development'
    }) )
    .pipe( gulp.dest(outputPath) )
    .pipe( connect.reload() );
});

gulp.task('css', function() {
  return gulp.src('src/styles/*.styl')
    .pipe( stylus({
      whitespace: true,
      compress: env === 'development'
    }) )
    .pipe( concat('css.min.css') )
    .pipe( gulp.dest(outputPath) )
    .pipe( connect.reload() );
});


gulp.task('js', function() {
  gulp.src( 'src/scripts/*.js' )
    .pipe( concat('all.min.js') )
    .pipe( gulpif(env === 'production', uglify()) )
    .pipe( gulp.dest(outputPath) )
    .pipe( connect.reload() );
});


gulp.task('watch', function() {
  gulp.watch( 'src/styles/**/*.styl', ['css'] );
  gulp.watch( 'src/scripts/**/*.js', ['js'] );
  gulp.watch( 'src/templates/**/*.jade', ['jade'] );
});

gulp.task('connect', function() {
  connect.server({
    root: [outputPath],
    port: 3000,
    livereload: true
  })
});

gulp.task('default', ['js', 'css', 'jade', 'watch', 'connect']);

