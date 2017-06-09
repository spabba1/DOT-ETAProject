import gulp from 'gulp';

const config = require('../../config').images;

gulp.task('images', () => {
  gulp.src(config.src)
    .pipe(gulp.dest(config.dest));
})
