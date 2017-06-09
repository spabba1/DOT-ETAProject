RejectReasonController.$inject = [
  '$uibModalInstance',
  'taid',
  'ToEstimateFactory'
];

function RejectReasonController(
  $uibModalInstance,
  taid,
  ToEstimateFactory
) {

  const RejectCtrl = this;

  ToEstimateFactory.getRejectReason(taid).then(function (data) {
    RejectCtrl.reason = data;
  });

  RejectCtrl.ok = function () {
    $uibModalInstance.close();
  };
}

export default RejectReasonController;
