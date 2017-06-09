/// <reference path="../../typings/jasmine/jasmine.d.ts" />
describe('eta', function () {
    beforeEach(module('eta'));
    beforeEach(inject(function ($rootScope) {
        log('beforeEach');
    }));
    it('should allow me to test the run() block', inject(function ($rootScope) {
        log('it block');
        expect($rootScope.valueSetInRun).toBe(6626);
    }));
});
//# sourceMappingURL=app.spec.js.map