System.register(['./approved.controller', './approvedmodal.controller', './approved.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var approved_controller_1, approvedmodal_controller_1, approved_factory_1;
    return {
        setters:[
            function (approved_controller_1_1) {
                approved_controller_1 = approved_controller_1_1;
            },
            function (approvedmodal_controller_1_1) {
                approvedmodal_controller_1 = approvedmodal_controller_1_1;
            },
            function (approved_factory_1_1) {
                approved_factory_1 = approved_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('approved', [])
                .controller('ApprovedController', approved_controller_1.default)
                .controller('ApprovedModalController', approvedmodal_controller_1.default)
                .factory('ApprovedFactory', approved_factory_1.default));
        }
    }
});
//# sourceMappingURL=approved.module.js.map