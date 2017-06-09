/// <reference path="./types.ts" />

import approvals from './approvals/approvals.module';
import approved from './approved/approved.module';
import core from './core/core.module';
import create from './create/create.module';
import edit from './edit/edit.module';
import estimate from './estimate/estimate.module';
import home from './home/home.module';
import login from './login/login.module';
import review from './review/review.module';
import send from './send/send.module';
import staff from './staff/staff.module';
import taform from './taform/taform.module';
import toestimate from './toestimate/toestimate.module';
import view from './view/view.module';

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

  approvals.name,
  approved.name,
  core.name,
  create.name,
  edit.name,
  estimate.name,
  home.name,
  login.name,
  review.name,
  send.name,
  staff.name,
  taform.name,
  toestimate.name,
  view.name
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

function configure(
  $stateProvider,
  $urlRouterProvider,
  showErrorsConfigProvider,
  ngToastProvider
) {

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

runBlock.$inject = [
  'cgBusyPlusDefaults',
  '$cookies',
  '$http',
  '$log',
  '$rootScope',
  '$state',
  '$stateParams'
];

function runBlock(
  cgBusyPlusDefaults,
  $cookies,
  $http,
  $log,
  $rootScope,
  $state,
  $stateParams
  ) {

    // Add state references to root scope to access them anywhere. ie. page title
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;

  // keep user logged in after page refresh
  $rootScope.globals = $cookies.getObject('globals') || {};

  if ($rootScope.globals.currentUser) {
    $http.defaults.headers.common.Authorization = 'Basic ' +
    $rootScope.globals.currentUser.authdata;
  }

  $rootScope.$on(
    '$stateChangeStart', function (
      event,
      toState,
      toParams,
      fromState,
      fromParams) {

      if (!((toState.data && toState.data.public) || $rootScope.globals.currentUser)) {
        event.preventDefault();
        $state.go('login');
      }

    });

  $rootScope.$on('$stateChangeError', function (event) {
    $log.error(event);
  });

}

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
