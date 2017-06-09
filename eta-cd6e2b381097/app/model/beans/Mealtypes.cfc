component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="name" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		name = ""
	};

	public Mealtypes function init(
			required numeric id = 0,
			required string name = ""
		) {

		variables.id = arguments.id;
		variables.name = arguments.name;

		return this;
	}

}