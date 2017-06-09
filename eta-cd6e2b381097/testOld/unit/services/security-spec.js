/*global describe, beforeEach, inject, httpBackend, expect, it*/
'use strict';

describe('Security Service Tests', function () {
    var scope, ctrl, SecurityService;

    beforeEach(module('eta'));

    beforeEach(inject(function($rootScope, _SecurityService_) {
        scope = $rootScope.$new();
        SecurityService = _SecurityService_;
    }));

    it ('should be true', function () {
        expect(SecurityService.test()).toBeTruthy();
    });

});


