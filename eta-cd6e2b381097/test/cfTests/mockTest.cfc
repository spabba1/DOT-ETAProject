/**
 * public any createMock([string CLASSNAME], [any OBJECT], [boolean CLEARMETHODS='false'], [boolean CALLLOGGING='true'])
 * public any createEmptyMock(string CLASSNAME, [any OBJECT], [boolean CALLLOGGING='true'])
 * public any prepareMock([any OBJECT], [boolean CALLLOGGING='true'])
 */

component extends="testbox.system.BaseSpec" {

	function beforeAll() {
		// Create the User Service to test, do not remove methods, just prepare for mocking.
		userService = createMock('model.services.UserService');

		// Mock the session facade, I am using the coldbox one, it can be any facade though
		mockSession = createStub(className='coldbox.system.plugins.SessionStorage');

		// Mock Transfer
		mockTransfer = createStub(className='transfer.com.Transfer');

		// Mock DAO
		mockDAO = createStub(className='model.services.UserDAO');

		// Init the User Service with mock dependencies
		userService.init(mockTransfer, mockSession, mockDAO);
	}

	function mockTest() {
		var mockQuery = querySim('id, name
				1|Luis Majano
				2|Alexia Majano');

		// mock the DAO call with this mocked query as its return
		mockDAO.$("getData", mockQuery);

		var data = userService.getData();
		$assert.isEqual(data, mockQuery);
	}
}
