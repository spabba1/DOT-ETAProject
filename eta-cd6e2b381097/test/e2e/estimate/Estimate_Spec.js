/*global describe, it, browser, expect, by */
'use strict';
describe('estimate page', function () {
    it('should fill out and save the estimate page', function () {
        // Load the Estimate page
        browser.get('http://eta.local/app/#/estimate/96');
        expect(by.model('ta.tanumber')).toBe('25-2016-00001');
        element(by.name('fincode')).sendKeys("123456");
    });
    /*
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/textarea')).sendKeys("depart JNU 8:00am flt 72 BLD
    arrive MOB 9:35 flt 2973");
        element(by.xpath('//*[@id="expenses"]/div/input[6]')).sendKeys("51");
    
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
    
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
    
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
    
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
        element(by.xpath('//*[@id="expenses"]/div/input[1]')).sendKeys("5/18/2013");
    */
});
//# sourceMappingURL=Estimate_Spec.js.map