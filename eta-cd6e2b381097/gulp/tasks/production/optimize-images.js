import gulp from 'gulp';
import imagemin from 'gulp-imagemin';
import size from 'gulp-size';

var config   = require('../../config').optimize;

/**
 * Copy and minimize image files
 */
gulp.task('optimize:images', function() {
  return gulp.src(config.images.src)
    .pipe(imagemin(config.images.options))
    .pipe(gulp.dest(config.images.dest))
    .pipe(size());
});
