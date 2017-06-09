RejectReasonModalController.$inject = [
  '$log',
  '$uibModalInstance'
];

function RejectReasonModalController(
    $log,
    $uibModalInstance
    ) {

  let RejectReasonCtrl = this;

  RejectReasonCtrl.reject = function () {
    $uibModalInstance.close(RejectReasonCtrl.rejectReason);
  };

  RejectReasonCtrl.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
};

export default RejectReasonModalController;
