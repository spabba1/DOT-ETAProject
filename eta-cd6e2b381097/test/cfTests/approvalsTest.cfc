component extends="testbox.system.BaseSpec" {

    public void function setUp() {
        approvals = new model.services.approval();
    }

	public void function getWorkflowDataTest() {

		request.thisWorkflowName = "eta_test_workflow";

		var authdata = 'anBodXN0bWFuOkZyZWlkbjByLjEwMTAx';
		var data = approvals.getWorkflowData(authdata);
		debug(data);

	}

	public void function rejectTest () {
		var taid = 222;


		var reject = approvals.reject();

		debug(reject);

	}
}
