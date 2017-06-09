import gulp from 'gulp';

var config = require('../../config').copyfonts;

/**
 * Copy fonts to folder
 */
gulp.task('copy:fonts', ['fontcustom'], function() {
  return gulp.src(config.development.src)
    .pipe(gulp.dest(config.development.dest));
});
