component extends="testbox.system.BaseSpec" {
	function beforeAll() {
		ajaxService = new eta.model.services.ajax();
	}
	function afterAll(){}
	function run( testResults, testBox) {

		describe("Get user by EIN", function() {
			it("Returns a known user query from LDAP", function() {
				var result = ajaxService.getUserByEin(321333);
				writedump(result);abort;
				expect(result).toBe('{"COLUMNS":["HOMESTATE","WORKDAYS","DOB","OU2","L","EMPLOYEENUMBER","OU","MAIL","WORKTIME","FULLNAME","GENDER","BARGAININGUNIT","HOMEZIP","HOMECITY","CN","TELEPHONENUMBER","TITLE","HOMEADDRESS"],"DATA":[["","","","DAS-STWD ADMIN INFO SYSTEMS","Juneau","321333","Transportation & Public Facilities","jeremey.hustman@alaska.gov","","","","GP","","","Jeremey P Hustman","(907)465-2908","Analyst/Programmer III",""]]} ');
			});
		});

	}
}
