/*global console*/
'use strict';
import browserSync from 'browser-sync';
import del from 'del';
import eslint from 'gulp-eslint';
import fs from 'fs';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import gutil from 'gulp-util';
import jslint from 'gulp-jslint';
import modernizr from 'gulp-modernizr';
import path from 'path';
import pkg from './package.json';
import plumber from 'gulp-plumber';
import proxyMiddleware from 'http-proxy-middleware';
import runSequence from 'run-sequence';

const $ = gulpLoadPlugins();
const reload = browserSync.reload;

// Lint JavaScript
gulp.task('jshint', () =>
    gulp.src([
        'app/scripts/**/*.js',
        '!app/scripts/modernizr.js'
    ])
    .pipe(reload({stream: true, once: true}))
    .pipe($.jshint())
    .pipe($.jshint.reporter('jshint-stylish'))
    .pipe($.if(!browserSync.active, $.jshint.reporter('fail')));
)
gulp.task('eslint', () => {
    return gulp.src([
        'app/scripts/noconsole.js',
        'app/scripts/app.js',
        'app/scripts/controllers/*.js',
        'app/scripts/services/*.js',
        'app/scripts/directives/*.js'
    ])
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failOnError());
})
gulp.task('jslint', () => {
    return gulp.src([
        'app/scripts/**/*.js',
        '!app/scripts/vendor/**/*.js'
    ])
    .pipe(jslint({
        fudge: 'true',
        edition: 'latest',
        reporter: 'default'

    }))
    .on('error', function (error) {
        console.error(String(error));
    });


})

// Optimize images
gulp.task('images', () =>
    gulp.src('app/images/**/*')
        .pipe($.cache($.imagemin({
            progressive: true,
            interlaced: true
        })))
    .pipe(gulp.dest('dist/images'))
    .pipe($.size({title: 'images'}));
)

// Copy all files at the root level (app)
gulp.task('copy', () =>
    gulp.src([
        'app/*',
        '!app/*.html',
        '!app/views/*.html',
        'node_modules/apache-server-configs/dist/.htaccess'
    ], {
        dot: true
    }).pipe(gulp.dest('dist'))
        .pipe($.size({title: 'copy'}));
)

// Copy web fonts to dist
gulp.task('fonts', () =>
    gulp.src(['app/fonts/**'])
        .pipe(gulp.dest('dist/fonts'))
        .pipe($.size({title: 'fonts'}));
)

// Compile and automatically prefix stylesheets
gulp.task('styles', () => {
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

    // For best performance, don't add Sass partials to 'gulp.src'
    return gulp.src([
        'app/styles/**/*.scss',
        'app/bower_components/datatables/media/css/jquery.dataTables.css',
        'app/bower_components/datatables/media/css/dataTables.bootstrap.css',
        'app/bower_components/datatables-colvis/css/dataTables.colVis.css'
    ])
    .pipe(plumber(function (error) {
        gutil.beep();
        gutil.log(gutil.colors.red(error.message));
        this.emit('end');
    }))
    .pipe($.sourcemaps.init({loadMaps: true}))
    .pipe($.sass({
        precision: 10
    }).on('error', $.sass.logError))
    .pipe($.autoprefixer(AUTOPREFIXER_BROWSERS))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest('.tmp/styles'))
    // Concatenate and minify styles
    .pipe($.if('*.css', $.minifyCss()))
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('dist/styles'))
    .pipe($.size({title: 'styles'}));
})

