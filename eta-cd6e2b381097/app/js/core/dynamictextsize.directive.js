System.register([], function(exports_1, context_1) {
    /// <reference path="./../types.ts" />
    'use strict';
    var __moduleName = context_1 && context_1.id;
    function dynamicTextSize() {
        return function (scope, element, attrs) {
            // console.dir(name);
            element.bind('keyup', function (types, data, fn) {
                var textLength = element.val().length;
                console.dir(textLength);
                if (textLength < 16) {
                    element.css('font-size', '100%');
                }
                else if (textLength < 18) {
                    element.css('font-size', '93%');
                }
                else if (textLength < 19) {
                    element.css('font-size', '85%');
                }
                else if (textLength < 20) {
                    element.css('font-size', '77%');
                }
                else if (textLength < 22) {
                    element.css('font-size', '63%');
                }
                else if (textLength < 24) {
                    element.css('font-size', '54%');
                }
            });
        };
    }
    exports_1("default", dynamicTextSize);
    return {
        setters:[],
        execute: function() {
        }
    }
});
//# sourceMappingURL=dynamictextsize.directive.js.map