StaffController.$inject = [
  '$compile',
  '$http',
  '$log',
  '$scope',
  '$uibModal',
  'DTColumnBuilder',
  'DTOptionsBuilder',
  'ngToast'
];

function StaffController(
  $compile,
  $http,
  $log,
  $scope,
  $uibModal,
  DTColumnBuilder,
  DTOptionsBuilder,
  ngToast
) {

  let StaffCtrl = this;

  StaffCtrl.etausers = {};
  StaffCtrl.dtInstance = {};

  function actionsHtml(data, type, full, meta) {
    StaffCtrl.etausers[data.id] = data;
    return '<div style="white-space: nowrap">' +
      '  <button class="btn btn-default" data-ng-click="StaffCtrl.edit(' + data.id + ')">' +
      '    <i class="glyphicon glyphicon-pencil"></i>' +
      '  </button>&nbsp;' +
      '  <button class="btn btn-default" data-ng-click="StaffCtrl.staffDelete(' + data.id + ')">' +
      '    <i class="glyphicon glyphicon-trash"></i>' +
      '  </button>' +
      '</div>';
  }

  StaffCtrl.edit = function (etauser) {
    let modalInstance = $uibModal.open({
    animation: true,
    controller: 'StaffEditController',
    controllerAs: 'StaffEditCtrl',
    resolve: {
      etauser: function () {
        return etauser;
      }
    },
    size: 'md',
    templateUrl: 'js/staff/staffEdit.html'
    });

    modalInstance.result.then(function (something) {
      if (something.TYPE === 'error') {
        ngToast.create({
          className: 'danger',
          content: something.TEXT
        });
        console.dir(something);
      }

      StaffCtrl.message = 'EDIT';
      StaffCtrl.dtInstance.reloadData();
    }, function (something) {
      console.dir('An error occured: ' + something);
    });
  };

  StaffCtrl.staffDelete = function (etauser) {
    StaffCtrl.message = 'DELETE';
    StaffCtrl.dtInstance.reloadData();
  };

  StaffCtrl.createdRow = function (row, data, dataIndex) {
    // Recompiling so we can bind Angular directive to the DT
    $compile(angular.element(row).contents())($scope);
  };

  StaffCtrl.addStaff = function () {
    let modalInstance = $uibModal.open({
    animation: true,
    controller: 'AddStaffController',
    controllerAs: 'AddStaffCtrl',
    size: 'md',
    templateUrl: 'js/staff/AddStaff.html'
    });
    modalInstance.result.then(function (returned) {
      StaffCtrl.dtInstance.reloadData();
    });
  };


  StaffCtrl.dtOptions = DTOptionsBuilder.fromFnPromise(function () {
    return $http({
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      params: {
        method: 'getAllStaff',
        returnFormat: 'json'
      },
      url: 'model/controller/Staff.cfc'
    }).then(function (response) {
      return response.data;
    });
  })
  .withPaginationType('full_numbers')
    .withOption('createdRow', StaffCtrl.createdRow)
    .withButtons([
        'colvis'
    ]);
  /*.withColVis()
    .withColVisOption('aiExclude', [7]);*/


  StaffCtrl.dtColumns = [
    DTColumnBuilder.newColumn('id').withTitle('ID').notVisible(),
    DTColumnBuilder.newColumn('name').withTitle('Name'),
    DTColumnBuilder.newColumn('email').withTitle('Email').notVisible(),
    DTColumnBuilder.newColumn('staffrole').withTitle('Role'),
    DTColumnBuilder.newColumn('datejoined').withTitle('Joined'),
    DTColumnBuilder.newColumn('dateleft').withTitle('Left').notVisible(),
    DTColumnBuilder.newColumn('otherdetails').withTitle('Notes').notVisible(),
    DTColumnBuilder.newColumn('notify').withTitle('Email Notifications'),
    DTColumnBuilder.newColumn(null).withTitle('Actions').notSortable().renderWith(actionsHtml)
  ];

}

export default StaffController;

