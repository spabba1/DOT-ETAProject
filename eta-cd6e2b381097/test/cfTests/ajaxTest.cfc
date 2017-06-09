component extends="mxunit.framework.TestCase" {

	public void function setUp() {
		ajaxService = new model.services.ajax();
	}

	public void function get_user_by_ein() {
		var result = ajaxService.getUserByEin(321333);

		assertEquals('{"COLUMNS":["HOMESTATE","WORKDAYS","DOB","OU2","L","EMPLOYEENUMBER","OU","MAIL","WORKTIME","FULLNAME","GENDER","BARGAININGUNIT","HOMEZIP","HOMECITY","CN","TELEPHONENUMBER","TITLE","HOMEADDRESS"],"DATA":[["","","","DAS-STWD ADMIN INFO SYSTEMS","Juneau","321333","Transportation & Public Facilities","jeremey.hustman@alaska.gov","","","","GP","","","Jeremey P Hustman","(907)465-2908","Analyst/Programmer III",""]]}', result);

	};

	public void function get_ldap_user() {

		var result = ajaxService.getLdapUser(321333);

		debug(result);
		/*
		   $assert.isEqual('#result[1].ein#', '321333', 'result should be 321333 but was #result[1].ein#');
		   $assert.isEqual('#result[1].email#', 'jeremey.hustman@alaska.gov', 'result should be 321333 but was #result[1].email#');
		   $assert.isEqual('#result[1].firstName#', 'Jeremey', 'result should be 321333 but was #result[1].firstName#');
		   $assert.isEqual('#result[1].id#', 'jphustman', 'result should be 321333 but was #result[1].id#');
		   $assert.isEqual('#result[1].label#','Jeremey P Hustman','result should be 321333 but was #result[1].label#');
		   $assert.isEqual('#result[1].lastName#','Hustman','result should be 321333 but was #result[1].lastName#');*/

	};

}
    /*function testCheckUserExists() {

        var result = ajaxService.checkUserExists(321333);

        debug(result);

        $assert.isEqual('#result#',true,'result should be true but was #result#');

        var result = ajaxService.checkUserExists(999999);

        debug(result);

        $assert.isEqual('#result#',false,'result should be false but was #result#');
    }*/

