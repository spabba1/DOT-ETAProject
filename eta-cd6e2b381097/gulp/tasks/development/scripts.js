'use strict';
var gulp = require('gulp');
var config = require('../../config.js').scripts;
var concat = require('gulp-concat');
//var usemin = require('gulp-usemin');
var size = require('gulp-size');
//var gulpif = require('gulp-if');
var uglify = require('gulp-uglify');
//var print = require('gulp-print');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('scripts', ['jshint'], function () {
    gulp.src(config.vendor, { 'base' : 'app/'})
        /*.pipe(concat(config.vendorName))
        .pipe(sourcemaps.init({loadMaps: true}))
        .pipe(sourcemaps.write('../maps'))*/
        .pipe(gulp.dest(config.vendorDest))
        .pipe(size({title: 'vendor'}));

    gulp.src(config.main, { 'base' : 'app/'})
        /*.pipe(concat(config.mainName))
        .pipe(sourcemaps.init())
        .pipe(sourcemaps.write('../maps'))*/
        .pipe(gulp.dest(config.dest))
        .pipe(size({title: 'main'}));

    gulp.src(config.modernizr)
        .pipe(concat(config.modName))
        .pipe(uglify({preserveComments: 'some'}))
        .pipe(sourcemaps.init())
        .pipe(sourcemaps.write('../maps'))
        .pipe(gulp.dest(config.modDest))
        .pipe(size({title: 'modernizr copy'}));

    /*.pipe(concat('vendor.js'))
      .pipe(gulp.dest(config.dest))
      .pipe(size({title: 'scripts'}));*/
});
