/*global angular, describe, beforeEach, inject, expect, it*/
'use strict';

describe('Security Controller Tests', function () {
    beforeEach(module('eta'));

    var $scope, $controller, SecurityService;

    beforeEach(inject(function (_$controller_, $rootScope, _SecurityService_) {
        $controller = _$controller_;
        $scope = $rootScope.$new();
        SecurityService = _SecurityService_;
    }));

    it ('should be true', function () {
        $scope = {};
        $controller = $controller('TestController', {$scope: $scope});
        expect($scope.tester).toBeTruthy();
    });

    describe('Login Controller', function () {
        it('should login issdtest1', function () {
            $scope = {};
            $controller = $controller('LoginController', {
                    $scope: $scope,
                    SecurityService: SecurityService
            });

            $scope.username = 'issdtest1';
            $scope.password = 'Summer2015!';

            $scope.login();

        });
    });
});

