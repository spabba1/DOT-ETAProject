import gulp from 'gulp';
import htmlmin from 'gulp-htmlmin';
var config  = require('../../config').optimize;

/**
 * Minimize HTML
 */
gulp.task('optimize:html', function() {
  return gulp.src(config.html.src)
    .pipe(htmlmin(config.html.options))
    .pipe(gulp.dest(config.html.dest));
});
