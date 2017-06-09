System.register(['./login.controller'], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var login_controller_1;
    return {
        setters:[
            function (login_controller_1_1) {
                login_controller_1 = login_controller_1_1;
            }],
        execute: function() {
            exports_1("default",angular.module('login', [])
                .controller('LoginController', login_controller_1.default));
        }
    }
});
//# sourceMappingURL=login.module.js.map