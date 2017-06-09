System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function RejectReasonController($uibModalInstance, taid, ToEstimateFactory) {
        var RejectCtrl = this;
        ToEstimateFactory.getRejectReason(taid).then(function (data) {
            RejectCtrl.reason = data;
        });
        RejectCtrl.ok = function () {
            $uibModalInstance.close();
        };
    }
    return {
        setters:[],
        execute: function() {
            RejectReasonController.$inject = [
                '$uibModalInstance',
                'taid',
                'ToEstimateFactory'
            ];
            exports_1("default",RejectReasonController);
        }
    }
});
//# sourceMappingURL=rejectreason.controller.js.map