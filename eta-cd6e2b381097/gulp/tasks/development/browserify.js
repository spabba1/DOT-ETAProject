'use strict';

import assign from 'lodash.assign';
import browserify from 'browserify';
import buffer from 'vinyl-buffer';
import gulp from 'gulp';
import gutil from 'gulp-util';
import source from 'vinyl-source-stream';
import sourcemaps from 'gulp-sourcemaps';
import watchify from 'watchify';


// add custom browserify options here
var customOpts = {
  entries: ['./src/index.js'],
  debug: true
};
var opts = assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));

// add transformations here
// i.e. b.transform(coffeeify);

gulp.task('nodejs', bundle); // so you can run `gulp js` to build the file
b.on('update', bundle); // on any dep update, runs the bundler
b.on('log', gutil.log); // output build logs to terminal

function bundle() {
  return b.bundle()
  // log errors if they happen
  .on('error', gutil.log.bind(gutil, 'Browserify Error'))
  .pipe(source('bundle.js'))
  // optional, remove if you don't need to buffer file contents
  .pipe(buffer())
  // optional, remove if you don't want sourcemaps
  .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
  // Add transformation tasks to the pipeline here.
  .pipe(sourcemaps.write('./')) // writes .map file
  .pipe(gulp.dest('./dist'));
}
