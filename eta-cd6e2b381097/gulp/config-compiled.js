'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _httpProxyMiddleware = require('http-proxy-middleware');

var _httpProxyMiddleware2 = _interopRequireDefault(_httpProxyMiddleware);

var src = 'app';
var build = 'build';
var development = 'build/development';
var production = 'build/production';
var srcAssets = 'app/assets';
var developmentAssets = 'build/development/assets';
var productionAssets = 'build/production/assets';

var developmentProxy = (0, _httpProxyMiddleware2['default'])('/', {
    target: 'http://eta.local/build/development',
    changeOrigin: false
});

var productionProxy = (0, _httpProxyMiddleware2['default'])('/', {
    target: 'http://eta.local/build/production',
    changeOrigin: false
});

module.exports = {
    browsersync: {
        development: {
            server: {
                baseDir: [development],
                middleware: [developmentProxy],
                open: false
            },
            open: false
        },
        production: {
            server: {
                baseDir: [production],
                middleware: [productionProxy]
            },
            port: 9998,
            open: false
        }
    },
    'delete': {
        src: build
    },
    sass: {
        src: srcAssets + '/styles/**/main.scss',
        //dest: srcAssets + '/css',
        dest: developmentAssets + '/css',
        options: {
            precision: 10,
            noCache: true,
            compass: false,
            bundleExec: true,
            sourcemap: true
        }
    },
    css: {
        src: [src + '/bower_components/datatables/media/css/jquery.dataTables.css', src + '/bower_components/datatables-colvis/css/dataTables.colVis.css', src + '/bower_components/ngToast/dist/ngToast.css', src + '/bower_components/ui-select/dist/select.css', src + '/bower_components/ngToast/dist/ngToast-animations.css'],
        dest: developmentAssets + '/css'
    },
    autoprefixer: {
        browsers: ['ie >= 10', 'ie_mob >= 10', 'ff >= 30', 'chrome >= 34', 'safari >= 7', 'opera >= 23', 'ios >= 7', 'android >= 4.4', 'bb >= 10'],
        cascade: true
    },
    coldfusion: {
        src: src + '/model/**/*.cfc',
        dest: development
    },
    html: {
        src: [src + '/**/*.html', '!' + src + '/bower_components/**/*.html'],
        dest: development
    },
    browserify: {
        // Enable source maps
        debug: true,
        // Additional file extensions to make optional
        extensions: ['.coffee', '.hbs'],
        // A separate bundle will be generated for each
        // bundle config in the list below
        bundleConfigs: [{
            entries: './' + srcAssets + '/scripts/**/*.js',
            dest: developmentAssets + '/js',
            outputName: 'app.js'
        }]
    },
    scripts: {
        vendor: [src + '/assets/scripts/noconsole.js', src + '/bower_components/pdfjs-dist/web/compatibility.js', src + '/bower_components/pdfjs-dist/build/pdf.js', src + '/bower_components/pdfjs-dist/build/pdf.worker.js', src + '/bower_components/jquery/dist/jquery.js', src + '/bower_components/datatables/media/js/jquery.dataTables.js', src + '/bower_components/datatables-colvis/js/dataTables.colVis.js', src + '/bower_components/datatables-scroller/js/dataTables.scroller.js', src + '/bower_components/angular/angular.js', src + '/bower_components/angular-animate/angular-animate.js', src + '/bower_components/angular-cookies/angular-cookies.js', src + '/bower_components/angular-messages/angular-messages.js', src + '/bower_components/angular-sanitize/angular-sanitize.js', src + '/bower_components/angular-ui-router/release/angular-ui-router.js', src + '/bower_components/angular-pdf/dist/angular-pdf.js', src + '/bower_components/angular-datatables/dist/angular-datatables.js', src + '/bower_components/angular-datatables/dist/plugins/colvis/angular-datatables.colvis.js', src + '/bower_components/angular-datatables/dist/plugins/scroller/angular-datatables.scroller.js', src + '/bower_components/angular-bootstrap/ui-bootstrap-tpls.js', src + '/bower_components/ui-select/dist/select.js', src + '/bower_components/angular-bootstrap-show-errors/src/showErrors.js', src + '/bower_components/ngToast/dist/ngToast.js'],
        vendorName: 'vendor.js',
        main: [src + '/assets/scripts/app.js', src + '/assets/scripts/controllers/controllers.js', src + '/assets/scripts/controllers/create.js', src + '/assets/scripts/controllers/delete.js', src + '/assets/scripts/controllers/edit.js', src + '/assets/scripts/controllers/estimate.js', src + '/assets/scripts/controllers/home.js', src + '/assets/scripts/controllers/review.js', src + '/assets/scripts/controllers/security.js', src + '/assets/scripts/controllers/send.js', src + '/assets/scripts/controllers/staff.js', src + '/assets/scripts/controllers/taform.js', src + '/assets/scripts/controllers/toestimate.js', src + '/assets/scripts/controllers/view.js', src + '/assets/scripts/services/admin.js', src + '/assets/scripts/services/create.js', src + '/assets/scripts/services/delete.js', src + '/assets/scripts/services/edit.js', src + '/assets/scripts/services/estimate.js', src + '/assets/scripts/services/home.js', src + '/assets/scripts/services/security.js', src + '/assets/scripts/services/staff.js', src + '/assets/scripts/services/toestimate.js', src + '/assets/scripts/services/view.js', src + '/assets/scripts/directives/directives.js', src + '/assets/scripts/directives/home.js', src + '/assets/scripts/directives/taform.js'],
        mainName: 'main.js',

        modernizr: srcAssets + '/js/modernizr.js',
        modName: 'modernizr.min.js',
        modDest: srcAssets + '/js',

        dest: developmentAssets + '/js'
    },
    images: {
        src: srcAssets + '/images/**/*',
        dest: developmentAssets + '/images'
    },
    copyfonts: {
        development: {
            src: src + '/bower_components/bootstrap-sass/assets/fonts/bootstrap/*',
            dest: developmentAssets + '/fonts/bootstrap'
        },
        production: {
            src: developmentAssets + '/fonts/*',
            dest: productionAssets + '/fonts'
        }
    },
    base64: {
        src: developmentAssets + '/css/*.css',
        dest: developmentAssets + '/css',
        options: {
            baseDir: build,
            extensions: ['png'],
            maxImageSize: 20 * 1024, // bytes
            debug: false
        }
    },
    modernizr: {
        src: src + '/**/*.{js,css,scss}',
        dest: srcAssets + '/js'
    },
    watch: {
        html: src + '/**/*.html',
        sass: srcAssets + '/styles/**/*.scss',
        scripts: srcAssets + '/scripts/**/*.js',
        images: srcAssets + 'images/**/*',
        sprites: srcAssets + '/images/**/*.png',
        svg: 'vectors:/*.svg',
        coldfusion: src + '/model/**/*.cfc'
    },
    scsslint: {
        src: [srcAssets + '/scss/**/*.{sass,scss}', '!' + srcAssets + '/scss/base/_sprites.scss', '!' + srcAssets + '/scss/helpers/_meyer-reset.scss'],
        options: {
            bundleExec: true
        }
    },
    jshint: {
        src: srcAssets + '/scripts/**/*.js'
    },
    sprites: {
        src: srcAssets + '/images/sprites/icon/*.png',
        dest: {
            css: srcAssets + '/scss/base/',
            image: srcAssets + '/images/sprites/'
        },
        options: {
            cssName: '_sprites.scss',
            cssFormat: 'css',
            cssOpts: {
                cssClass: function cssClass(item) {
                    // If this is a hover sprite, name it as a hover one (e.g. 'home-hover' -> 'home:hover')
                    if (item.name.indexOf('-hover') !== -1) {
                        return '.icon-' + item.name.replace('-hover', ':hover');
                        // Otherwise, use the name as the selector (e.g. 'home' -> 'home')
                    }
                    return '.icon-' + item.name;
                }
            },
            imgName: 'icon-sprite.png',
            imgPath: '/assets/images/sprites/icon-sprite.png'
        }
    },
    optimize: {
        css: {
            src: developmentAssets + '/css/*.css',
            dest: productionAssets + '/css/',
            options: {
                keepSpecialComments: 0
            }
        },
        js: {
            src: developmentAssets + '/js/*.js',
            dest: productionAssets + '/js/',
            options: {}
        },
        images: {
            src: developmentAssets + '/images/**/*.{jpg,jpeg,png,gif}',
            dest: productionAssets + '/images/',
            options: {
                optimizationLevel: 3,
                progessive: true,
                interlaced: true
            }
        },
        html: {
            src: development + '/**/*.html',
            dest: production,
            options: {
                collapseWhitespace: true
            }
        }
    },
    revision: {
        src: {
            assets: [productionAssets + '/css/*.css', productionAssets + '/js/*.js', productionAssets + '/images/**/*'],
            base: production
        },
        dest: {
            assets: production,
            manifest: {
                name: 'manifest.json',
                path: productionAssets
            }
        }
    },
    collect: {
        src: [productionAssets + '/manifest.json', production + '/**/*.{html,xml,txt,json,css,js}'],
        dest: production
    },
    rsync: {
        src: production + '/**',
        options: {
            destination: '~/path/to/my/website/root/',
            root: production,
            hostname: 'mydomain.com',
            username: 'user',
            incremental: true,
            progress: true,
            relative: true,
            emptyDirectories: true,
            recursive: true,
            clean: true,
            exclude: ['.DS_Store'],
            include: []
        }
    }
};

//# sourceMappingURL=config-compiled.js.map