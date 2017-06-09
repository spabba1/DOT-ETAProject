import gulp from 'gulp';
//import glob from 'glob';
//import htmlreplace from 'gulp-html-replace';
/*import useref from 'gulp-useref';*/

var config = require('../../config').html;

gulp.task('html', () => {
    /*var assets = useref.assets();*/

    return gulp.src(config.src)
    /*.pipe(assets)
      .pipe(assets.restore())
      .pipe(useref())*/
    .pipe(gulp.dest(config.dest));
})
