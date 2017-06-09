component extends="testbox.system.BaseSpec" {

	/**
	 * SendService paramaters
	 * param taid		The ID of the TA.
	 * param approver	The EIN of the approver.
	 * param authdata	The current user's Base64 credentials.
	 * param pdfUrl		The pdf object URL
	 */
	/*mockBox = new testbox.system.MockBox();*/

	public void function beforeAll() {
		this.request.environment = "dev";
		this.taid = 669;
		this.approver = 321333;
		this.authdata = 'anBodXN0bWFuOkZyZWlkbjByLjEwMTAw';


		/*sendMock = createMock("model.services.send");*/
		var sendService = new model.services.send();
		var sendServiceMock = getMockBox().prepareMock(sendService);

		var edocsService = new model.services.edocs();
		var edocsServiceMock = getMockBox().prepareMock(edocsService);
		/*edocsMock.$('upload', true);*/

		var usefulFunctionsService = new model.services.usefulfunctions();
		var usefulFunctionsServiceMock = getMockBox().prepareMock(usefulFunctionsService);

		// Create the Send Service to test, do not remove methods, just prepare for mocking.

		// Mock the session facade, I am using the coldbox one, it can be any facade though
		/*mockSession = createEmptyMock(className='coldbox.system.plugins.SessionStorage');*/

		// Mock Transfer
		/*mockTransfer = createEmptyMock(className='transfer.com.Transfer');*/

		// Mock DAO
		/*mockDAO = createEmptyMock(className='model.UserDAO');*/

		// Init the User Service with mock dependencies
		/*sendService.init(mockTransfer, mockSession, mockDAO);*/
		sendServiceMock.init();
	}

	public void function afterAll() {
	}

	public void function sendToEdocsTest() {
		var uploadResult = {};
		var mockAuthData = [];
		uploadResult.status = "success";
		uploadResult.message = "This is a mocked message.";

		var mockAuthData[1] = 'testuser';
		var mockAuthData[2] = 'testpass';
		sendServiceMock.$("authDataDecoded", mockAuthData);



		/*var success = this.edocsServiceMock.$('upload').$results(uploadResult);*/

		debug(success);


	}

}
