/*global describe, beforeEach, jasmine, inject, it, expect */
'use strict';
describe('StaffService Spec', function () {
  var mock, StaffService, $scope;

  beforeEach(module('eta'));

  beforeEach(function() {
    mock = {alert: jasmine.createSpy()};

    module(function($provide) {
      $provide.value('$window', mock);
    });

    inject(function($rootScope, $injector) {
      StaffService = $injector.get('StaffService');
      $scope = $rootScope.$new();
    });
  });

  describe('Notify test', function () {

    it ('should not alert first two notifications', function () {
      StaffService.notify('one');
      StaffService.notify('two');

      expect(mock.alert).not.toHaveBeenCalled();
    });

    it ('should alert all after third notification', function () {
      StaffService.notify('one');
      StaffService.notify('two');
      StaffService.notify('three');

      expect(mock.alert).toHaveBeenCalledWith('one\ntwo\nthree');
    });

    it('should clear messages after alert', function() {
     StaffService.notify('one');
     StaffService.notify('two');
     StaffService.notify('third');
     StaffService.notify('more');
     StaffService.notify('two');
     StaffService.notify('third');

     expect(mock.alert.calls.count()).toEqual(2);
     expect(mock.alert.calls.mostRecent().args[0]).toEqual('more\ntwo\nthird');
    });
  });

  describe('Staff Roles array of objects for ui-select', function () {

    it('should bring back an array of objects', function () {
      var expectedResult = [
        { name: 'Travel Planner', value: 1 },
        { name: 'Divisional Approver', value: 2 },
        { name: 'Departmental Approver', value: 3 }
      ];

      console.log(expectedResult);
      StaffService.getStaffRoles().then(function (response) {
        console.log(expectedResult);
        expect(response).toEqual(expectedResult);
      });
    });
  });
});
