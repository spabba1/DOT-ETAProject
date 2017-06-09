/// <reference path="./../types.ts" />
'use strict';

SendController.$inject = [
    '$log',
    '$scope',
    '$uibModal',
    '$stateParams',
    'ngToast',
    'SendFactory',
    'SecurityFactory'
];

function SendController(
    $log,
    $scope,
    $uibModal,
    $stateParams,
    ngToast,
    SendFactory,
    SecurityFactory
    ) {

  let SendCtrl = this;

  const taid = $stateParams.taid;
  const authdata = SecurityFactory.getAuthData();

  SendCtrl.pleaseWait = SendFactory.createPdf(taid).then(function (response) {
    let pdfData = SendFactory.base64DecToArr(response.data);
    let etaPdf = new Blob([pdfData], {type: 'application/pdf'});
    let pdfUrl = URL.createObjectURL(etaPdf);

    $scope.pdfUrl = pdfUrl;
  });

  SendCtrl.scroll = 0;
  // SendCtrl.loading = 'Please wait... Generating PDF...';

  SendCtrl.getNavStyle = function (scroll) {
    if (scroll > 100) {
      return 'pdf-controls fixed';
    }
    return 'pdf-controls';
  };

  SendCtrl.onError = function (error) {
    $log.error(error);
  };

  SendCtrl.onLoad = function () {
    SendCtrl.loading = '';
  };

  SendCtrl.onProgress = function (progress) {
    $log.info(progress);
  };

  SendCtrl.sendForApproval = function () {
    let modalInstance = $uibModal.open({
      controller: 'SendForApprovalController',
      controllerAs: 'SendCtrl',
      resolve: {
        approver: function () {
          return SendCtrl.approver;
        }
      },
      size: 'md',
      templateUrl: '/js/send/sendforapproval.html'
    });

    modalInstance.result.then(function (approver) {
      SendCtrl.pleaseWait = SendFactory.sendToEdocs(taid, approver.UID, authdata)
        .then(function (response) {
          console.dir(response);
          if (response.status === 200) {
            ngToast.create({
              className: 'success',
              content: 'TA has been checked into eDocs for approval.'
            });
          } else {
            ngToast.create({
              className: 'danger',
              // content: 'Something went wrong, your TA was not saved. Please try again.'
              content: response.statusText
            });
            $location.path('/');
          }
        }, function (response) {
          $log.error('Something went wrong');
          ngToast.create({
            className: 'danger',
            content: data.statusText
          });
          console.dir(response);
        });
      });
    };

}
export default SendController;
