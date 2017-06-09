var gulp = require('gulp');
var tags = require('gulp-javascript-ctags');

gulp.task('jsctags', function () {
    return gulp.src([
            'assets/js/**/*.js'
            ])
        .pipe(tags('tags')) // filename of the output tags file
        .pipe(gulp.dest('./'));
});
