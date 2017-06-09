/// <reference path="./../../../app/js/types.ts" />

//const env = require('../environment.js');

describe('Create a TA', function () {

  beforeAll(function() {
    browser.get('#/sangster');
    expect(browser.getTitle()).toEqual('ETA | Create | Employee Intranet || Alaska DOT&PF');
  });

  it('should bring up the Home page', function () {
    element(by.id('createTaBtn')).click();
    element(by.id('autofill')).click();
    expect(element(by.model('taFormData.ta.travelerid')).getAttribute('value')).toEqual('321333');
  });

    // it('should bring up the Create TA page', function () {
        // browser.driver.findElement(by.id('createTaBtn')).click();
        // /*expect(browser.getTitle()).toEqual("Create TA |  Employee Intranet || Alaska DOT&amp;PF");*/
    // });

    /*
    it('should automatically fill in user data', function () {
        element(by.id('autofill')).click().then(function () {
            expect(element(by.model('ta.ein')).getAttribute('value')).toEqual('999999');
            expect(element(by.model('ta.travelername')).getAttribute('value')).toEqual('ISSDTEST1');
            expect(element(by.model('ta.title')).getAttribute('value')).toEqual('Test User');
            expect(element(by.model('ta.dept')).getAttribute('value')).toEqual('Transportation & Public Facilities');
            expect(element(by.model('ta.div')).getAttribute('value')).toEqual('ISD-INFO SYS SVCS');
            expect(element(by.model('ta.dutystation')).getAttribute('value')).toEqual('Juneau');
        });
    });
   */

  /*
    it('should continue filling in the form and SAVE the ta', function () {
        browser.element(by.model('ta.workdays')).sendKeys('M-F');
        browser.element(by.model('ta.worktime')).sendKeys('8am - 4pm');
        browser.element(by.model('ta.departurefrom')).sendKeys('Juneau');
        browser.element(by.xpath('/html/body/div[1]/div/div[5]/div[3]/div[2]/form/div[8]/div[2]/div/span/button')).click();
        browser.element(by.xpath('/html/body/div[1]/div/div[5]/div[3]/div[2]/form/' +
            'div[8]/div[2]/div/ul/li[1]/div/table/tbody/tr[2]/td[3]/button')).click();
        browser.element(by.model('ta.destinationto')).sendKeys('Anchorage');
        browser.element(by.xpath('/html/body/div[1]/div/div[5]/div[3]/div[2]/form/div[8]/div[3]/div/span/button')).click();
        browser.element(by.xpath('/html/body/div[1]/div/div[5]/div[3]/div[2]/form/' +
            'div[8]/div[3]/div/ul/li[1]/div/table/tbody/tr[3]/td[7]/button')).click();
        browser.element(by.model('ta.purpose')).sendKeys('Test purpose from protractor.');
        browser.element(by.model('ta.travpref')).sendKeys('Test flight preferences with protractor.');
        browser.element(by.id('save-ta')).click();

        expect(element(by.class('alert-success')).getText()).toEqual('Your TA has been saved, but not sent to the travel planners.');

    });
   */

});
