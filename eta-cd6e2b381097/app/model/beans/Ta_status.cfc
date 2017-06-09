component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="description" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		description = ""
	};

	public Ta_status function init(
			required numeric id = 0,
			required string description = ""
		) {

		variables.id = arguments.id;
		variables.description = arguments.description;

		return this;
	}

}