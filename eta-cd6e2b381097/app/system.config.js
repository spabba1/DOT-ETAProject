/// <reference path="./js/types.ts" />
System.config({
    baseURL: '/',
    paths: {
            'systemjs': '../node_modules/systemjs/dist/system.js',
            'system-polyfills': '../node_modules/systemjs/dist/system-polyfills.js',
            'jquery': '../node_modules/jquery/dist/jquery.js',
            'dataTables': '../node_modules/datatables.net/js/jquery.dataTables.js',
            'angular': '../node_modules/angular/angular.js',
            'angular-animate': '../node_modules/angular-animate/angular-animate.js',
            'angular-cookies': '../node_modules/angular-cookies/angular-cookies.js',
            'angular-messages': '../node_modules/angular-messages/angular-messages.js',
            'angular-sanitize': '../node_modules/angular-sanitize/angular-sanitize.js',
            'angular-mocks': '../node_modules/angular-mocks/angular-mocks.js',
            'es6-module-loader': '../node_modules/es6-module-loader/dist/es6-module-loader.src.js',
            'typescript': '../node_modules/typescript/lib/typescript.js'
          },
    transpiler: 'typescript'
});

