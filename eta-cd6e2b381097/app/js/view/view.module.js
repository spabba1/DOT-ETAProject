System.register(['./view.controller', './view.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var view_controller_1, view_factory_1;
    return {
        setters:[
            function (view_controller_1_1) {
                view_controller_1 = view_controller_1_1;
            },
            function (view_factory_1_1) {
                view_factory_1 = view_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('view', [])
                .controller('ViewController', view_controller_1.default)
                .factory('ViewFactory', view_factory_1.default));
        }
    }
});
//# sourceMappingURL=view.module.js.map