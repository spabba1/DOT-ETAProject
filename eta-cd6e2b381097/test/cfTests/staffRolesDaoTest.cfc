component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		staffRoleDao = new model.dao.staffRole();
	}

	public void function getAllStaffRolesTest () {
		/*var expected = [];
		var struct1 = { name: 'Travel Planner', value: 1 }
		var struct2 = { name: 'Divisional Approver', value: 2}
		var struct3 = { name: 'Departmental Approver', value: 3}
		expected[1] = struct1;
		expected[1] += struct2;
		expected[1] += struct3;*/

		/*debug(expected);*/

		/*var result = staffRole.getStaffRoles();*/
		var result = staffRoleDao.getAll();
		debug(result);

		$assert.isEqual(expected, result, 'Should have been #expected# but was #result#.');
	}

	public void function getFakeStaffRolesTest () {
		/*var expected = [];
		var struct1 = { name: 'Travel Planner', value: 1 }
		var struct2 = { name: 'Divisional Approver', value: 2}
		var struct3 = { name: 'Departmental Approver', value: 3}
		expected[1] = struct1;
		expected[1] += struct2;
		expected[1] += struct3;*/

		/*debug(expected);*/

		/*var result = staffRole.getStaffRoles();*/
		var result = staffRole.getFakeStaffRoles();
		debug(result);

		$assert.isEqual(expected, result, 'Should have been #expected# but was #result#.');
	}
}
