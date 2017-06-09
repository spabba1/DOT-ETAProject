System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function OOStateController($uibModalInstance, oos) {
        var OosStateCtrl = this;
        OosStateCtrl.oos = oos;
        OosStateCtrl.ok = function () {
            $uibModalInstance.close(OosStateCtrl.oos);
        };
        OosStateCtrl.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            OOStateController.$inject = [
                '$uibModalInstance',
                'oos'
            ];
            exports_1("default",OOStateController);
        }
    }
});
//# sourceMappingURL=oostatemodalinstance.controller.js.map