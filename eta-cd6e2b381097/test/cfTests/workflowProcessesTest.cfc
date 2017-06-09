component extends="testbox.system.BaseSpec" {

    public void function setUp() {
        workflow = new model.services.workflow_processes();
    }

    public void function getNameFromIdTest() {

        var result = workflow.getNameFromId(1);
        $assert.isEqual('Start TA',result,'Should be "Start TA" but is #result#.');

        var result = workflow.getNameFromId(2);
        $assert.isEqual('Sent to Travel Planner',result,'Should be "Sent to Travel Planner" but is #result#.');

        var result = workflow.getNameFromId(3);
        $assert.isEqual('E-Travel Itinerary Research',result,'Should be "E-Travel Itinerary Research" but is #result#.');

        var result = workflow.getNameFromId(4);
        $assert.isEqual('Rejected',result,'Should be "Rejected" but is #result#.');

        var result = workflow.getNameFromId(5);
        $assert.isEqual('Waiting for Div Approval',result,'Should be "Waiting for Div Approval" but is #result#.');

        var result = workflow.getNameFromId(6);
        $assert.isEqual('Waiting for Dept Approval',result,'Should be "Waiting for Dept Approval" but is #result#.');

        var result = workflow.getNameFromId(7);
        $assert.isEqual('Travel Envelope Preparation',result,'Should be "Travel Envelope Preparation" but is #result#.');

        var result = workflow.getNameFromId(8);
        $assert.isEqual('Finalize TA',result,'Should be "Finalize TA" but is #result#.');

        var result = workflow.getNameFromId(9);
        $assert.isEqual('TA Submission',result,'Should be "TA Submission" but is #result#.');

        var result = workflow.getNameFromId(10);
        $assert.isEqual('Reconciliation',result,'Should be "Reconciliation" but is #result#.');

        var result = workflow.getNameFromId(11);
        $assert.isEqual('Submit for Certification',result,'Should be "Submit for Certification" but is #result#.');
    }

    public void function isRejectedTrueTest() {
    	var taid1 = 374;
    	var result = workflow.isRejected(taid1);
    	debug(result);
    	$assert.isTrue(result);

    }

}
