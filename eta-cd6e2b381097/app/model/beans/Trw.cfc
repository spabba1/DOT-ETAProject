component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="fin" type="string" default="";
	property name="typeid" type="string" default="";
	property name="amount" type="string" default="";
	property name="irisobjectid" type="string" default="";
	property name="taid" type="numeric" default=0;

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		fin = "",
		typeid = "",
		amount = "",
		irisobjectid = "",
		taid = 0
	};

	public Trw function init(
			required numeric id = 0,
			required string fin = "",
			required string typeid = "",
			required string amount = "",
			required string irisobjectid = "",
			required numeric taid = 0
		) {

		variables.id = arguments.id;
		variables.fin = arguments.fin;
		variables.typeid = arguments.typeid;
		variables.amount = arguments.amount;
		variables.irisobjectid = arguments.irisobjectid;
		variables.taid = arguments.taid;

		return this;
	}

}