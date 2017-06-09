/// <reference path="./../types.ts" /> 
System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function DeleteController($uibModalInstance, taid) {
        var DeleteCtrl = this;
        DeleteCtrl.ok = function () {
            $uibModalInstance.close(taid);
        };
        DeleteCtrl.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            DeleteController.$inject = [
                '$uibModalInstance',
                'taid'
            ];
            exports_1("default",DeleteController);
        }
    }
});
//# sourceMappingURL=delete.controller.js.map