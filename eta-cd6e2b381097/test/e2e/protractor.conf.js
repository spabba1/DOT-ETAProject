/// <reference path="./../../app/js/types.ts" />
var env = require('./environment.js');
var secret = require('./loginconfig.js').credentials;
exports.config = {
    allScriptsTimeout: 11000,
    baseUrl: env.baseUrl,
    capabilities: env.capabilities,
    getPageTimeout: 10000,
    jasmineNodeOpts: {
        defaultTimeoutInterval: 30000,
        includeStackTrace: false,
        isVerbose: true,
        showColors: true
    },
    // multiCapabilities: [
    // {
    // 'browserName': 'chrome',
    // 'chromeOptions' : {
    // args: ['--window-size=1024,768']
    // }
    // }
    // {
    // 'browserName': 'firefox'
    // },
    // {
    // 'browserName': 'ie'
    // }
    // ],
    onPrepare: function () {
        browser.get(env.baseUrl);
        element(by.name('username')).sendKeys(secret.username);
        element(by.name('password')).sendKeys(secret.password);
        element(by.id('sign-in')).click();
        // Login might take a few seconds so set a timeout until 'Home.'
        return browser.wait(function () {
            return browser.driver.getCurrentUrl().then(function (url) {
                return url;
            });
        }, 10000);
    },
    seleniumAddress: env.seleniumAddress,
    // seleniumAddress: 'http://192.168.142.101:4444/wd/hub',
    // run suite by 'protractor protractor.conf.js --suite create
    suites: {
        create: 'create/*.js',
        estimate: 'estimate/*.js',
        home: 'home/*.js',
        login: 'login/*.js',
        scenario: './scenario/instatehotelcar-planner-spec.js'
    },
};
//# sourceMappingURL=protractor.conf.js.map