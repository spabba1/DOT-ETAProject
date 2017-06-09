component accessors="true" output="false" {

	property name="mileagerate" type="numeric" default=0;
	property name="effectivedate" type="any" default="";
	property name="changedby" type="numeric" default=0;
	property name="id" type="numeric" default=0;

	// Pseudo-constructor
	variables.instance = {
		mileagerate = 0,
		effectivedate = "",
		changedby = 0,
		id = 0
	};

	public Mileagerate function init(
			required numeric mileagerate = 0,
			required any effectivedate = "",
			required numeric changedby = 0,
			required numeric id = 0
		) {

		variables.mileagerate = arguments.mileagerate;
		variables.effectivedate = arguments.effectivedate;
		variables.changedby = arguments.changedby;
		variables.id = arguments.id;

		return this;
	}

}