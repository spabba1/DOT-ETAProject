component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		taService = new model.services.ta();
	}

	public void function beforeTests() {

	}

	public void function getNgTaReviewListTest() {

		var doit = taService.getNgTaReviewList();
		debug(doit);

	}

	public void function getIdFromEdocsIdTest() {
		var realId = 368;
		var dID = 84001;
		var result = taService.getIdFromEdocsId(dID);
		debug(result);

		$assert.isEqual(result,realId,'Should be #realId#, but was #result#');
	}

	public void function getRejectReasonTest() {
		var taid = 374;
		var result = taService.getRejectReason(taid);
		debug(result);

	}
}

