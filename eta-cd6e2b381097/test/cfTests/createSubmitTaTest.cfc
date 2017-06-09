component extends="testbox.system.BaseSpec" {
	/* incomplete */

	public void function setUp() {
		mockBox = getMockBox();
		taService = new model.services.ta();
		edocsService = new model.services.edocs();
		authdata = "anBodXN0bWFuOkZyZWlkbjByLjEwMTAx";
		request.environment = "dev";
		edocsMock = mockBox.prepareMock(edocsService);
		include 'edocsCheckinUniversalResponses.cfm' ;
	}

	public void function getdIDFromNameTest() {

	}

	public void function checkinTest() {
		/*
		<cfargument name="edocs_user" type="string" required="true">
		<cfargument name="edocs_password" type="string" required="true">
		<cfargument name="stellent" type="model.beans.Stellent" required="true">
		<cfargument name="pdfFilename" type="string" required="true">
		<cfargument name="isRejected" type="boolean" required="true">
		<cfargument name="edocsInfo" type="struct" required="true">
		*/
	}

	public void function checkoutTest() {

	}

	public void function uploadTest() {
		/*var taid = 222;
		var approver = 321333;
		var authdata = new model.services.usefulfunctions().decodeAuthData('anBodXN0bWFuOkZyZWlkbjByLjEwMTAw');
		var isRejected = false;

		var checkinStruct = {};
		checkinStruct.type = "success";
		checkinStruct.message = "This is a mocked message.";

		edocsMock.$('checkin', checkinStruct);
		//var checkin = this.edocsMock.$('checkin', checkinStruct);

		var upload = edocsMock.upload(taid,approver,authdata,isRejected);
		//var upload = this.edocsMock.upload(taid,approver,authdata,isRejected);
		debug(upload);*/
	}

	/* Actual Error Messages */

	public void function addWorkflowTest() {
		/*var addWorkflow = edocsService.addWorkflow()*/
	}

}
