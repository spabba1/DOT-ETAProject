System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function DeleteModalInstanceController($modalInstance, taid) {
        var DeleteCntl = this;
        DeleteCntl.delete = function () {
            $modalInstance.close(taid);
        };
        DeleteCntl.cancel = function () {
            $modalInstance.dismiss('cancel');
        };
    }
    return {
        setters:[],
        execute: function() {
            DeleteModalInstanceController.$inject = [
                '$modalInstance',
                'taid'
            ];
            exports_1("default",DeleteModalInstanceController);
        }
    }
});
//# sourceMappingURL=deletemodalinstance.controller.js.map