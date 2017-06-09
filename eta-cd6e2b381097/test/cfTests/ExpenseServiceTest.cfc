component displayname="Expense Service Test" extends="testbox.system.BaseSpec" {

	taid = 222; //some expense that exists

	public void function beforeTests() {
		expenseService = new model.services.expense();
	}

	/*public void function setUp() {*/

	function getExpensesTest() {
		expenses = expenseService.getExpensesByTaId(taid);
		debug(expenses);
	}

}

