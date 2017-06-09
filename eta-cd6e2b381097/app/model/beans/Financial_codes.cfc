component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="code" type="string" default="";
	property name="taid" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		code = "",
		taid = ""
	};

	public Financial_codes function init(
			required numeric id = 0,
			required string code = "",
			required string taid = ""
		) {

		variables.id = arguments.id;
		variables.code = arguments.code;
		variables.taid = arguments.taid;

		return this;
	}

}