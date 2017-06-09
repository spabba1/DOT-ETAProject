'use strict';
import gulp from 'gulp';

var config = require('../../config').copynode;

gulp.task('copy:node', function() {
  return gulp.src(config.src)
    .pipe(gulp.dest(config.dest));
});
