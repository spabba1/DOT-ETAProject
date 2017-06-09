System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function SendForApprovalController($log, $uibModalInstance, CreateFactory) {
        var SendCtrl = this;
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
    return {
        setters:[],
        execute: function() {
            SendForApprovalController.$inject = [
                '$log',
                '$uibModalInstance',
                'CreateFactory'
            ];
            exports_1("default",SendForApprovalController);
        }
    }
});
//# sourceMappingURL=sendforapproval.controller.js.map