System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    /// <reference path="./../types.ts" />
    /**
     * Replaces zero with a blank space.  Needed because NaN if input is empty.
     */
    function chkEmpty() {
        return function (input) {
            if (angular.isString(input) &&
                !(angular.equals(input, null) ||
                    angular.equals(input, ''))) {
                return input;
            }
            else {
                return '';
            }
            ;
        };
    }
    exports_1("default", chkEmpty);
    return {
        setters:[],
        execute: function() {
        }
    }
});
//# sourceMappingURL=chkempty.filter.js.map