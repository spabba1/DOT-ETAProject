System.register(['./send.controller', './sendforapproval.controller', './send.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var send_controller_1, sendforapproval_controller_1, send_factory_1;
    return {
        setters:[
            function (send_controller_1_1) {
                send_controller_1 = send_controller_1_1;
            },
            function (sendforapproval_controller_1_1) {
                sendforapproval_controller_1 = sendforapproval_controller_1_1;
            },
            function (send_factory_1_1) {
                send_factory_1 = send_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('send', [])
                .controller('SendController', send_controller_1.default)
                .controller('SendForApprovalController', sendforapproval_controller_1.default)
                .factory('SendFactory', send_factory_1.default));
        }
    }
});
//# sourceMappingURL=send.module.js.map