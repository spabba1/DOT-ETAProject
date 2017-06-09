/// <reference path="./../types.ts" /> 

DeleteController.$inject = [
  '$uibModalInstance',
  'taid'
];

function DeleteController(
  $uibModalInstance,
  taid
) {

  let DeleteCtrl = this;

  DeleteCtrl.ok = function () {
    $uibModalInstance.close(taid);
  };

  DeleteCtrl.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
}

export default DeleteController;
