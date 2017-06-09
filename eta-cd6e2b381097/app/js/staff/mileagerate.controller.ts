MileageRateController.$inject = [
  '$scope',
  '$log',
  'SecurityFactory',
  'StaffFactory'
];

function MileageRateController(
      $scope,
      $log,
      SecurityService,
      StaffService
    ) {

      $scope.enableSave = false;

      $scope.mrChanged = function () {
        $scope.enableSave = true;
      };

      StaffService.getMileageRate()
      .then(function (response) {
        $scope.mileagerate = response;
        $scope.mileagerate.changedby = SecurityService.getCurrentUsername();
      });

      $scope.saveChanges = function (data) {
        StaffService.updateConstants(data).then(function () {
          $scope.enableSave = false;
        });
      };

};

export default MileageRateController;