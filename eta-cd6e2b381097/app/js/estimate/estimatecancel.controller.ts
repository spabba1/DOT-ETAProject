/// <reference path="./../types.ts" />
EstimateCancelController.$inject = [
  '$location',
  '$uibModalInstance'
];

function EstimateCancelController(
  $location,
  $uibModalInstance
) {

  let CancelCtrl = this;

  CancelCtrl.cancelNo = function() {
    $uibModalInstance.close();
  };

  CancelCtrl.cancelYes = function() {
    $uibModalInstance.dismiss('cancel');
    $location.path('/toestimate');
  };
}

export default EstimateCancelController;

