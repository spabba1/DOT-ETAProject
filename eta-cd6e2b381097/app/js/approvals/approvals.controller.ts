/// <reference path="./../types.ts" />
ApprovalsController.$inject = [
  '$compile',
  '$scope',
  '$http',
  '$log',
  '$uibModal',
  'DTOptionsBuilder',
  'DTColumnBuilder',
  'SecurityFactory',
  'WorkflowFactory'
];


function ApprovalsController(
    $compile,
    $scope,
    $http,
    $log,
    $uibModal,
    DTOptionsBuilder,
    DTColumnBuilder,
    SecurityFactory,
    WorkflowFactory
    ) {

  const ApprovalsCtrl = this;

  ApprovalsCtrl.authdata = SecurityFactory.getAuthData();

  /*function actionsHtml(data, type, full, meta) {
    var actions = '';
    if (full.status === 'Start TA') {
    actions = '<button data-ng-click="edit(' + data + ')">Edit</button>' +
    '<button data-ng-click="delete(' + data + ')">Delete</button>';
    } else {
    actions = '<button data-ng-click="view(' + data + ')">View</button>';
    }
    return actions;
    }*/

  function createdRow(row) {
    // Recompile so Angular can attach to it
    $compile(angular.element(row).contents())($scope);
  }

  ApprovalsCtrl.dtOptions = DTOptionsBuilder.fromFnPromise(function () {
    return $http({
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        authdata: ApprovalsCtrl.authdata,
        method: 'getWorkflowData',
        returnFormat: 'json'
      },
      url: 'model/controller/Approval.cfc'
    }).then(function (results) {
      console.dir(results);
      return results.data;
    }, function (results) {
      console.dir(results);
      return results.data;
    });
  })
  .withDOM('<"top"f>rt<"bottom"lip><"clear">')
    .withButtons(['colvis'])
    .withBootstrap()
    // .withScroller()
    // .withOption('scrollY');
    /*.withOption('deferRender', true)*/
    .withOption('createdRow', createdRow);

  ApprovalsCtrl.dtColumns = [
    DTColumnBuilder.newColumn('created').withTitle('Created'),
    DTColumnBuilder.newColumn('preparer').withTitle('Preparer'),
    DTColumnBuilder.newColumn('tanumber').withTitle('TA Number'),
    DTColumnBuilder.newColumn('traveler').withTitle('Traveler'),
    DTColumnBuilder.newColumn('actions').withTitle('Actions')
  ];

  ApprovalsCtrl.dtInstance = {};

  ApprovalsCtrl.view = function(taid) {

    let modalInstance = $uibModal.open({
    animation: true,
    controller: 'ApprovalModalController',
    controllerAs: 'ApprovalsCtrl',
    resolve: {
      taid: function () {
        return taid;
      }
    },
    size: 'lg',
    templateUrl: 'js/approvals/approvereject.html'
    });

    modalInstance.result.then(function (approved) {
      if (approved) {
        WorkflowFactory.approve();
      }
      ApprovalsCtrl.dtInstance.reloadData();
    });
  };
};

export default ApprovalsController;
