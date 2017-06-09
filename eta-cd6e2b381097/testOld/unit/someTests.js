/*global angular, beforeEach, describe, expect, inject, it*/
/*jslint nomen: true, */
'use strict';

/* jasmine specs for controllers go here */
describe('Eta Controllers', function () {
    beforeEach(function () {
        this.addMatchers({
            toEqualData: function (expected) {
                return angular.equals(this.actual, expected);
            }
        });
    });
});

describe('TaReviewYoursCtrlTest', function () {
    beforeEach(module('eta'));

    var $controller;

    beforeEach(inject(function (_$controller_) {
        $controller = _$controller_;
    }));

});

describe('yesDelete Directive', function () {
    var $compile,
        $rootScope,
        form;

    beforeEach(module('eta'));

    beforeEach(inject(function (_$compile_, _$rootScope_) {
        $compile = _$compile_;
        $rootScope = _$rootScope_;
    }));

    it('should start invalid', function () {
		var element = $compile(
			'<form name="form">' +
				'<input type="text" data-ng-model="yesdelete" name="yesdelete" class="form-control" yesdelete required>' +
				'</form>'
		)($rootScope);

        $rootScope.$digest();

        expect($rootScope.form.yesdelete.$invalid).toBe(true);
        $rootScope.form.yesdelete.$setViewValue('del');
        expect($rootScope.form.yesdelete.$invalid).toBe(true);
        $rootScope.form.yesdelete.$setViewValue('delete');
        expect($rootScope.form.yesdelete.$valid).toBe(true);

    });
});

describe('Unit testing great quotes', function () {
    var $compile,
        $rootScope;

    beforeEach(module('eta'));

    beforeEach(inject(function (_$compile_, _$rootScope_) {
        $compile = _$compile_;
        $rootScope = _$rootScope_;
    }));

    it('Replaces the element with the appropriate content', function () {
        var element = $compile("<a-great-eye></a-great-eye>")($rootScope);
        $rootScope.$digest();
        expect(element.html()).toContain("lidless, wreathed in flame, 2 times");
    });
});
