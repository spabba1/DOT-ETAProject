component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="confname" type="string" default="";
	property name="goal" type="string" default="";
	property name="localoption" type="string" default="";
	property name="localoptionreason" type="string" default="";
	property name="beneficial" type="string" default="";
	property name="sharing" type="string" default="";
	property name="groupable" type="string" default="";
	property name="debrief" type="string" default="";
	property name="comments" type="string" default="";
	property name="taid" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		confname = "",
		goal = "",
		localoption = "",
		localoptionreason = "",
		beneficial = "",
		sharing = "",
		groupable = "",
		debrief = "",
		comments = "",
		taid = ""
	};

	public Outofstate function init(
			required numeric id = 0,
			required string confname = "",
			required string goal = "",
			required string localoption = "",
			required string localoptionreason = "",
			required string beneficial = "",
			required string sharing = "",
			required string groupable = "",
			required string debrief = "",
			required string comments = "",
			required string taid = ""
		) {

		variables.id = arguments.id;
		variables.confname = arguments.confname;
		variables.goal = arguments.goal;
		variables.localoption = arguments.localoption;
		variables.localoptionreason = arguments.localoptionreason;
		variables.beneficial = arguments.beneficial;
		variables.sharing = arguments.sharing;
		variables.groupable = arguments.groupable;
		variables.debrief = arguments.debrief;
		variables.comments = arguments.comments;
		variables.taid = arguments.taid;

		return this;
	}

}