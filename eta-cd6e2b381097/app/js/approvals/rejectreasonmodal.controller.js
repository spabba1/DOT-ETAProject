System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function RejectReasonModalController($log, $uibModalInstance) {
        var RejectReasonCtrl = this;
        RejectReasonCtrl.reject = function () {
            $uibModalInstance.close(RejectReasonCtrl.rejectReason);
        };
        RejectReasonCtrl.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            RejectReasonModalController.$inject = [
                '$log',
                '$uibModalInstance'
            ];
            ;
            exports_1("default",RejectReasonModalController);
        }
    }
});
//# sourceMappingURL=rejectreasonmodal.controller.js.map