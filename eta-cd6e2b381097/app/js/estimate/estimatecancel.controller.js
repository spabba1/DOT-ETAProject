System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function EstimateCancelController($location, $uibModalInstance) {
        var CancelCtrl = this;
        CancelCtrl.cancelNo = function () {
            $uibModalInstance.close();
        };
        CancelCtrl.cancelYes = function () {
            $uibModalInstance.dismiss('cancel');
            $location.path('/toestimate');
        };
    }
    return {
        setters:[],
        execute: function() {
            /// <reference path="./../types.ts" />
            EstimateCancelController.$inject = [
                '$location',
                '$uibModalInstance'
            ];
            exports_1("default",EstimateCancelController);
        }
    }
});
//# sourceMappingURL=estimatecancel.controller.js.map