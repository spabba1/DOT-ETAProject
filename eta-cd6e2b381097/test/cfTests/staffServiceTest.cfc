component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		staff = new model.services.staff();
	}

	public void function getMailingListTest() {
		var mailingList = staff.getMailingList();
		debug(mailingList);
	}

	public void function isAdminTest() {
		var ein = 325417;

		debug(staff.isAdmin(325417));
	}


}
