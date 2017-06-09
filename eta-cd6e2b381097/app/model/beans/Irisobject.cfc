component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="description" type="string" default="";
	property name="instate" type="string" default="";
	property name="outstate" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		description = "",
		instate = "",
		outstate = ""
	};

	public Irisobject function init(
			required numeric id = 0,
			required string description = "",
			required string instate = "",
			required string outstate = ""
		) {

		variables.id = arguments.id;
		variables.description = arguments.description;
		variables.instate = arguments.instate;
		variables.outstate = arguments.outstate;

		return this;
	}

}