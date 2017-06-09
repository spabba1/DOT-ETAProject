component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="firstname" type="string" default="";
	property name="lastname" type="string" default="";
	property name="email" type="string" default="";
	property name="datejoined" type="string" default="";
	property name="dateleft" type="string" default="";
	property name="otherdetails" type="string" default="";
	property name="staffroleid" type="string" default="";
	property name="notify" type="string" default="";
	property name="username" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		firstname = "",
		lastname = "",
		email = "",
		datejoined = "",
		dateleft = "",
		otherdetails = "",
		staffroleid = "",
		notify = "",
		username = ""
	};

	public Staff function init(
			required numeric id = 0,
			required string firstname = "",
			required string lastname = "",
			required string email = "",
			required string datejoined = "",
			required string dateleft = "",
			required string otherdetails = "",
			required string staffroleid = "",
			required string notify = "",
			required string username = ""
		) {

		variables.id = arguments.id;
		variables.firstname = arguments.firstname;
		variables.lastname = arguments.lastname;
		variables.email = arguments.email;
		variables.datejoined = arguments.datejoined;
		variables.dateleft = arguments.dateleft;
		variables.otherdetails = arguments.otherdetails;
		variables.staffroleid = arguments.staffroleid;
		variables.notify = arguments.notify;
		variables.username = arguments.username;

		return this;
	}

}