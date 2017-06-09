/// <reference path="./../types.ts" />
System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function hideZero() {
        return function (scope, element) {
            element.on('input', function () {
                if (this.value === "0") {
                    this.value = "";
                }
            });
        };
    }
    exports_1("default", hideZero);
    return {
        setters:[],
        execute: function() {
            ;
        }
    }
});
//# sourceMappingURL=hidezero.directive.js.map