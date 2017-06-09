import gulp from 'gulp';
import uglify from 'gulp-uglify';
import size from 'gulp-size';

var config = require('../../config').optimize;

/**
 * Copy and minimize JS files
 */
gulp.task('optimize:js', function() {
  return gulp.src(config.js.src)
    .pipe(uglify(config.js.options))
    .pipe(gulp.dest(config.js.dest))
    .pipe(size());
});
