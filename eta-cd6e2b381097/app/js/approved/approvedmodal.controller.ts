ApprovedModalController.$inject = [
  '$uibModalInstance',
  '$http',
  '$log',
  'ApprovedFactory',
  'taid'
];

function ApprovedModalController(
  $uibModalInstance,
  $http,
  $log,
  ApprovedFactory,
  taid
  ) {

  let ApprovedModalCtrl = this;

  ApprovedModalCtrl.items = ApprovedFactory.getApprovalPath(taid)
        .then(function (response) {
    ApprovedModalCtrl.items = response;
  });

  ApprovedModalCtrl.ok = function () {
    $uibModalInstance.close();
  };

  ApprovedModalCtrl.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
};

export default ApprovedModalController;
