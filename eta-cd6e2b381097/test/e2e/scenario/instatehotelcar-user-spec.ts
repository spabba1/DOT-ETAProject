/*global describe, it, browser, by, expect, element*/
describe('In state with hotel and car', function () {
    it ('should log in as issdtest1', function () {
        browser.get('http://eta.local:3000/#/login');

        expect(browser.getTitle()).toEqual('ETA | Login | Employee Intranet || Alaska DOT&PF');

        browser.driver.findElement(by.id('username')).sendKeys('issdtest1');
        browser.driver.findElement(by.id('password')).sendKeys('Summer2015!');
        browser.driver.findElement(by.id('sign-in')).click();

        expect(browser.getTitle()).toEqual('ETA | Home | Employee Intranet || Alaska DOT&PF');

        browser.driver.findElement(by.id('createTaBtn')).click();

        expect(browser.getTitle()).toEqual('ETA | Create TA | Employee Intranet || Alaska DOT&PF');

        browser.driver.findElement(by.id('autofill')).click();


        browser.driver.findElement(by.id('departurefrom')).sendKeys('Juneau');
        browser.driver.findElement(by.id('destinationto')).sendKeys('Anchorage');
        browser.driver.findElement(by.name('departuredate')).sendKeys('11/02/2014');
        browser.driver.findElement(by.name('returndate')).sendKeys('11/07/2014');

        browser.element(by.name('ta.purpose')).sendKeys("To discuss Security and Workflow issues for IRIS.  A hotel and car will be needed.");
        browser.element(by.name('ta.travpref')).sendKeys("Please sit me in the back near the window.");

        element.all(by.model('ta.hotelinc')).get(1).click();
        element.all(by.model('ta.carinc')).get(1).click();
        browser.driver.findElement(by.id('submit-ta')).click();

        expect(browser.findElement(by.class('alert-success'))).toEqual('Your TA has been saved, but not sent to the travel planners.');


    });

    /*it ('should create a TA', function () {*/



});
