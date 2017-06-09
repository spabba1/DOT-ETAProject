import gulp from 'gulp';
import cssnano from 'gulp-cssnano';
import size from 'gulp-size';

var config = require('../../config').optimize;

/**
 * Copy and minimize CSS files
 */
gulp.task('optimize:css', function() {
  return gulp.src(config.css.src)
    .pipe(cssnano())
    .pipe(gulp.dest(config.css.dest))
    .pipe(size());
});
