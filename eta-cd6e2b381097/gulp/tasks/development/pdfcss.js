import gulp from 'gulp';
import size from 'gulp-size';
import csslint from 'gulp-csslint';

var config = require('../../config').pdfcss;

gulp.task('pdfcss', () => {
    return gulp.src(config.src)

    .pipe(gulp.dest(config.dest))
    .pipe(size({title: 'copy pdf css'}));
})
