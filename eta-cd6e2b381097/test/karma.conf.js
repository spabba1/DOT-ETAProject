'use strict';
module.exports = function (config) {
  config.set({
      basePath: '../app',
      frameworks: ['systemjs', 'jasmine'],
      files: [
        './js/**/*.spec.js'
    ],

      plugins: [
        'karma-chrome-launcher',
        'karma-firefox-launcher',
        'karma-ie-launcher',
        'karma-systemjs',
        'karma-jasmine'
      ],

      systemjs: {
        files: [

          './js/noconsole.js',

          './assets/libs/system-polyfills.src.js',
          './assets/libs/system.src.js',

          './assets/libs/compatibility.js',
          './assets/libs/pdf.js',
          './assets/libs/pdf.worker.js',

          './assets/libs/jquery.js',

          './assets/libs/jquery.dataTables.js',
          './assets/libs/angular.js',
          './assets/libs/angular-datatables.js',

          './assets/libs/dataTables.bootstrap.js',
          './assets/libs/dataTables.buttons.js',
          './assets/libs/buttons.colVis.js',
          './assets/libs/buttons.bootstrap.js',
          './assets/libs/dataTables.scroller.js',

          './assets/libs/angular-animate.js',
          './assets/libs/angular-cookies.js',
          './assets/libs/angular-messages.js',
          './assets/libs/angular-sanitize.js',
          './assets/libs/angular-ui-router.js',
          './bower_components/angular-pdf/dist/angular-pdf.js',

          './assets/libs/angular-datatables.scroller.js',
          './assets/libs/angular-datatables.buttons.js',
          './assets/libs/angular-datatables.bootstrap.js',

          './assets/libs/ui-bootstrap-tpls.js',
          './assets/libs/angular-busy.js',

          './bower_components/angular-utils-ui-breadcrumbs/uiBreadcrumbs.js',

          './assets/libs/showErrors.js',
          './assets/libs/ngToast.js'


          /* Test Files
          /*'test/unit/services/staffTest.js'*/
          /*'test/unit/services/edocsTest.js',
           'test/unit/services/estimateServiceTest.js',*/
          ],

        configFile: 'system.config.js',

        config: {


        }
      },

      autoWatch: true,
      //browsers: ['Chrome', 'Firefox', 'IE'],
      //browsers: ['Chrome', 'Firefox'],
      browsers: ['Chrome'],

      junitReporter: {
        outputFile: 'test_out/unit.xml',
        suite: 'unit'
      }
  });
  };

