System.register(['./approvals.controller', './approvalmodal.controller', './rejectreasonmodal.controller'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var approvals_controller_1, approvalmodal_controller_1, rejectreasonmodal_controller_1;
    return {
        setters:[
            function (approvals_controller_1_1) {
                approvals_controller_1 = approvals_controller_1_1;
            },
            function (approvalmodal_controller_1_1) {
                approvalmodal_controller_1 = approvalmodal_controller_1_1;
            },
            function (rejectreasonmodal_controller_1_1) {
                rejectreasonmodal_controller_1 = rejectreasonmodal_controller_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('approvals', [])
                .controller('ApprovalsController', approvals_controller_1.default)
                .controller('ApprovalModalController', approvalmodal_controller_1.default)
                .controller('RejectReasonModalController', rejectreasonmodal_controller_1.default));
        }
    }
});
//# sourceMappingURL=approvals.module.js.map