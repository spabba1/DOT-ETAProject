var gulp    = require('gulp');
var eslint  = require('gulp-eslint');
var config  = require('../../config').eslint;

/**
 * Check JavaScript sytax with JSHint
 */
gulp.task('eslint', function() {
  return gulp.src(config.src)
    // eslint() attaches the lint output to the eslint property of the file
    // object so it can be used by other modules.
    .pipe(eslint())
    // eslint.format() outputs the lint results to the console.
    // Alternatively us eslint.formatEach() (see Docs).
    .pipe(eslint.format())
    // To have the process exit with an error code (1) on lint error, return
    // the stream and pipe to failAfterError last.
    .pipe(eslint.failAfterError());
});
