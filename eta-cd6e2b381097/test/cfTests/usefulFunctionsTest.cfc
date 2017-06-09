component extends="testbox.system.BaseSpec" {

    public void function setUp() {
		this.usefulFunctions = new model.services.usefulfunctions();
    }

    public void function queryToArrayTest() {

        // Create query
        var qTest = queryNew("id,name", "integer,varchar");
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
        var result = this.usefulFunctions.queryToArray(qTest);
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

	public void function fromDatepickerConvertTest() {
		var ngDate = "2016-02-02T00:00:00.000Z";
		var oraDate = "February, 02 2016 00:00:00";
		var result = this.usefulFunctions.fromDatepickerConvert(ngDate);
		debug(result);
		$assert.isEqual(oraDate, result);
	}

	public void function toDatepickerConvertTest() {
		var ngDate = "2016-02-02T00:00:00.000Z";
		var oraDate = "February, 02 2016 00:00:00";
		var result = this.usefulFunctions.toDatepickerConvert(oraDate);
		debug(result);
		$assert.isEqual(ngDate, result);
	}

	public void function decodeAuthDataTest() {
		var authData = 'dGVzdHVzZXI6dGVzdHBhc3N3b3Jk';
		var result = this.usefulFunctions.decodeAuthData(authData);
		debug(result);
		$assert.isEqual(['testUser','testPassword'],
				result
				);
	}

}
