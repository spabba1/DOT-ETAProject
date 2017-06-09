System.register(['./base64.factory', './chkempty.filter', './delete.factory', './dynamictextsize.directive', './email.factory', './rounded.filter', './security.factory', './workflow.factory'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var base64_factory_1, chkempty_filter_1, delete_factory_1, dynamictextsize_directive_1, email_factory_1, rounded_filter_1, security_factory_1, workflow_factory_1;
    return {
        setters:[
            function (base64_factory_1_1) {
                base64_factory_1 = base64_factory_1_1;
            },
            function (chkempty_filter_1_1) {
                chkempty_filter_1 = chkempty_filter_1_1;
            },
            function (delete_factory_1_1) {
                delete_factory_1 = delete_factory_1_1;
            },
            function (dynamictextsize_directive_1_1) {
                dynamictextsize_directive_1 = dynamictextsize_directive_1_1;
            },
            function (email_factory_1_1) {
                email_factory_1 = email_factory_1_1;
            },
            function (rounded_filter_1_1) {
                rounded_filter_1 = rounded_filter_1_1;
            },
            function (security_factory_1_1) {
                security_factory_1 = security_factory_1_1;
            },
            function (workflow_factory_1_1) {
                workflow_factory_1 = workflow_factory_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('eta.core', [])
                .directive('dynamicTextSize', dynamictextsize_directive_1.default)
                .factory('Base64', base64_factory_1.default)
                .factory('DeleteFactory', delete_factory_1.default)
                .factory('EmailFactory', email_factory_1.default)
                .factory('SecurityFactory', security_factory_1.default)
                .factory('WorkflowFactory', workflow_factory_1.default)
                .filter('rounded', rounded_filter_1.default)
                .filter('chkEmpty', chkempty_filter_1.default));
        }
    }
});
//# sourceMappingURL=core.module.js.map