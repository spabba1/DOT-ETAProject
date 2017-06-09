component extends='testbox.system.BaseSpec' {

    function setUp() {
        usefulFunctions = new "eta.model.services.UsefulFunctions()";
    }

    function expenseShouldBeEmpty() test {
        var sampleExpenseStruct = {
            expensedate = "",
            explanation = "",
            facility = "",
            isnew = 1,
            lodging = "",
            meals = "",
            mie = "",
            miles = "",
            other = "",
            othertrans = "",
            surfmileage = ""
        };

        var result = usefulFunctions.checkEmptyBean(sampleExpenseStruct);
        debug(result);
        $assert.isTrue(result);

    }

    function expenseNotNewShouldBeEmpty() test {
        var sampleExpenseStruct = {
            expensedate = "",
            explanation = "",
            facility = "",
            isnew = 0,
            lodging = "",
            meals = "",
            mie = "",
            miles = "",
            other = "",
            othertrans = "",
            surfmileage = ""
        };

        var result = usefulFunctions.checkEmptyBean(sampleExpenseStruct);
        debug(result);
        $assert.isTrue(result);

    }

    function expenseShouldNotBeEmpty() test {
        var sampleExpenseStruct = {
            expensedate = "12/24/2014",
            explanation = "This is just an explanation.",
            facility = "state",
            isnew = 0,
            lodging = 200.00,
            meals = "d",
            mie = 60.00,
            miles = 15,
            other = 5.00,
            othertrans = 12.00,
            surfmileage = 8.40
        };

        var result = usefulFunctions.checkEmptyBean(sampleExpenseStruct);
        debug(result);
        $assert.isFalse(result);

    }

    function onecardShouldBeEmpty() test {
        var sampleOnecardStruct = {
            aksasacct = "",
            aksasbatchnum = "",
            aksasrefid = "",
            amount = "",
            datepaid = "",
            isnew = 1,
            refinvnumber = "",
            type = "",
            vendorpvndesc = ""
        };

        var result = usefulFunctions.checkEmptyBean(sampleOnecardStruct);
        debug(result);
        $assert.isTrue(result);

    }

    function onecardNotNewShouldBeEmpty() test {
        var sampleOnecardStruct = {
            aksasacct = "",
            aksasbatchnum = "",
            aksasrefid = "",
            amount = "",
            datepaid = "",
            isnew = 0,
            refinvnumber = "",
            type = "",
            vendorpvndesc = ""
        };

        var result = usefulFunctions.checkEmptyBean(sampleOnecardStruct);
        debug(result);
        $assert.isTrue(result);

    }


    function onecardShouldNotBeEmpty() test {
        var sampleOnecardStruct = {
            aksasacct = 73819,
            aksasbatchnum = "",
            aksasrefid = "tkt",
            amount = 9.12,
            datepaid = "",
            isnew = 0,
            refinvnumber = 8900588952138,
            type = "air",
            vendorpvndesc = "US Travel Fee"
        };

        var result = usefulFunctions.checkEmptyBean(sampleOnecardStruct);
        debug(result);
        $assert.isFalse(result);

    }

}
