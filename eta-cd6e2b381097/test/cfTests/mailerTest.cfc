component extends="testbox.system.BaseSpec" {

	function setUp() {
		staff = new model.services.staff();
		mailer = new model.services.mailer();
	}

	function getMailingListTest() {

		var staffList = staff.getMailingList();
		debug(staffList);

		debug(arrayToList(staffList));

		var string = "#CGI.HTTP_REFERER#";
		debug("string: " & #string#);
		var arr = listToArray(#CGI.HTTP_REFERER#, "?","false");
		debug("val: " & arr[1] );

	}

	function rejectedTest() {
		var taid = 344;
		var travelerid = 321333;
		var preparerid = 321333;
		var rejectReason = "This is just a test.  If you see this,
				model.services.mailer is working!";
		var sendEmail = mailer.rejected(
				taid,
				travelerid,
				preparerid,
				rejectReason);
		debug(sendEmail);
		$assert.isEqual(sendEmail, true, 'Something went wrong.');


	}


}
