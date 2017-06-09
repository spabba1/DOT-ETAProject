System.register(['./create.controller', './taformodalinstance.controller', './create.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var create_controller_1, taformodalinstance_controller_1, create_factory_1;
    return {
        setters:[
            function (create_controller_1_1) {
                create_controller_1 = create_controller_1_1;
            },
            function (taformodalinstance_controller_1_1) {
                taformodalinstance_controller_1 = taformodalinstance_controller_1_1;
            },
            function (create_factory_1_1) {
                create_factory_1 = create_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('create', [])
                .controller('CreateController', create_controller_1.default)
                .controller('TaForModalInstanceController', taformodalinstance_controller_1.default)
                .factory('CreateFactory', create_factory_1.default));
        }
    }
});
//# sourceMappingURL=create.module.js.map