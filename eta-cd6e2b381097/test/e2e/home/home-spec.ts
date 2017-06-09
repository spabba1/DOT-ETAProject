/// <reference path="./../../../app/js/types.ts" />
describe('Test to see if we are on the Home Page', function () {
  it('Should be at the login screen', function () {
    browser.get('http://eta.local');
  });
});



  /*
    var loginUrl,
        username = element(by.name("username")),
        password = element(by.name("password")),
        loginButton = element(by.id("sign-in")),
        logoutButton = element(by.id("logout")),
        error = element(by.model('login'));

    var fail = function() { expect(true).toBe(false); };

    it("should start at the login page", function() {
        browser.driver.get("http://eta.local/app/");
        loginUrl = browser.getCurrentUrl();
        browser.get("http://eta.local/app/#/login");
        expect(browser.getCurrentUrl()).toEqual(loginUrl);
    });
    */


    /*it("should warn on missing/malformed credentials", function() {
      username.clear();
      password.clear();
      username.sendKeys("test");
      loginButton.click();
      expect(error.getText()).toMatch("Password is required");

      username.clear();
      password.sendKeys("test");
      loginButton.click();
      expect(error.getText()).toMatch("Username is required");

    });*/

    /*it("should accept username and password", function() {
      username.clear();
      password.clear();
      username.sendKeys("issdtest1");
      password.sendKeys("Summer2015!");
      loginButton.click();
      expect(browser.getCurrentUrl()).not.toEqual(loginUrl);
    });*/

    /*it("should redirect to login page after logout", function() {
        logoutButton.click();
        expect(browser.getCurrentUrl()).toEqual(loginURL);
    });*/

    //browser.driver.findElement(by.id("username")).sendKeys("issdtest1");
    //browser.driver.findElement(by.id("password")).sendKeys("Summer2015!");
    //browser.driver.findElement(by.id("sign-in")).click;

    //// We know we are logged in when we hit the home page.
    //return browser.driver.wait(function() {
    //return browser.driver.getTitle().then(function(url) {
    //return /"ETA Home |  Employee Intranet || Alaska DOT&amp;PF"/.test(url);
    //});
    //}, 10000);

