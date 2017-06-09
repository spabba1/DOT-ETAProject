/// <reference path="./types.ts" />
System.register(['./approvals/approvals.module', './approved/approved.module', './core/core.module', './create/create.module', './edit/edit.module', './estimate/estimate.module', './home/home.module', './login/login.module', './review/review.module', './send/send.module', './staff/staff.module', './taform/taform.module', './toestimate/toestimate.module', './view/view.module'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var approvals_module_1, approved_module_1, core_module_1, create_module_1, edit_module_1, estimate_module_1, home_module_1, login_module_1, review_module_1, send_module_1, staff_module_1, taform_module_1, toestimate_module_1, view_module_1;
    function configure($stateProvider, $urlRouterProvider, showErrorsConfigProvider, ngToastProvider) {
        $urlRouterProvider.when('', '/')
            .otherwise('/login');
        $stateProvider
            .state('home', {
            controller: 'HomeController',
            controllerAs: 'HomeCtrl',
            data: {
                displayName: 'Home'
            },
            templateUrl: 'js/home/home.html',
            url: '/'
        })
            .state('login', {
            controller: 'LoginController',
            data: {
                displayName: 'Login',
                public: true
            },
            templateUrl: 'js/login/login.html',
            url: '/login'
        })
            .state('create', {
            controller: 'CreateController',
            controllerAs: 'CreateCtrl',
            data: {
                displayName: 'Create'
            },
            templateUrl: 'js/create/create.html',
            url: '/create'
        })
            .state('staff', {
            controller: 'StaffController',
            controllerAs: 'StaffCtrl',
            data: {
                displayName: 'Staff'
            },
            templateUrl: 'js/staff/staff.html',
            url: '/staff'
        })
            .state('edit', {
            controller: 'EditController',
            controllerAs: 'EditCtrl',
            data: {
                displayName: 'Edit'
            },
            templateUrl: 'js/edit/edit.html',
            url: '/edit/:taid'
        })
            .state('estimate', {
            controller: 'EstimateController',
            controllerAs: 'EstimateCtrl',
            data: {
                displayName: 'Estimate'
            },
            templateUrl: 'js/estimate/estimate.html',
            url: '/estimate/:taid'
        })
            .state('view', {
            controller: 'ViewController',
            controllerAs: 'ViewCtrl',
            data: {
                displayName: 'View'
            },
            templateUrl: 'js/view/view.html',
            url: '/view/:taid'
        })
            .state('delete', {
            controller: 'TADeleteController',
            data: {
                displayName: 'Delete'
            },
            templateUrl: 'views/delete.html',
            url: '/delete'
        })
            .state('approvals', {
            controller: 'ApprovalsController',
            controllerAs: 'ApprovalsCtrl',
            data: {
                displayName: 'Approvals'
            },
            templateUrl: 'js/approvals/approvals.html',
            url: '/approvals'
        })
            .state('approved', {
            controller: 'ApprovedController',
            controllerAs: 'ApprovedCtrl',
            data: {
                displayName: 'Approved'
            },
            templateUrl: 'js/approved/approved.html',
            url: '/approved/:taid'
        })
            .state('review', {
            controller: 'ReviewController',
            controllerAs: 'ReviewCtrl',
            data: {
                displayName: 'Review'
            },
            templateUrl: 'js/review/review.html',
            url: '/review'
        })
            .state('toestimate', {
            controller: 'ToEstimateController',
            controllerAs: 'ToEstimateCtrl',
            data: {
                displayName: 'To Estimate'
            },
            templateUrl: 'js/toestimate/toestimate.html',
            url: '/toestimate'
        })
            .state('pdfview', {
            controller: 'PdfViewController',
            data: {
                displayName: 'PDF View'
            },
            templateUrl: 'views/pdf-view.html',
            url: '/pdfview/:taid'
        })
            .state('send', {
            controller: 'SendController',
            controllerAs: 'SendCtrl',
            data: {
                displayName: 'Send'
            },
            templateUrl: 'js/send/send.html',
            url: '/send/:taid'
        });
        showErrorsConfigProvider.showSuccess(true);
        ngToastProvider.configure({
            additionalClasses: 'eta-toast',
            animation: 'slide',
            dismissButton: true,
            dismissOnTimeout: true,
            horizontalPosition: 'left',
            timeout: 8000,
            verticalPosition: 'top'
        });
    }
    function runBlock(cgBusyPlusDefaults, $cookies, $http, $log, $rootScope, $state, $stateParams) {
        // Add state references to root scope to access them anywhere. ie. page title
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
        // keep user logged in after page refresh
        $rootScope.globals = $cookies.getObject('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common.Authorization = 'Basic ' +
                $rootScope.globals.currentUser.authdata;
        }
        $rootScope.$on('$stateChangeStart', function (event, toState, toParams, fromState, fromParams) {
            if (!((toState.data && toState.data.public) || $rootScope.globals.currentUser)) {
                event.preventDefault();
                $state.go('login');
            }
        });
        $rootScope.$on('$stateChangeError', function (event) {
            $log.error(event);
        });
    }
    return {
        setters:[
            function (approvals_module_1_1) {
                approvals_module_1 = approvals_module_1_1;
            },
            function (approved_module_1_1) {
                approved_module_1 = approved_module_1_1;
            },
            function (core_module_1_1) {
                core_module_1 = core_module_1_1;
            },
            function (create_module_1_1) {
                create_module_1 = create_module_1_1;
            },
            function (edit_module_1_1) {
                edit_module_1 = edit_module_1_1;
            },
            function (estimate_module_1_1) {
                estimate_module_1 = estimate_module_1_1;
            },
            function (home_module_1_1) {
                home_module_1 = home_module_1_1;
            },
            function (login_module_1_1) {
                login_module_1 = login_module_1_1;
            },
            function (review_module_1_1) {
                review_module_1 = review_module_1_1;
            },
            function (send_module_1_1) {
                send_module_1 = send_module_1_1;
            },
            function (staff_module_1_1) {
                staff_module_1 = staff_module_1_1;
            },
            function (taform_module_1_1) {
                taform_module_1 = taform_module_1_1;
            },
            function (toestimate_module_1_1) {
                toestimate_module_1 = toestimate_module_1_1;
            },
            function (view_module_1_1) {
                view_module_1 = view_module_1_1;
            }],
        execute: function() {
            // var edocs = angular.module('eta.edocs', []);
            // var email = angular.module('eta.email', []);
            // var oostate = angular.module('eta.outOfState', []);
            // var pdfview = angular.module('eta.pdfview', []);
            // var security = angular.module('eta.security', []);
            // var tadelete = angular.module('eta.delete', []);
            // var workflow = angular.module('eta.workflow', []);
            // jshint unused: false */
            // eslint no-unused-vars: 0*/
            angular.module('eta', [
                'angularUtils.directives.uiBreadcrumbs',
                'cgBusyPlus',
                'datatables',
                'datatables.bootstrap',
                'datatables.buttons',
                'datatables.scroller',
                'ngAnimate',
                'ngCookies',
                'ngSanitize',
                'ngToast',
                'pdf',
                'ui.bootstrap',
                'ui.bootstrap.showErrors',
                'ui.router',
                approvals_module_1.default.name,
                approved_module_1.default.name,
                core_module_1.default.name,
                create_module_1.default.name,
                edit_module_1.default.name,
                estimate_module_1.default.name,
                home_module_1.default.name,
                login_module_1.default.name,
                review_module_1.default.name,
                send_module_1.default.name,
                staff_module_1.default.name,
                taform_module_1.default.name,
                toestimate_module_1.default.name,
                view_module_1.default.name
            ])
                .run(runBlock)
                .config(configure)
                .value('cgBusyPlusDefaults', {
                backdrop: true,
                delay: 300,
                message: 'Please wait...',
                templateUrl: 'js/core/custom-cgbusy-plus-template.html',
                wrapperClass: 'cg-busy-plus cg-busy-plus-animation fixed-center'
            });
            configure.$inject = [
                '$stateProvider',
                '$urlRouterProvider',
                'showErrorsConfigProvider',
                'ngToastProvider'
            ];
            runBlock.$inject = [
                'cgBusyPlusDefaults',
                '$cookies',
                '$http',
                '$log',
                '$rootScope',
                '$state',
                '$stateParams'
            ];
            /*
            export class CgBusyPlusDefaults {
            
              public backdrop: boolean;
              public delay: number;
              public message: string;
              public minDuration: number;
              public templateUrl: string;
              public wrapperClass: string;
            
              constructor() {
                this.backdrop = false;
                this.delay = 500;
                this.message = 'Hold on please';
                this.templateUrl = 'my_custom_template.html';
                this.wrapperClass = 'my-class my-class2';
              }
            }
            */
            angular.bootstrap(document.documentElement, ['eta', 'cgBusyPlus']);
        }
    }
});
//# sourceMappingURL=app.module.js.map