'use strict';
var gulp = require('gulp');
var del = require('del');
var config = require('../../config').delete;

/**
 * Delete folders and files
 */
gulp.task('delete', function () {
    var stream = del(config.src).then(function (paths) {
        console.log('Deleted files/folders:\n', paths.join('\n'));
    });
    return stream;
});
