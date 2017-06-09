/**
 * I set up the application for logging in the user
 */
component {

    function init(required struct fw) {
		variables.fw = fw;
	}

    function removeSession() { }

    function session(required struct rc) {
    	session.auth = {};
    	session.auth.isLoggedIn = false;
    	session.auth.fullname = "Guest";
    	session.auth.role = "Guest";
    }

    // If the user is not logged in, send them to the login screen.
    function authorize(required struct rc) {
        // check to make sure the user is logged in
        var loggedIn = !isUserLoggedIn();
        var something = !listFindNoCase('login', variables.fw.getSection());
        var somethingElse = !listFindNoCase('main.error', variables.fw.getFullyQualifiedAction());
        var test = "test";
		if (	!isuserloggedin() &&
				!listFindNoCase('login', variables.fw.getSection()) &&
				!listFindNoCase('main.error', variables.fw.getFullyQualifiedAction())
			) {
			variables.fw.redirect('login');
		}
        /*if ( not (structKeyExists(session, "auth") &&*/
				/*session.auth.isLoggedIn) &&*/
				/*!listFindNoCase('login', variables.fw.getSection()) &&*/
				   /*!listFindNoCase('main.error', variables.fw.getFullyQualifiedAction())) {*/
            /*variables.fw.redirect('login');*/
        /*}*/
    }
}
