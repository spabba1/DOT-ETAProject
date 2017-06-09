component accessors="true" output="false" {

	property name="beanFactory";
	property name="ldapfuncsService";
	property name="loginService";
	property name="personService";

	function init(required struct fw) output="false" {
		variables.fw = fw;
		return this;
	}

	/**
	 * Check if the user is logged in and send them to the main screen of the
	 * application.
	 */
	function before(required struct rc) output="false" {
		if (structKeyExists(session, "auth") && session.auth.isLoggedIn &&
				variables.fw.getItem() != "logout") {
			variables.fw.redirect('main');
		}
	}

	/**
	 * Log the user into the system by setting a session variable.
	 */
	function login(required struct rc) {
		var userValid = 0;
		var authorized = '';

		if (len(trim(rc.username)) AND len(trim(rc.password))) {
			var authorized = variables.loginService.cfauthUser(rc.username, rc.password);
			/*var authorized = variables.loginService.authUser(rc.username, rc.password);*/

			if (structKeyExists(authorized, "errorMsg")) {
				rc.actualError = authorized.errorMsg;
				rc.message = ['The username or password you entered is incorrect!'];
				rc.type = ['danger'];
				variables.fw.redirect( action = 'login', preserve='message,type');
			}

			var checkInSystem = variables.personService.checkUserExist(authorized.employeeNumber);

			if (!checkInSystem) {
				var test = "test";
				var person = beanFactory.getBean("personBean").init(username=authorized.uid, ein=authorized.employeeNumber, didlogin=1);
				var didInsert = variables.personService.addLoginUser(person);

				if (didInsert) {
					rc.message = ['Welcome to ETA!'];
					rc.type = ['success'];
				} else {
					rc.message = ['Something went wrong, please try to log in again.'];
					rc.type = ['danger'];
				}
			}

			var sessionID = loginservice.genSessionKeys(rc.password);

			session.auth.user = authorized;
			session.auth.isLoggedIn = true;
			session.auth.sessionKey = sessionID.sessionKey;
			session.auth.sessionId = sessionID.sessionID;
			session.auth.role = "";
		}

		variables.fw.redirect(action='main', preserve="message,type");
	}

	/**
	 * I delete the session variable, logging out the user.
	 */
	function logout(required struct rc) {
		session.auth.isLoggedIn = false;
		session.auth.fullname = "Guest";
		structDelete(session.auth, 'user');
		if (isuserloggedin()) {
			loginService.logout();
		};
		rc.message = ['You have safely logged out'];
		rc.type = ['info'];
		variables.fw.redirect(action='login', preserve='message,type');
	}

}
