System.register(['./toestimate.controller', './rejectreason.controller', './toestimate.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var toestimate_controller_1, rejectreason_controller_1, toestimate_factory_1;
    return {
        setters:[
            function (toestimate_controller_1_1) {
                toestimate_controller_1 = toestimate_controller_1_1;
            },
            function (rejectreason_controller_1_1) {
                rejectreason_controller_1 = rejectreason_controller_1_1;
            },
            function (toestimate_factory_1_1) {
                toestimate_factory_1 = toestimate_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('toestimate', [])
                .controller('ToEstimateController', toestimate_controller_1.default)
                .controller('RejectReasonController', rejectreason_controller_1.default)
                .factory('ToEstimateFactory', toestimate_factory_1.default));
        }
    }
});
//# sourceMappingURL=toestimate.module.js.map