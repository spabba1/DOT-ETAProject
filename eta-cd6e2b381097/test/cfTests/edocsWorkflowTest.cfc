component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		edocsService = new model.services.edocs();
		globals = deserializeJson(cookie.globals).currentUser;
	}

	public void function sendToEdocsTest() {
		var taid = 222;
		var approver = 'jphustman';

		var authdata = globals.authdata;
		var stwf = edocsService.startWorkflow(taid, approver, authdata);

		debug(stwf);

	}
}
