'use strict';
import gulp from 'gulp';
import browsersync from 'browser-sync';
import sass from 'gulp-ruby-sass';
import glob from 'glob';
import gulpFilter from 'gulp-filter';
import autoprefixer from 'gulp-autoprefixer';
import sourcemaps from 'gulp-sourcemaps';
import size from 'gulp-size';

const config = require('../../config');

/**
 * Generate CSS from SCSS
 * Build sourcemaps
 */
gulp.task('sass', function(callback) {
    var sassConfig = config.sass.options,
        sassQueue;

    sassConfig.onError = browsersync.notify;

    browsersync.notify('Compiling Sass');

    function reportFinished() {
        if (sassQueue) {
            sassQueue--;
            if (sassQueue === 0) {
                callback();
            }
        }
    }

    function sassCompile (filename) {
        sass(filename, sassConfig)
        .pipe(autoprefixer(config.autoprefixer))
        .pipe(sourcemaps.write('.', { includeContent: false }))
        .pipe(gulp.dest(config.sass.dest))
        .on('finish', reportFinished);
    }

    glob(config.sass.src, function (er, files) {
        sassQueue = files.length;
        files.forEach(sassCompile);
    });

});
