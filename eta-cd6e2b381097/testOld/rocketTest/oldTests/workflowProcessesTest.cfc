component extends="testbox.system.BaseSpec" {

    function setUp() {
        myObj = createObject('component', 'eta.model.services.workflow_processes');
    }

    function validateProcessNames() test {

        var result = myObj.getNameFromId(1);
        debug(result);

        $assert.isEqual('Start TA',result,'Should be "Start TA" but is #result#.');
        
        var result = myObj.getNameFromId(2);
        debug(result);

        $assert.isEqual('Sent to Travel Planner',result,'Should be "Sent to Travel Planner" but is #result#.');

        var result = myObj.getNameFromId(3);
        debug(result);

        $assert.isEqual('E-Travel Itinerary Research',result,'Should be "E-Travel Itinerary Research" but is #result#.');

        var result = myObj.getNameFromId(4);
        debug(result);

        $assert.isEqual('Waiting for Div Approval',result,'Should be "Waiting for Div Approval" but is #result#.');

        var result = myObj.getNameFromId(5);
        debug(result);

        $assert.isEqual('Waiting for Dept Approval',result,'Should be "Waiting for Dept Approval" but is #result#.');

        var result = myObj.getNameFromId(6);
        debug(result);

        $assert.isEqual('Travel Envelope Preparation',result,'Should be "Travel Envelope Preparation" but is #result#.');

        var result = myObj.getNameFromId(7);
        debug(result);

        $assert.isEqual('Finalize TA',result,'Should be "Finalize TA" but is #result#.');

        var result = myObj.getNameFromId(8);
        debug(result);

        $assert.isEqual('TA Submission',result,'Should be "TA Submission" but is #result#.');

        var result = myObj.getNameFromId(9);
        debug(result);

        $assert.isEqual('Reconciliation',result,'Should be "Reconciliation" but is #result#.');

        var result = myObj.getNameFromId(10);
        debug(result);

        $assert.isEqual('Submit for Certification',result,'Should be "Submit for Certification" but is #result#.');
    }

}
