'use strict';
import gulp from 'gulp';
import browserSync from 'browser-sync';

const reload = browserSync.reload;

var config = require('../../config').watch;

/**
 * Start browsersync task and then watch files for changes
 */
gulp.task('watch', ['browsersync'], () => {
  gulp.watch(config.html, reload);
  gulp.watch(config.sass, ['sass']);
  gulp.watch(config.css, reload);
  //gulp.watch(config.pdfsass, ['pdfsass']);
  //gulp.watch(config.pdfcss, ['pdfcss', reload]);
  //gulp.watch(config.pdfcss, [reload]);
  //gulp.watch(config.scripts, [ 'eslint', 'scripts', reload]);
  gulp.watch(config.scripts, reload);
  //gulp.watch(config.images, ['images', reload]);
  //gulp.watch(config.svg, [reload]);
  //gulp.watch(config.sprites, [reload]);
  //gulp.watch(config.coldfusion, ['coldfusion', reload])
});
