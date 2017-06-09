ModalInstanceCtrl.$inject = ['$uibModalInstance', 'items'];

function ModalInstanceCtrl($uibModalInstance, items) {

  let ThisInstance = this;

  ThisInstance.items = items;
  ThisInstance.selected = {
    item: ThisInstance.items[0]
  };

  ThisInstance.ok = function () {
    $uibModalInstance.close(ThisInstance.selected.item);
  };

  ThisInstance.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
}

export default ModalInstanceCtrl;
