describe("Authentication capabilities", function () {
    var $httpBackend, $rootScope, createController, authRequestHandler;

    // set up the module
    beforeEach(module('eta'));

    beforeEach(inject(function($injector) {
        // Set up the mock http service responses
        $httpBackend = $injector.get('$httpBackend');
        // backend definition common for all tests
        authRequestHandler = $httpBackend.when(
                'GET',
                'model/services/login.cfc'
            )
            .respond({
				userInfo: 'issdtest1',
				getRole: 'User'
				});

        // Get hold of a scope (i.e. the root scope)
        $rootScope = $injector.get('$rootScope');
        // The $controller service is used to create instances of controllers
        var $controller = $injector.get('$controller');

        createController = function () {
            return $controller('LoginController', {'$scope' : $rootScope });
        };
    }));

    afterEach(function () {
        $httpBackend.verifyNoOutstandingException();
        $httpBackend.verifyNoOutstandingRequest();
	});


    it('should authenticate', function () {
		browser.pause();
        $httpBackend.expectGET('/#/login');
        var controller = createController();
        $httpBackend.flush();
    });

    it('should fail authentication', function () {

        // Notice how you can change the response even after it was set
        authRequestHandler.respond(401, '');

        $httpBackend.expectGET('model/services/login.cfc');
        var controller = createController();
        $httpBackend.flush();
        expect($rootScope.status).toBe('Failed...');
    });



    /*it('should send auth header', function () {
        var controller = createController();
        $httpBackend.flush();

        $httpBackend.expectPOST('*/








	//var httpBackendMock = function () {
            //angular.module('httpBackendMock', ['ngMockE2E', 'myApp'])
        //.run(function ($httpBackend) {
            //var authenticated = false;
            //var testAccount = {
                //username: 'testuser',
                //password: 'testpassword'
            //};

		//$httpBackend.whenPOST('model/services/login.cfc')
            //.respond(function (method, url, data, headers) {
                //return authenticated ?
                    //[200, testAccount, {}] :
                    //[401, {}, {}];
		//});


});
