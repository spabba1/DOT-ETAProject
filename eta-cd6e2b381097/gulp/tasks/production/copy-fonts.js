import gulp from 'gulp';

var config = require('../../config').copyfonts;

/**
 * Copy fonts to folder
 */
gulp.task('copy:fonts:production', function() {
  return gulp.src(config.production.src)
    .pipe(gulp.dest(config.production.dest));
});
