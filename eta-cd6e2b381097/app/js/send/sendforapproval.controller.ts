SendForApprovalController.$inject = [
  '$log',
  '$uibModalInstance',
  'CreateFactory'
];

function SendForApprovalController(
  $log,
  $uibModalInstance,
  CreateFactory
  ) {

  let SendCtrl = this;

  SendCtrl.selectedApprover = undefined;

  SendCtrl.getNames = function (val) {
    return CreateFactory.findLdapUserService(val)
      .then(function (response) {
        console.dir(response);
        return response.data.map(function (users) {
          return users;
        });
      }, function (response) {
        console.dir(response);
        return response;
      });
  };

  SendCtrl.send = function () {
    $uibModalInstance.close(SendCtrl.selectedApprover);
  };

  SendCtrl.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };

}


export default SendForApprovalController;

