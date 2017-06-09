component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="expensedate" type="string" default="";
	property name="explanation" type="string" default="";
	property name="meals" type="string" default="";
	property name="facility" type="string" default="";
	property name="miles" type="string" default="";
	property name="surfmileage" type="string" default="";
	property name="othertrans" type="string" default="";
	property name="lodging" type="string" default="";
	property name="mie" type="string" default="";
	property name="other" type="string" default="";
	property name="taid" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		expensedate = "",
		explanation = "",
		meals = "",
		facility = "",
		miles = "",
		surfmileage = "",
		othertrans = "",
		lodging = "",
		mie = "",
		other = "",
		taid = ""
	};

	public Expense function init(
			required numeric id = 0,
			required string expensedate = "",
			required string explanation = "",
			required string meals = "",
			required string facility = "",
			required string miles = "",
			required string surfmileage = "",
			required string othertrans = "",
			required string lodging = "",
			required string mie = "",
			required string other = "",
			required string taid = ""
		) {

		variables.id = arguments.id;
		variables.expensedate = arguments.expensedate;
		variables.explanation = arguments.explanation;
		variables.meals = arguments.meals;
		variables.facility = arguments.facility;
		variables.miles = arguments.miles;
		variables.surfmileage = arguments.surfmileage;
		variables.othertrans = arguments.othertrans;
		variables.lodging = arguments.lodging;
		variables.mie = arguments.mie;
		variables.other = arguments.other;
		variables.taid = arguments.taid;

		return this;
	}

}