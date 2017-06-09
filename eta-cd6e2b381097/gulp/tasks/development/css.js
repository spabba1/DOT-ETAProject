import gulp from 'gulp';
import size from 'gulp-size';

var config = require('../../config').css;

gulp.task('css', () => {
    gulp.src(config.src)
    .pipe(gulp.dest(config.dest))
    .pipe(size({title: 'copy css'}));
})
