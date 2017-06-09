'use strict';
var config = require('../../config').coldfusion;
var gulp = require('gulp');

gulp.task('coldfusion', function () {
    return gulp.src(config.src)
        .pipe(gulp.dest(config.dest));

});

