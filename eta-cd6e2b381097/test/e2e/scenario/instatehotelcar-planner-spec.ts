/*global describe, it, until, browser, driver, by, expect, element, protractor*/
describe('In state with hotel and car', function () {
    it ('should estimate TA', function () {
        browser.get('http://eta.local:3000/#/login');

        browser.wait(function () {
            return browser.getTitle().then(function (title) {
               return title === 'ETA | Estimate TA | Employee Intranet || Alaska DOT&PF';
            });
        }, 120000);

        expect(browser.getTitle()).toEqual('ETA | Estimate TA | Employee Intranet || Alaska DOT&PF');

        browser.driver.findElement(by.xpath('/html/body/div[1]/div/div[4]/div[5]/div/form/div[12]/div[1]/div[2]/div[2]/input[2]')).sendKeys('25060210');
        browser.driver.findElement(by.name('actualsreq')).click();

        // Expenses
        browser.driver.findElement(by.xpath('(//input[@name="expensedate"])')).sendKeys('11/02/2014');
        browser.driver.findElement(by.xpath('(//textarea[@name="expenseexplanation"])')).sendKeys('Depart JNU 1:32pm flight 65', protractor.Key.ENTER, 'Arrive ANC 3:26pm L/D');
        browser.driver.findElement(by.xpath('(//input[@name="mie"])')).sendKeys('48');

        browser.driver.findElement(by.xpath('//button[@id="add-expense"]')).click();

        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('(//input[@name="expensedate"])[2]'));
        }, 120000);

        browser.driver.findElement(by.xpath('(//input[@name="expensedate"])[2]')).sendKeys('11/3-11/6/14');
        browser.driver.findElement(by.xpath('(//textarea[@name="expenseexplanation"])[2]')).sendKeys('B/L/D');
        browser.driver.findElement(by.xpath('(//input[@name="mie"])[2]')).sendKeys('240');

        browser.driver.findElement(by.xpath('//button[@id="add-expense"]')).click();

        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('(//input[@name="expensedate"])[3]'));
        }, 120000);

        browser.driver.findElement(by.xpath('/html/body/div[1]/div/div[4]/div[5]/div/form/div[17]/div/input[1]')).sendKeys('11/07/2014');
        browser.driver.findElement(by.xpath('/html/body/div[1]/div/div[4]/div[5]/div/form/div[17]/div/textarea')).sendKeys('Depart ANC 7:55pm flight 70', protractor.Key.ENTER, 'Arrive JNU 9:32pm B/L/D');
        browser.driver.findElement(by.xpath('/html/body/div[1]/div/div[4]/div[5]/div/form/div[17]/div/input[6]')).sendKeys('60');

        // TRW
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[2]/select')).click();
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[2]/select/option[4]')).click();
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[2]/input[2]')).sendKeys('348');
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[2]/input[3]')).sendKeys('72114');

        element(by.buttonText("Add Reimbursement Warrant")).click();
        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('//*[@id="trw-table"]/div[3]/select'));
        }, 120000);

        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[3]/select')).click();
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[3]/select/option[4]')).click();
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[3]/input[2]')).sendKeys('-36');
        browser.driver.findElement(by.xpath('//*[@id="trw-table"]/div[3]/input[3]')).sendKeys('72114');

        // Onecard
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/select')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/select/option[2]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/select[2]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/select[2]/option[10]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input')).sendKeys('0277496832176');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input[2]')).sendKeys('Alaska Air');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input[3]')).sendKeys('326.90');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input[4]')).sendKeys('09/29/2014');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input[5]')).sendKeys('72111');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div/input[6]')).sendKeys('B159078-6');

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/button')).click();

        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('//div[@id="state-expenses"]/div[2]/select/option[4]'));
        }, 120000);

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/select')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/select/option[4]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/select[2]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/select[2]/option[4]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[1]')).sendKeys('8900625995828');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[2]')).sendKeys('US Travel');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[3]')).sendKeys('9.04');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[4]')).sendKeys('09/29/2014');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[5]')).sendKeys('73819');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[2]/input[6]')).sendKeys('B159078-7');

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/button')).click();

        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('//div[@id="state-expenses"]/div[3]/select[1]/option[5]'));
        }, 120000);

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/select[1]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/select[1]/option[5]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/select[2]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/select[2]/option[8]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/input[2]')).sendKeys('Residence Inn Marriott');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/input[3]')).sendKeys('495');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/input[4]')).sendKeys('11/07/2014');
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[3]/input[5]')).sendKeys('72113');

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/button')).click();

        browser.wait(function () {
            return browser.driver.isElementPresent(by.xpath('//div[@id="state-expenses"]/div[4]/select[1]/option[7]'));
        }, 120000);

        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[1]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[1]/option[7]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[2]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[2]/option[3]')).click();
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[1]/option[text()="SURF"]'));
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/select[2]/option[text()="CAR"]'));
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/input[2]')).sendKeys("Budget-Paid w/Rachel's One card");
        browser.driver.findElement(by.xpath('//div[@id="state-expenses"]/div[4]/input[5]')).sendKeys('72112');

        browser.driver.findElement(by.xpath('//*[@id="submit-estimate"]')).click();

        browser.pause();

/*
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

*/
    });

});
