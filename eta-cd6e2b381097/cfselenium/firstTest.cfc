component extends="cfselenium.CFSeleniumTestCase" {
	public void function beforeTests() {
		browerUrl = "http://github.com/";
		super.beforeTests();
	}

	function testLoginPage() {
		selenium.open("/teamcfadvance/CFSelenium");
		assertTrue(selenium.getTitle() contains "teamcfadvance/cfselenium");
	}
}
