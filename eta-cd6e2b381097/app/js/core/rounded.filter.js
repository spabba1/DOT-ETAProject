System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    /// <reference path="./../types.ts" />
    /**
     * Rounds number to nth digit because Angular isnt doing it properly.
     * http://stackoverflow.com/questions/20445843/rounding-a-number-in-input-but-keep-full-decimal-value-in-model
     */
    function rounded() {
        return function (val, to) {
            return val.toFixed(to || 0);
        };
    }
    exports_1("default", rounded);
    return {
        setters:[],
        execute: function() {
            ;
        }
    }
});
//# sourceMappingURL=rounded.filter.js.map