component accessors="true" output="false" {

	property name="username" type="string" default="";
	property name="didlogin" type="string" default="";
	property name="ein" type="numeric" default=0;

	// Pseudo-constructor
	variables.instance = {
		username = "",
		didlogin = "",
		ein = 0
	};

	public Etauser function init(
			required string username = "",
			required string didlogin = "",
			required numeric ein = 0
		) {

		variables.username = arguments.username;
		variables.didlogin = arguments.didlogin;
		variables.ein = arguments.ein;

		return this;
	}

}