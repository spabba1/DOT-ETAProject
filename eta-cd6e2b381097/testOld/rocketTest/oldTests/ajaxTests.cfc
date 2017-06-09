component extends="testbox.system.BaseSpec" {

	function beforeAll() {
		ajaxService = new eta.model.services.ajax();
	}
	function afterAll() {
		/*var ajaxService = new eta.model.services.ajax();*/
	}

	function run() {

		/**
		* describe() starts a suite group of spec tests.
		* Arguments:
		* @title The title of the suite, Usually how you want to name the desired behavior
		* @body A closure that will resemble the tests to execute.
		* @labels The list or array of labels this suite group belongs to
		* @asyncAll If you want to parallelize the execution of the defined specs in this suite group.
		* @skip A flag that tells TestBox to skip this suite group from testing if true
		*/
		describe("Get user by EIN", function() {

			/**
			* it() describes a spec to test. Usually the title is prefixed with
			* the suite name to create an expression.
			* Arguments:
			* @title The title of the spec
			* @spec A closure that represents the test to execute
			* @labels The list or array of labels this spec belongs to
			* @skip A flag that tells TestBox to skip this spec from testing if true
			*/
			it("Returns a known user query from LDAP", function() {
				var result = ajaxService.getUserByEin(321333);
				expect(result).toBe('{"COLUMNS":["HOMESTATE","WORKDAYS","DOB","OU2","L","EMPLOYEENUMBER","OU","MAIL","WORKTIME","FULLNAME","GENDER","BARGAININGUNIT","HOMEZIP","HOMECITY","CN","TELEPHONENUMBER","TITLE","HOMEADDRESS"],"DATA":[["","","","DAS-STWD ADMIN INFO SYSTEMS","Juneau","321333","Transportation & Public Facilities","jeremey.hustman@alaska.gov","","","","GP","","","Jeremey P Hustman","(907)465-2908","Analyst/Programmer III",""]]}');
			});
		});
	};




		describe("Get LDAP User", function() {

			it("Does something", function() {
				var result = ajaxService.getLdapUser(321333);

				writedump(result);
	/*
				$assert.isEqual('#result[1].ein#', '321333', 'result should be 321333 but was #result[1].ein#');
				$assert.isEqual('#result[1].email#', 'jeremey.hustman@alaska.gov', 'result should be 321333 but was #result[1].email#');
				$assert.isEqual('#result[1].firstName#', 'Jeremey', 'result should be 321333 but was #result[1].firstName#');
				$assert.isEqual('#result[1].id#', 'jphustman', 'result should be 321333 but was #result[1].id#');
				$assert.isEqual('#result[1].label#','Jeremey P Hustman','result should be 321333 but was #result[1].label#');
				$assert.isEqual('#result[1].lastName#','Hustman','result should be 321333 but was #result[1].lastName#');*/

			});
		});

}
    /*function testCheckUserExists() {

        var result = ajaxService.checkUserExists(321333);

        debug(result);

        $assert.isEqual('#result#',true,'result should be true but was #result#');

        var result = ajaxService.checkUserExists(999999);

        debug(result);

        $assert.isEqual('#result#',false,'result should be false but was #result#');
    }*/

