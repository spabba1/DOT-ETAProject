'use strict';

import proxyMiddleware from 'http-proxy-middleware';

const src = 'app';
const build = 'build';
const development = 'build/development';
const production = 'build/production';
const srcAssets = 'app/assets';
const developmentAssets = 'build/development/assets';
const productionAssets = 'build/production/assets';

var developmentProxy = proxyMiddleware('/', {
    target: 'http://eta.local/',
    changeOrigin: false
});

var testingProxy = proxyMiddleware('/', {
    target: 'http://eta.local/build/development',
    changeOrigin: false
});

var productionProxy = proxyMiddleware('/', {
    target: 'http://eta.local/build/production',
    changeOrigin: false
});

module.exports = {
  browsersync: {
    development: {
      server: {
        baseDir: [src],
        middleware: [developmentProxy],
        open: false
      },
      open: false
    },
    testing: {
      server: {
        baseDir: [development],
        middleware: [testingProxy],
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
  delete: {
    src: build
  },
  sass: {
    src: srcAssets + '/styles/**/main.scss',
    dest: srcAssets + '/css',
    options: {
      precision: 10,
      noCache: true,
      compass: false,
      bundleExec: true,
      sourcemap: true
    }
  },
  pdfsass: {
    src: srcAssets + '/styles/pdfmain.scss',
    dest: srcAssets + '/css',
    options: {
      precision: 8,
      noCache: true,
      compass: false,
      bundleExec: true,
      sourcemap: true
    },
    autoprefixer: {
      cascade: true,
      add: false
    }
  },
  css: {
    src: [
      src + '/bower_components/datatables/media/css/jquery.dataTables.css',
      src + '/bower_components/datatables-colvis/css/dataTables.colVis.css',
      src + '/bower_components/ngToast/dist/ngToast.css',
      src + '/bower_components/angular-busy/dist/angular-busy.css',
      src + '/bower_components/ui-select/dist/select.css',
      src + '/bower_components/ngToast/dist/ngToast-animations.css'

        ],
        dest: srcAssets + '/css'
  },
  pdfcss: {
    src: srcAssets + '/css/pdfmain.css',
    dest: developmentAssets + '/css'
  },
  autoprefixer: {
    browsers: [
      'ie >= 10',
      'ie_mob >= 10',
      'ff >= 30',
      'chrome >= 34',
      'safari >= 7',
      'opera >= 23',
      'ios >= 7',
      'android >= 4.4',
      'bb >= 10'
        ],
        cascade: true

  },
  coldfusion: {
    src: src + '/**/*.{cfm,cfc}',
                    dest: development
  },
  html: {
    src: [
      src + '/**/*.html',
      '!' + src + '/bower_components/**/*.html'
        ],
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
    vendor: [

      src + 'assets/scripts/noconsole.js',

      src + 'bower_components/pdfjs-dist/web/compatibility.js',
      src + 'bower_components/pdfjs-dist/build/pdf.js',
      src + 'bower_components/pdfjs-dist/build/pdf.worker.js',

      src + 'bower_components/jquery/dist/jquery.js',
      src + 'bower_components/datatables/media/js/jquery.dataTables.js',
      src + 'bower_components/datatables-colvis/js/dataTables.colVis.js',
      src + 'bower_components/datatables-scroller/js/dataTables.scroller.js',


      src + 'bower_components/angular/angular.js',
      src + 'bower_components/angular-animate/angular-animate.js',
      src + 'bower_components/angular-cookies/angular-cookies.js',
      src + 'bower_components/angular-messages/angular-messages.js',
      src + 'bower_components/angular-sanitize/angular-sanitize.js',
      src + 'bower_components/angular-ui-router/release/angular-ui-router.js',
      src + 'bower_components/angular-pdf/dist/angular-pdf.js',

      src + 'bower_components/angular-datatables/dist/angular-datatables.js',
      src + 'bower_components/angular-datatables/dist/plugins/colvis/angular-datatables.colvis.js',
      src + 'bower_components/angular-datatables/dist/plugins/scroller/angular-datatables.scroller.js',


      src + 'bower_components/angular-bootstrap/ui-bootstrap-tpls.js',

      src + 'bower_components/angular-bootstrap-show-errors/src/showErrors.js',
      src + 'bower_components/ngToast/dist/ngToast.js'
      ],
      vendorName: 'vendor.js',
      main: [
        src + 'js/app.module.js',

        src + 'js/core/core.module.js',
        src + 'js/core/security.factory.js',

		src + 'js/home/home.controller.js',
		src + 'js/home/home.directive.js',
		src + 'js/home/home.module.js',

		src + 'js/login/login.controller.js',
		src + 'js/login/login.module.js',

		src + 'js/estimate/estimate.controller.js',
		src + 'js/estimate/estimate.factory.js'

		/*
        src + 'js/controllers/controllers.js',
        src + 'js/controllers/create.js',
        src + 'js/controllers/delete.js',
        src + 'js/controllers/edit.js',
        src + 'js/controllers/estimate.js',
        src + 'js/controllers/home.js',
        src + 'js/controllers/pdfview.js',
        src + 'js/controllers/review.js',
        src + 'js/controllers/security.js',
        src + 'js/controllers/send.js',
        src + 'js/controllers/staff.js',
        src + 'js/controllers/taform.js',
        src + 'js/controllers/toestimate.js',
        src + 'js/controllers/view.js',


        src + 'js/services/admin.js',
        src + 'js/services/create.js',
        src + 'js/services/delete.js',
        src + 'js/services/edit.js',
        src + 'js/services/estimate.js',
        src + 'js/services/home.js',
        src + 'js/services/security.js',
        src + 'js/services/staff.js',
        src + 'js/services/toestimate.js',
        src + 'js/services/view.js',

        src + 'js/directives/directives.js',
        src + 'js/directives/home.js',
        src + 'js/directives/taform.js'
		*/
        ],
        mainName: 'main.js',

        modernizr: srcAssets + '/js/modernizr.js',
        modName: 'modernizr.min.js',
        modDest: developmentAssets + '/js',

        vendorDest: development,
        dest: development
  },
  images: {
    src: srcAssets + '/images/**/*',
    dest: developmentAssets + '/images'
  },
  copyfonts: {
    development: {
      src: src + './../node_modules/bootstrap-sass/assets/fonts/bootstrap/*.*',
      dest: srcAssets + '/fonts/bootstrap'
    },
    testing: {
      src: src + './../node_modules/bootstrap-sass/assets/fonts/bootstrap/*.*',
      dest: developmentAssets + '/fonts/bootstrap'
    },
    production: {
      src: developmentAssets + '/fonts/*',
      dest: productionAssets + '/fonts'
    }
  },
  copynode: {
    src: [
      './node_modules/systemjs/dist/system-polyfills.src.js',
      './node_modules/systemjs/dist/system.src.js',
      './node_modules/pdfjs-dist/web/compatibility.js',
      './node_modules/pdfjs-dist/build/pdf.js',
      './node_modules/pdfjs-dist/build/pdf.worker.js',

      './node_modules/jquery/dist/jquery.js',

      './node_modules/datatables.net/js/jquery.dataTables.js',
      './node_modules/datatables.net-dt/css/jquery.dataTables.css',
      './node_modules/datatables.net-bs/css/dataTables.bootstrap.css',
      './node_modules/datatables.net-bs/js/dataTables.bootstrap.js',
      './node_modules/datatables.net-buttons/js/dataTables.buttons.js',
      './node_modules/datatables.net-buttons/js/buttons.colVis.js',
      './node_modules/datatables.net-buttons-bs/css/buttons.bootstrap.css',
      './node_modules/datatables.net-buttons-bs/js/buttons.bootstrap.js',
      './node_modules/datatables.net-scroller/js/dataTables.scroller.js',
      './node_modules/datatables.net-scroller-bs/css/scroller.bootstrap.css',

      './node_modules/angular/angular.js',
      './node_modules/angular-animate/angular-animate.js',
      './node_modules/angular-cookies/angular-cookies.js',
      './node_modules/angular-messages/angular-messages.js',
      './node_modules/angular-sanitize/angular-sanitize.js',
      './node_modules/angular-ui-router/release/angular-ui-router.js',
      './node_modules/angular-pdf/dist/angular-pdf.js',

      './node_modules/angular-datatables/dist/angular-datatables.js',
      './node_modules/angular-datatables/dist/plugins/scroller/angular-datatables.scroller.js',
      './node_modules/angular-datatables/dist/plugins/buttons/angular-datatables.buttons.js',
      './node_modules/angular-datatables/dist/plugins/bootstrap/angular-datatables.bootstrap.js',

      './node_modules/angular-ui-bootstrap/dist/ui-bootstrap-csp.css',
      './node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls.js',
      './node_modules/angular-busy-plus/dist/styles/angular-busy-plus.css',
      './node_modules/angular-busy-plus/dist/styles/angular-busy-plus.css.map',
      './node_modules/angular-busy-plus/dist/scripts/angular-busy-plus.js',

      /*'./node_modules/angular-utils-ui-breadcrumbs/uiBreadcrumbs.js',*/ // currently bower only


      './node_modules/angular-bootstrap-show-errors/src/showErrors.js',
      './node_modules/ng-toast/dist/ngToast.css',
      './node_modules/ng-toast/dist/ngToast-animations.css',
      './node_modules/ng-toast/dist/ngToast.js'
    ],
    dest: srcAssets + '/libs'
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
    dest: srcAssets + '/libs'
  },
  watch: {
    html: src + '/**/*.html',
    sass: srcAssets + '/styles/**/*.scss',
    css: srcAssets + '/css/**/*.css',
    scripts: src + '/js/**/*.js',
    images: srcAssets + '/images/**/*',
    sprites: srcAssets + '/images/**/*.png',
    svg: 'vectors:/*.svg',
    coldfusion: src + '/**/*.{cfm,cfc}',
    pdfsass: srcAssets + '/styles/pdfmain.scss',
    pdfcss: srcAssets + '/css/pdfmain.css'
  },
  scsslint: {
    src: [
      srcAssets + '/scss/**/*.{sass,scss}',
      '!' + srcAssets + '/scss/base/_sprites.scss',
      '!' + srcAssets + '/scss/helpers/_meyer-reset.scss'
        ],
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
        cssClass: function (item) {
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
      assets: [
        productionAssets + '/css/*.css',
        productionAssets + '/js/*.js',
        productionAssets + '/images/**/*'
            ],
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
    src: [
      productionAssets + '/manifest.json',
      production + '/**/*.{html,xml,txt,json,css,js}'
        ],
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
