System.register(['./../create/create.factory', './edit.controller', './edit.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var create_factory_1, edit_controller_1, edit_factory_1;
    return {
        setters:[
            function (create_factory_1_1) {
                create_factory_1 = create_factory_1_1;
            },
            function (edit_controller_1_1) {
                edit_controller_1 = edit_controller_1_1;
            },
            function (edit_factory_1_1) {
                edit_factory_1 = edit_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('edit', [])
                .controller('EditController', edit_controller_1.default)
                .factory('CreateFactory', create_factory_1.default)
                .factory('EditFactory', edit_factory_1.default));
        }
    }
});
//# sourceMappingURL=edit.module.js.map