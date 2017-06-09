AddStaffController.$inject = [
  '$http',
  '$log',
  '$scope',
  '$uibModalInstance',
  'ngToast',
  'CreateFactory',
  'StaffFactory'
];

function AddStaffController(
  $http,
  $log,
  $scope,
  $uibModalInstance,
  ngToast,
  CreateFactory,
  StaffFactory
) {

  let AddStaffCtrl = this;

      AddStaffCtrl.selectedStaff = undefined;
      AddStaffCtrl.staffer = {};

      AddStaffCtrl.notifyChoices = [
        { name: 'Y', value: 'Y' },
        { name: 'N', value: 'N' }
      ];

      AddStaffCtrl.staffRoles = StaffFactory.getStaffRoles().then(function(response) {
        AddStaffCtrl.staffRoles = response;
      });

      AddStaffCtrl.getLdapResults = function (val) {
        return CreateFactory.findLdapUserService(val).then (function (response) {
          return response.data.map(function (users) {
            return users;
          });
        }, function (response) {
          $log.error(response);
          return response;
        });
      };

      AddStaffCtrl.onSelect = function (item, model, label, event) {
        console.dir(item);
        console.dir(model);
        console.dir(label);
        console.dir(event);

        AddStaffCtrl.staffer.name = item.CN;
        AddStaffCtrl.staffer.email = item.MAIL;
        AddStaffCtrl.staffer.employeenumber = item.EMPLOYEENUMBER;
        AddStaffCtrl.staffer.firstname = item.GIVENNAME;
        AddStaffCtrl.staffer.lastname = item.SN;
        AddStaffCtrl.staffer.username = item.UID;

      };

      AddStaffCtrl.addStaff = function (addStaffForm) {
        $scope.$broadcast('show-errors-check-validity');
        if (addStaffForm.$valid) {
          AddStaffCtrl.pleaseWait = StaffFactory.addStaffMember(AddStaffCtrl.staffer).then(function (data) {
            if (data.TYPE === 'success') {
              ngToast.create({
                className: data.TYPE,
                content: data.TEXT
              });
              $uibModalInstance.close(data);
            } else {
              ngToast.create({
                className: 'danger',
                content: data.TEXT
              });
              console.dir(data);
            }

          }, function (response) {
            if (response.status > 200) {
              ngToast.create({
                className: 'danger',
                content: response.statusText
              });
              $log.error(response.data);
            } else {
              ngToast.create({
                className: 'danger',
                content: response.MESSAGE.LocalizedMessage
              });
              $log.error(response);
            }
            return;
          });

        } else {
          $log.error('Invalid Form');
          console.dir(AddStaffCtrl);
        };
      };

      AddStaffCtrl.cancel = function () {
        $uibModalInstance.dismiss('cancel');
      };
    }

export default AddStaffController;
