ApprovalModalController.$inject = [
  '$scope',
  '$location',
  '$log',
  '$uibModal',
  '$uibModalInstance',
  'ngToast',
  'EmailFactory',
  'SendFactory',
  'SecurityFactory',
  'WorkflowFactory',
  'taid'
];

function ApprovalModalController(
  $scope,
  $location,
  $log,
  $uibModal,
  $uibModalInstance,
  ngToast,
  EmailFactory,
  SendFactory,
  SecurityFactory,
  WorkflowFactory,
  taid
) {

  let ApprovalsCtrl = this;

  ApprovalsCtrl.authdata = SecurityFactory.getAuthData();

  ApprovalsCtrl.pleaseWait = SendFactory.createPdf(taid).then(function (response) {
    const pdfData = SendFactory.base64DecToArr(response.data);
    const etaPdf = new Blob([pdfData], {type: 'application/pdf'});
    const pdfUrl = URL.createObjectURL(etaPdf);

    $scope.pdfUrl = pdfUrl;
  });

  ApprovalsCtrl.approve = function () {
    ApprovalsCtrl.pleaseWait = WorkflowFactory.approve(taid, ApprovalsCtrl.authdata)
      .then(function (response) {
        console.dir(response);
        if (response.data.STATUS === 'success') {
          ngToast.create({
            className: response.data.STATUS,
            content: response.data.MESSAGE
          });
        } else {
          console.dir(response);
          EmailFactory.sendError(response);
          if (response.status > 200) {
            ngToast.create({
              className: 'danger',
              content: response.statusText
            });
          } else {
            ngToast.create({
              className: response.data.STATUS,
              content: response.data.MESSAGE
            });
          }
        }
        $uibModalInstance.close();
      });
  };

  ApprovalsCtrl.reject = function () {
    let modalInstance = $uibModal.open({
      animation: true,
      controller: 'RejectReasonModalController',
      controllerAs: 'RejectReasonCtrl',
      templateUrl: 'js/approvals/reject-reason.html',
    });

    modalInstance.result.then(function (reason) {
      ApprovalsCtrl.pleaseWait = WorkflowFactory.reject(taid, reason, ApprovalsCtrl.authdata)
        .then(function (response) {
          if (response.data.STATUS === 'success') {
            ngToast.create({
              className: response.data.STATUS,
              content: response.data.MESSAGE
            });
          } else {
            console.dir(response);
            EmailFactory.sendError(response);
            if (response.status > 200) {
              ngToast.create({
                className: 'danger',
                content: response.statusText
              });
            } else {
              ngToast.create({
                className: 'danger',
                content: response.data.DETAILS.Message
              });
            }
          }
          $uibModalInstance.close();
        });
    });
  };
};

export default ApprovalModalController;
