System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ApprovedModalController($uibModalInstance, $http, $log, ApprovedFactory, taid) {
        var ApprovedModalCtrl = this;
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
    }
    return {
        setters:[],
        execute: function() {
            ApprovedModalController.$inject = [
                '$uibModalInstance',
                '$http',
                '$log',
                'ApprovedFactory',
                'taid'
            ];
            ;
            exports_1("default",ApprovedModalController);
        }
    }
});
//# sourceMappingURL=approvedmodal.controller.js.map