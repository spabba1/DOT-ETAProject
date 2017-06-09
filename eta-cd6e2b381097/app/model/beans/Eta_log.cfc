component accessors="true" output="false" {

	property name="created" type="string" default="";
	property name="statusid" type="numeric" default=0;
	property name="processid" type="numeric" default=0;
	property name="taid" type="numeric" default=0;
	property name="travelerid" type="numeric" default=0;
	property name="id" type="numeric" default=0;
	property name="staffid" type="string" default="";
	property name="approved" type="string" default="";
	property name="details" type="string" default="";
	property name="approverid" type="string" default="";
	property name="preparerid" type="numeric" default=0;

	// Pseudo-constructor
	variables.instance = {
		created = "",
		statusid = 0,
		processid = 0,
		taid = 0,
		travelerid = 0,
		id = 0,
		staffid = "",
		approved = "",
		details = "",
		approverid = "",
		preparerid = 0
	};

	public Eta_log function init(
			required string created = "",
			required numeric statusid = 0,
			required numeric processid = 0,
			required numeric taid = 0,
			required numeric travelerid = 0,
			required numeric id = 0,
			required string staffid = "",
			required string approved = "",
			required string details = "",
			required string approverid = "",
			required numeric preparerid = 0
		) {

		variables.created = arguments.created;
		variables.statusid = arguments.statusid;
		variables.processid = arguments.processid;
		variables.taid = arguments.taid;
		variables.travelerid = arguments.travelerid;
		variables.id = arguments.id;
		variables.staffid = arguments.staffid;
		variables.approved = arguments.approved;
		variables.details = arguments.details;
		variables.approverid = arguments.approverid;
		variables.preparerid = arguments.preparerid;

		return this;
	}

}