component displayname="LoginTest" extends="testbox.system.BaseSpec" {

	public void function beforeTests() {
		loginService = new model.services.login();
	}

	public void function setUp() {
		loginService.logout();
		debug(isuserloggedin());
	}

	public function beforeEach() {
	}

	public void function cfauthUserGoodLoginTest() {
		var username = "issdtest1";
		var password = "Summer2015!";
		var authUser = loginService.cfauthUser(username, password);

		$assert.isEqual("issdtest1", authUser.uid);
		$assert.isEqual(999999, authUser.employeeNumber);

	}

	public void function cfauthUserBadLoginTest() {
		var username = "issdtest2";
		var password = "Summer2015!";
		var authUser = loginService.cfauthUser(username, password);

		$assert.isEqual(true, authUser.error, "Should throw an error");

	}

    public void function loginUserTest() {
        var username = "issdtest1";
		var password = "Summer2015!";
		var authUser = loginService.login(username, password);
        debug(authUser);
        $assert.isEqual(true, authuser.success, "Should be 'true'");
        $assert.isEqual(false, authuser.role.isadmin, "Should be 'false'");
        $assert.isEqual('User', authuser.role.staffrole, "Should be 'User'");
    }

}
