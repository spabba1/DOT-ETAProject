component extends="mxunit.framework.TestCase" {

	public void function setUp() {
		taService = new model.services.ta();
	}

	public void function deleteTaTest() {

		var deleteTa = taService.deleteta(541, 321333);
		debug(deleteTa);

	}

}
