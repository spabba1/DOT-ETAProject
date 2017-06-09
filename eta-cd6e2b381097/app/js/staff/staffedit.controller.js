System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function StaffEditController($log, $uibModalInstance, ngToast, etauser, StaffFactory) {
        var StaffEditCtrl = this;
        StaffEditCtrl.notifyChoices = [
            { name: 'Y', value: 'Y' },
            { name: 'N', value: 'N' }
        ];
        StaffEditCtrl.staffRoles = StaffFactory.getStaffRoles().then(function (response) {
            StaffEditCtrl.staffRoles = response;
        });
        StaffFactory.getStaffMember(etauser).then(function (data) {
            StaffEditCtrl.etauser = data;
            StaffEditCtrl.etauser.staffroleid = {
                ID: data.staffroleid
            };
            StaffEditCtrl.etauser.notify = {
                value: data.notify
            };
        }, function (data) {
            console.dir(data);
        });
        StaffEditCtrl.update = function (etauserUpd) {
            etauserUpd.staffroleid = etauserUpd.staffroleid.ID;
            etauserUpd.notify = etauserUpd.notify.value;
            StaffFactory.updateStaffMember(etauserUpd).then(function (data) {
                $uibModalInstance.close(data);
            }, function (response) {
                if (response.status > 200) {
                    ngToast.create({
                        className: 'danger',
                        content: response.statusText
                    });
                    $log.error(response.data);
                }
                else {
                    ngToast.create({
                        className: 'danger',
                        content: response.MESSAGE.LocalizedMessage
                    });
                    $log.error(response);
                }
                return;
            });
        };
        StaffEditCtrl.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            StaffEditController.$inject = [
                '$log',
                '$uibModalInstance',
                'ngToast',
                'etauser',
                'StaffFactory'
            ];
            exports_1("default",StaffEditController);
        }
    }
});
//# sourceMappingURL=staffedit.controller.js.map