/// <reference path='./../types.ts' />

TaForModalInstanceController.$inject = [
  '$http',
  '$log',
  '$uibModalInstance',
  'CreateFactory'
];

function TaForModalInstanceController(
  $http,
  $log,
  $uibModalInstance,
  CreateFactory
) {

  let TaForModalCtrl = this;

  TaForModalCtrl.ta = {};
  TaForModalCtrl.selectedUser = undefined;

  TaForModalCtrl.getNames = function (val) {
    return CreateFactory.findLdapUserService(val)
      .then(function (response) {
        return response.data.map(function (users) {
          return users;
        });
      }, function (response) {
        $log.error(response);
        return response;
      });
  };

  TaForModalCtrl.onSelect = function ($item, $model, $label) {
    TaForModalCtrl.$item = $item;
    TaForModalCtrl.$model = $model;
    TaForModalCtrl.$label = $label;
  };


  TaForModalCtrl.autofill = function (ein) {
    const travelerid = parseInt(ein, 0);
    TaForModalCtrl.pleaseWait = $http({
      method: 'GET',
      params: {
        employeeNumber: travelerid,
        method: 'getUserByEinForTa',
        returnFormat: 'json'
      },
      url: 'model/controller/Ldap.cfc'
    }).then(function (response) {
      $log.info('Success');
      $uibModalInstance.close(response.data[0]);
    }).catch(function (response) {
      $log.error('LDAP error', response.status, response.data);
      TaForModalCtrl.message = 'Please select a name.';
    }).finally(function () {
      $log.info('Finish LDAP Query');

    });
  };

  TaForModalCtrl.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
}

export default TaForModalInstanceController;

