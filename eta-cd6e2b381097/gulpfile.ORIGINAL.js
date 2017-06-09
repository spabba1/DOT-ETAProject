/*global require, console*/
// Include Gulp & Tools We'll Use
var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var browserSync = require('browser-sync');
/*var buffer = require('vinyl-buffer');*/
var debug = require('gulp-debug');
var del = require('del');
/*var gutil = require('gulp-util');*/
var jslint = require('gulp-jslint');
//var pagespeed = require('psi');
var reload = browserSync.reload;
var runSequence = require('run-sequence');
var sass = require('gulp-sass');
/*var source = require('vinyl-source-stream');*/
/*var sourcemaps = require('gulp-sourcemaps');*/
var spawn = require('child_process').spawn;
/*var watchify = require('watchify');*/

// Browserify
var browserify = require('browserify');
var transform = require('vinyl-transform');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');


var AUTOPREFIXER_BROWSERS = [
    'ie >= 10',
    'ie_mob >= 10',
    'ff >= 30',
    'chrome >= 34',
    'safari >= 7',
    'opera >= 23',
    'ios >= 7',
    'android >= 4.4',
    'bb >= 10'
];

// Lint JavaScript
gulp.task('jslint', function () {
    'use strict';
    return gulp.src(['./app/jscripts/main.js'])
        // pass your directives
        // as an object
        .pipe(jslint({
            // these directives can
            // be found in the official
            // JSLint documentation.
            node: true,
            evil: true,
            nomen: true,

            // you can also set global
            // declarations for all source
            // files like so:
            global: [],
            predef: [],
            // both ways will achieve the
            // same result; predef will be
            // given priority because it is
            // promoted by JSLint

            // pass in your prefered
            // reporter like so:
            reporter: 'default',
            // ^ there's no need to tell gulp-jslint
            // to use the default reporter. If there is
            // no reporter specified, gulp-jslint will use
            // its own.

            // specifiy custom jslint edition
            // by default, the latest edition will
            // be used
            edition: '2014-07-08',

            // specify whether or not
            // to show 'PASS' messages
            // for built-in reporter
            errorsOnly: false
        }))

        // error handling:
        // to handle on error, simply
        // bind yourself to the error event
        // of the stream, and use the only
        // argument as the error object
        // (error instanceof Error)
        .on('error', function (error) {
            console.error(String(error));
        });
});

// Copy All Files At The Root Level (app)
gulp.task('copycss', function () {
    'use strict';
    return gulp.src([
        './node_modules/datatables/media/css/jquery.dataTables.css'
    ]).pipe(gulp.dest('app/css'))
        .pipe($.size({title: 'copy'}));
});

// Copy All Files At The Root Level (app)
gulp.task('copyimages', function () {
    'use strict';

    gulp.src([
    ]).pipe(gulp.dest('app/css/images'));


    return gulp.src([
        './node_modules/datatables/media/images/*.png'
    ]).pipe(gulp.dest('app/img'))
        .pipe($.size({title: 'copy'}));
});

// Copy All Files At The Root Level (app)
gulp.task('copyjs', function () {
    'use strict';
    return gulp.src([
        './node_modules/jquery/dist/jquery.js',
        './node_modules/datatables/media/js/jquery.dataTables.js',
        './node_modules/jquery-autosize/jquery.autosize.js',
        './node_modules/jquery-validation/dist/jquery.validate.js',
        './node_modules/jquery-validation/dist/additional-methods.js',
        './node_modules/angular/angular.js',
        './node_modules/pdfjs/pdfjs.js'
    ]).pipe(gulp.dest('app/jscripts/vendor'))
        .pipe($.size({title: 'copy'}));
});

// Compile and Automatically Prefix Stylesheets
//gulp.task('styles', function () {
    //// For best performance, don't add Sass partials to `gulp.src`
    //return gulp.src([
        //'app/css/*.scss',
        //'app/css/**/*.css',
        //'app/css/components/components.scss'
    //])
        //.pipe($.changed('.tmp/styles', {extension: '.css'}))
        //.pipe($.sass({
            //precision: 10,
            //onError: console.error.bind(console, 'Sass error:')
        //}))
        //.pipe($.autoprefixer({browsers: AUTOPREFIXER_BROWSERS}))
        //.pipe(gulp.dest('.tmp/styles'))
        //// Concatenate And Minify Styles
        //.pipe($.if('*.css', $.csso()))
            //.pipe(gulp.dest('dist/css'))
        //.pipe($.size({title: 'styles'}));
//});

