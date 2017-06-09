var gulp     = require('gulp');
var csslint = require('gulp-csslint');
var config   = require('../../config').pdfcsslint;

gulp.task('pdfcsslint', function() {
  return gulp.src(config.src)
    .pipe(csslint(config.options))
    .pipe(csslint.reporter());
});
