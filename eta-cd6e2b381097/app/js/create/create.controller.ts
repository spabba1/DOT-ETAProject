/// <reference path="../types.ts" />

CreateController.$inject = [
  '$http',
  '$log',
  '$scope',
  '$uibModal',
  'CreateFactory',
  'SecurityFactory'
];

function CreateController(
  $http,
  $log,
  $scope,
  $uibModal,
  CreateFactory,
  SecurityFactory

  ) {

  let CreateCtrl = this;

  CreateCtrl.username = SecurityFactory.getCurrentUsername();

  CreateFactory.EmptyTaBeanService().then(function (data) {
    CreateCtrl.ta = data;
    CreateCtrl.ta.formtype = 'create'; // for button-types in view
    CreateCtrl.ta.preparer = CreateCtrl.username;

  });

  CreateFactory.EmptyOosBeanService().then(function (data) {
    CreateCtrl.oos = data;
  });

  CreateCtrl.openForYou = function () {
    $scope.$broadcast('show-errors-reset');
    CreateCtrl.pleaseWait = CreateFactory.GetLdapUserService.getUser(CreateCtrl.username)
      .then(function (userObj) {
        $log.info(userObj);
        CreateCtrl.ta.bu = userObj.bu;
        CreateCtrl.ta.dept = userObj.dept;
        CreateCtrl.ta.div = userObj.div;
        CreateCtrl.ta.dutystation = userObj.dutystation;
        CreateCtrl.ta.travelerid = userObj.travelerid;
        CreateCtrl.ta.pvn = userObj.pvn;
        CreateCtrl.ta.title = userObj.title;
        CreateCtrl.ta.travelername = userObj.fullname;
        CreateCtrl.ta.homeaddress = userObj.homeaddress;
        CreateCtrl.ta.homecity = userObj.homecity;
        CreateCtrl.ta.homestate = userObj.homestate;
        CreateCtrl.ta.homezip = userObj.homezip;
        CreateCtrl.ta.workdays = userObj.workdays;
        CreateCtrl.ta.worktime = userObj.worktime;
      });
  };

  CreateCtrl.openForSomeone = function () {
    $scope.$broadcast('show-errors-reset');
    let modalInstance = $uibModal.open({
    animation: true,
    controller: 'TaForModalInstanceController',
    controllerAs: 'TaForModalCtrl',
    resolve: {
      travelerid: function () {
        return CreateCtrl.travelerid;
      }
    },
    size: 'md',
    templateUrl: './js/create/taAutofill.html'
    });

    modalInstance.result.then(function (userInfo) {
      $log.info(userInfo);
      CreateCtrl.ta.travelerid = userInfo.EMPLOYEENUMBER;
      CreateCtrl.ta.travelername = userInfo.CN;
      CreateCtrl.ta.title = userInfo.TITLE;
      CreateCtrl.ta.dept = userInfo.OU;
      CreateCtrl.ta.div = userInfo.OU2;
      CreateCtrl.ta.bu = userInfo.BARGAININGUNIT;
      CreateCtrl.ta.dutystation = userInfo.L;
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };

  CreateCtrl.clear = function () {
      $scope.$broadcast('show-errors-reset');
      CreateFactory.EmptyTaBeanService().then(function (data) {
        CreateCtrl.ta = data;
        CreateCtrl.ta.formtype = 'create'; // for button-types in view
        CreateCtrl.ta.preparer = CreateCtrl.username;
      });
  };
}

export default CreateController;

