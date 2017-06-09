System.register([], function(exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    function ViewController($stateParams, ViewFactory) {
        var ViewCtrl = this;
        ViewCtrl.taform = {};
        ViewFactory.getTa($stateParams.taid, function (response) {
            ViewCtrl.ta = response.data;
            ViewCtrl.ta.formtype = 'view';
        });
    }
    return {
        setters:[],
        execute: function() {
            ViewController.$inject = [
                '$stateParams',
                'ViewFactory'
            ];
            exports_1("default",ViewController);
        }
    }
});
//# sourceMappingURL=view.controller.js.map