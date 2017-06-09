/*global angular, describe, it, beforeEach, expect, inject */
describe('Estimate Factory Tests', function () {


	var EstimateFactory; 

	beforeEach(function() {
		angular.module('eta');
	});

	beforeEach(inject(function() {
		var $injector = angular.injector(['eta']);
		EstimateFactory = $injector.get('EstimateService');
	}));

	it('should get a TA', function () {
		var ta = EstimateFactory.getTa();
		expect(ta).toBeTruthy();
	});

});