// Concatenate & Minify JS
gulp.task('scripts', () =>
    gulp.src([
        'scripts/noconsole.js',

        'bower_components/pdfjs-dist/web/compatibility.js',
        'bower_components/pdfjs-dist/build/pdf.js',
        'bower_components/pdfjs-dist/build/pdf.worker.js',

        "bower_components/jquery/dist/jquery.js",
        'bower_components/datatables/media/js/jquery.dataTables.js',
        "bower_components/datatables-colvis/js/dataTables.colVis.js",
        "bower_components/datatables-scroller/js/dataTables.scroller.js",

        "bower_components/angular/angular.js",
        "bower_components/angular-animate/angular-animate.js",
        "bower_components/angular-cookies/angular-cookies.js",
        "bower_components/angular-messages/angular-messages.js",
        "bower_components/angular-route/angular-route.js",

        "bower_components/angular-datatables/dist/angular-datatables.js",
        "bower_components/angular-datatables/dist/plugins/colvis/angular-datatables.colvis.js",
        "bower_components/angular-datatables/dist/plugins/scroller/angular-datatables.scroller.js",

        "bower_components/angular-bootstrap/ui-bootstrap-tpls.js",

        "bower_components/angular-bootstrap-show-errors/src/showErrors.js",

        'scripts/app.js',

        'scripts/controllers/admin.js',
        'scripts/controllers/controllers.js',
        'scripts/controllers/create.js',
        'scripts/controllers/delete.js',
        'scripts/controllers/edit.js',
        'scripts/controllers/estimate.js',
        'scripts/controllers/home.js',
        'scripts/controllers/review.js',
        'scripts/controllers/security.js',
        'scripts/controllers/staff.js',
        'scripts/controllers/taform.js',
        'scripts/controllers/toestimate.js',
        'scripts/controllers/view.js',

        'scripts/services/admin.js',
        'scripts/services/create.js',
        'scripts/services/delete.js',
        'scripts/services/edit.js',
        'scripts/services/estimate.js',
        'scripts/services/home.js',
        'scripts/services/security.js',
        'scripts/services/staff.js',
        'scripts/services/toestimate.js',
        'scripts/services/view.js',

        'scripts/directives/directives.js',
        'scripts/directives/home.js',
        'scripts/directives/taform.js'
    ])
    .pipe(plumber(function (error) {
        gutil.beep();
        gutil.log(gutil.colors.red(error.message));
        this.emit('end');
    }))
    .pipe($.concat('main.min.js'))
    .pipe($.uglify({preserveComments: 'some'}))
    // Output files
    .pipe(gulp.dest('dist/scripts'))
    .pipe($.size({title: 'scripts'}));
)

// Scan your HTML for assets & optimize them
gulp.task('html', () => {
  const assets = $.useref.assets({searchPath: '{.tmp,app}'});

  return gulp.src('app/**/*.html')
    .pipe(assets)
    // Remove any unused CSS
    .pipe($.if('*.css', $.uncss({
      html: [
        'app/index.html'
      ],
      // CSS Selectors for UnCSS to ignore
      ignore: [

      ]
    })))

    // Concatenate and minify styles
    // In case you are still using useref build blocks
    .pipe($.if('*.css', $.minifyCss()))
    .pipe(assets.restore())
    .pipe($.useref())

    // Minify any HTML
    .pipe($.if('*.html', $.minifyHtml()))
    // Output files
    .pipe(gulp.dest('dist'))
    .pipe($.size({title: 'html'}));
})
gulp.task('clean', cb => del(
    ['.tmp', 'dist/*', '!dist/.git'],
    {dot: true},
    cb
    );
)

// Modernizr
gulp.task('modernizr', () => {
    gulp.src([
        'app/scripts/**/*.js',
        'app/bower_components/**/*.{js,css,scss}',
        'app/styles/**/*.scss'])
        .pipe(modernizr())
        .pipe(gulp.dest('app/scripts'));
})
var spawn = require('child_process').spawn;
gulp.task('auto-reload', function () {
    var process;
    function restart() {
        if (process) {
            process.kill();
        }
        process = spawn('gulp', ['serve'], {stdio: 'inherit'});
    }
    gulp.watch('gulpfile.babel.js', restart);
    restart();
});

gulp.task('serve',
//gulp.task('serve', ['styles'], () => {
    //var proxy = proxyMiddleware('/',
        //{
            //target: 'http://eta.local/app',
            //changeOrigin: true,
            //ws: true,
            //pathRewrite: {
                //'/model' : '/app/model'
            //}
        //});

    //browserSync({
        //notify: false,
        //logPrefix: 'ETA',
        //server: {
            //baseDir: [".tmp", "app"],
            //middleware: [proxy]
        //},
        //open: false

    //});

    //gulp.watch(['app/**/*.html'], reload);
    //gulp.watch(['app/styles/**/*.{scss,css}'] ['styles', reload]);
    //gulp.watch(['app/scripts/**/*.js'], ['jshint']);
    //gulp.watch(['app/images/**/*'], reload);
//});

gulp.task('serve:dist', ['default'], () =>
    browserSync({
        notify: false,
        logPrefix: 'ETA(dist)',
        server: {
            baseDir: 'dist',
            middleware: [proxy]
        },
        open: false,
        baseDir: 'dist'
    })
);

// Default Task
gulp.task('default', ['clean'], cb =>
    runSequence(
        'styles',
        ['jshint', 'html', 'scripts', 'images', 'fonts', 'copy'],
        cb
    );
)


//Load custom tasks from the `tasks` directory
// try { require('require-dir')('tasks'); } catch (err) { console.error(err); }
