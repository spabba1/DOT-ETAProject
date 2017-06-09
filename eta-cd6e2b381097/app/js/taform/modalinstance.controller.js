System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ModalInstanceCtrl($uibModalInstance, items) {
        var ThisInstance = this;
        ThisInstance.items = items;
        ThisInstance.selected = {
            item: ThisInstance.items[0]
        };
        ThisInstance.ok = function () {
            $uibModalInstance.close(ThisInstance.selected.item);
        };
        ThisInstance.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            ModalInstanceCtrl.$inject = ['$uibModalInstance', 'items'];
            exports_1("default",ModalInstanceCtrl);
        }
    }
});
//# sourceMappingURL=modalinstance.controller.js.map