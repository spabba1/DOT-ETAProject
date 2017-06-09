component extends="testbox.system.BaseSpec" {

	function setUp() {
		service = new model.services.financialcode();
		dao = new model.dao.financialcode();
	}

	function CreateFinancialCodeTest() {
		var result = service.create(100,123456789);
		debug(result);
	}

}
