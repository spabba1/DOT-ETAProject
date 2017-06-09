var gulp     = require('gulp');
var scsslint = require('gulp-scss-lint');
var config   = require('../../config').pdfscsslint;

/**
 * Lint SCSS files
 * `gem install scss-lint` needed
 */
gulp.task('pdfscsslint', function() {
  return gulp.src(config.src)
    .pipe(scsslint(config.options));
});