// Scan Your HTML For Assets & Optimize Them
gulp.task('html', function () {
    'use strict';
    var assets = $.useref.assets({searchPath: '{.tmp,app}'});

    return gulp.src('app/**/*.cfm')
        .pipe(assets)
        // Concatenate And Minify JavaScript
        .pipe($.if('*.js', $.uglify({preserveComments: 'some'})))
        // Remove Any Unused CSS
        // Note: If not using the Style Guide, you can delete it from
        // the next line to only include styles your project uses.
        .pipe($.if('*.css', $.uncss({
            html: [
                'app/layouts/default.cfm'
            ],
            // CSS Selectors for UnCSS to ignore
            ignore: [
                '/.navdrawer-container.open/',
                '/.app-bar.open/'
            ]
        })))
        // Concatenate And Minify Styles
        // In case you are still using useref build blocks
        .pipe($.if('*.css', $.csso()))
            .pipe(assets.restore())
        .pipe($.useref())
        // Update Production Style Guide Paths
        .pipe($.replace('components/components.css', 'components/main.min.css'))
        // Minify Any HTML
        .pipe($.if('*.cfm', $.minifyHtml()))
            // Output Files
            .pipe(gulp.dest('dist'))
            .pipe($.size({title: 'cfm'}));
});

// Clean Output Directory
gulp.task('clean', del.bind(null, ['.tmp', 'dist/*', '!dist/.git'], {dot: true}));

// Auto reload gulp on gulpfile.js edit
/*gulp.task('auto-reload', function () {
    'use strict';
    var process;

    function restart() {
        if (process) {
            process.kill();
        }

        process = spawn('gulp', ['serve'], {stdio: 'inherit'});
    }

    gulp.watch('gulpfile.js', restart).pipe(debug({title: 'unicorn:'}));
    restart();
});*/

gulp.task('browserify', function () {
    'use strict';
    var browserified = transform(function (filename) {
        var b = browserify(filename);
        return b.bundle();
    });

    return gulp.src(['./app/jscripts/main.js'])
        .pipe(browserified)
        //.pipe(uglify())
        .pipe(rename('bundled.js'))
        .pipe(gulp.dest('./app/js'));
});

// Watch Files For Changes & Reload
gulp.task('serve', ['copycss', 'copyjs', 'copyimages', 'sass', 'browserify'], function () {
    'use strict';
    browserSync({
        notify: false,
        // Customize the BrowserSync console logging prefix
        logPrefix: 'ETA',
        // Run as an https by uncommenting 'https: true'
        // Note: this uses an unsigned certificate which on first access
        //       will present a certificate warning in the browser.
        // https: true,
        proxy: 'localhost/eta/app'
        // server: ['.tmp', 'app']
        //
    });

    //gulp.watch(['app/**/*.html'], reload);
    //gulp.watch(['app/**/**/*.html'], reload);
    //gulp.watch(['app/**/**/**/*.html'], reload);
    //gulp.watch(['test/**/.*cfm'], reload);
    //gulp.watch(['test/**/*.cfc'], reload);
    gulp.watch(['app/**/*.cfm'], reload);
    gulp.watch(['app/**/*.cfc'], reload);
    gulp.watch(['app/scss/*.scss'], ['sass']);
    gulp.watch(['app/jscripts/**/*.js'], ['jslint', 'browserify']);
    gulp.watch(['app/js/bundled.js'], reload);
    gulp.watch(['app/css/**/*.css'], reload);
    //gulp.watch(['app/images/**/*'], reload);
});

// Compile sass into CSS & auto-inject into browsers
gulp.task('sass', function () {
    'use strict';
    del('app/css/*.*');
    return gulp.src("app/scss/main.scss")
        .pipe(sass())
        .pipe(gulp.dest("app/css"));
});

gulp.task('jscripts', function () {
    'use strict';
    return gulp.src([
        'node_modules/jquery/dist/jquery.js',
        'node_modules/jquery-autosize/jquery.autosize.js',
        'node_modules/jquery-validation/dist/jquery.validate.js',
        'node_modules/jquery-validation/dist/additional-methods.js',
        'node_modules/angular/angular.js',
        'node_modules/pdfjs/pdfjs.js'
    ], {
        dot: true
    }).pipe(gulp.dest('app/jscripts/vendor'))
        .pipe($.size({title: 'copy'}));
});

// Build and serve the output from the dist build
gulp.task('serve:dist', ['default'], function () {
    'use strict';
    browserSync({
        notify: false,
        logPrefix: 'WSK',
        // Run as an https by uncommenting 'https: true'
        // Note: this uses an unsigned certificate which on first access
        //       will present a certificate warning in the browser.
        // https: true,
        // server: 'dist'
        proxy: 'localhost/eta/dist'
    });
});

// Build Production Files, the Default Task
gulp.task('default', ['clean'], function (cb) {
    'use strict';
    //runSequence('styles', ['jslint', 'html', 'images', 'fonts', 'copy'], cb);
    runSequence(['jslint', 'html', 'images', 'fonts', 'copy'], cb);
});

// Load custom tasks from the `tasks` directory
// try { require('require-dir')('tasks'); } catch (err) { console.error(err); }

