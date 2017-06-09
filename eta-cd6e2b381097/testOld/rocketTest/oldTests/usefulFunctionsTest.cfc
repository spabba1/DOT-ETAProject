component extends="testbox.system.BaseSpec" {

    function setUp() {
        usefulFunctions = createObject('component', 'eta.model.services.UsefulFunctions');
    }

    function queryToArrayTest() {

        // Create query
        var qTest = queryNew("id,name");
        queryAddRow(qTest, 4);

        querySetCell(qTest, "id", "1", 1);
        querySetCell(qTest, "name", "Jeremey", 1);

        querySetCell(qTest, "id", "2", 2);
        querySetCell(qTest, "name", "Rachel", 2);

        querySetCell(qTest, "id", "3", 3);
        querySetCell(qTest, "name", "Andrew", 3);

        querySetCell(qTest, "id", "4", 4);
        querySetCell(qTest, "name", "King", 4);

        // Test the function
        var result = usefulFunctions.queryToArray(qTest);
        debug(result);

        $assert.isEqual(
            [
                {id="1", name="Jeremey"},
                {id="2", name="Rachel"},
                {id="3", name="Andrew"},
                {id="4", name="King"}
            ],
            result
        );

    }





}
