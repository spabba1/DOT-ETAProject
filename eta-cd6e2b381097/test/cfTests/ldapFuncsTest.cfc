component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		ldapService = new model.services.ldap();
	}

	public void function getUserByUsernameTest() {
		var username = 'jphustman';
		var result = ldapService.getUserByUsername(username);
		$assert.isEqual(result.getBu(), 'GP');
		$assert.isEqual(result.getUsername(), 'jphustman');
		$assert.isEqual(result.getDeptnum(), '25060910');
		$assert.isEqual(result.getTravelerID(), '321333');
		$assert.isEqual(result.getDutystation(), 'Juneau');
		$assert.isEqual(result.getDept(), 'Transportation & Public Facilities');
		$assert.isEqual(result.getDiv(), 'ISD-INFO SYS SVCS');
		$assert.isEqual(result.getPhone(), '(907)465-2908');
		$assert.isEqual(result.getTitle(), 'Analyst/Programmer IV');
		$assert.isEqual(result.getFullname(), 'Jeremey P Hustman');
		debug(result);
	};

	public void function getUserByEinForTaTest() {
		var employeeNumber = 321333;
		var result = ldapService.getUserByEinForTa(employeeNumber);
		$assert.isEqual(result, '[{"UID":"jphustman","OU2":"ISD-INFO SYS SVCS","L":"Juneau","EMPLOYEENUMBER":321333,"BARGAININGUNIT":"GP","OU":"Transportation & Public Facilities","MAIL":"jeremey.hustman@alaska.gov","CN":"Jeremey P Hustman","TELEPHONENUMBER":"(907)465-2908","TITLE":"Analyst\/Programmer IV"}]');
		debug(result);
	}

	public void function find_ldap_user_test() {
		var result = ldapService.findLdapUser(term: "cognos", returnFormat: "json");

		debug(result);

		   $assert.isEqual('#result#', '[{"UID":"dotcognos","GIVENNAME":"DOT\/PF","EMPLOYEENUMBER":"","SN":"Cognos","OU":"Transportation & Public Facilities","MAIL":"no email","CN":"DOT\/PF Cognos"},{"UID":"cognos_test","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test","OU":"Transportation & Public Facilities","MAIL":"cognos.test@alaska.gov","CN":"Cognos Test"},{"UID":"Cognos_test2","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test2","OU":"Transportation & Public Facilities","MAIL":"cognos.test2@alaska.gov","CN":"Cognos Test 2"},{"UID":"Cognos_test3","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test 3","OU":"Transportation & Public Facilities","MAIL":"cognos.test3@alaska.gov","CN":"Cognos Test 3"}]', 'result should be [{"UID":"dotcognos","GIVENNAME":"DOT\/PF","EMPLOYEENUMBER":"","SN":"Cognos","OU":"Transportation & Public Facilities","MAIL":"no email","CN":"DOT\/PF Cognos"},{"UID":"cognos_test","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test","OU":"Transportation & Public Facilities","MAIL":"cognos.test@alaska.gov","CN":"Cognos Test"},{"UID":"Cognos_test2","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test2","OU":"Transportation & Public Facilities","MAIL":"cognos.test2@alaska.gov","CN":"Cognos Test 2"},{"UID":"Cognos_test3","GIVENNAME":"Cognos","EMPLOYEENUMBER":"","SN":"Test 3","OU":"Transportation & Public Facilities","MAIL":"cognos.test3@alaska.gov","CN":"Cognos Test 3"}] but was #result#');
	};

	public void function get_user_by_ein_test() {
		var result = ldapService.getUserByEin(321333);

		$assert.isEqual('{"COLUMNS":["HOMESTATE","WORKDAYS","DOB","OU2","L","EMPLOYEENUMBER","OU","MAIL","WORKTIME","FULLNAME","GENDER","BARGAININGUNIT","HOMEZIP","HOMECITY","CN","TELEPHONENUMBER","TITLE","HOMEADDRESS"],"DATA":[["","","","ISD-INFO SYS SVCS","Juneau","321333","Transportation & Public Facilities","jeremey.hustman@alaska.gov","8-4","","","GP","","","Jeremey P Hustman","(907)465-2908","Analyst/Programmer III",""]]}', result);
	};



    public void function test_check_user_exists() {

        var result = ldapService.checkUserExists(321333);

        debug(result);

        $assert.isEqual('#result#',true,'result should be true but was #result#');

        var result = ldapService.checkUserExists(999999);

        debug(result);

        $assert.isEqual('#result#',false,'result should be false but was #result#');
    }


	public void function getEmailById_test() {
		var result = ldapService.getEmailById(321333);
		debug(result);
		$assert.isEqual('#result#','jeremey.hustman@alaska.gov','result should be "jeremey.hustman@alaska.gov" but was "#result#"');

	}

}

