component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="type" type="string" default="";
	property name="aksasrefid" type="string" default="";
	property name="refinvnumber" type="string" default="";
	property name="vendorpvndesc" type="string" default="";
	property name="amount" type="string" default="";
	property name="datepaid" type="string" default="";
	property name="aksasacct" type="string" default="";
	property name="aksasbatchnum" type="string" default="";
	property name="taid" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		type = "",
		aksasrefid = "",
		refinvnumber = "",
		vendorpvndesc = "",
		amount = "",
		datepaid = "",
		aksasacct = "",
		aksasbatchnum = "",
		taid = ""
	};

	public Onecard function init(
			required numeric id = 0,
			required string type = "",
			required string aksasrefid = "",
			required string refinvnumber = "",
			required string vendorpvndesc = "",
			required string amount = "",
			required string datepaid = "",
			required string aksasacct = "",
			required string aksasbatchnum = "",
			required string taid = ""
		) {

		variables.id = arguments.id;
		variables.type = arguments.type;
		variables.aksasrefid = arguments.aksasrefid;
		variables.refinvnumber = arguments.refinvnumber;
		variables.vendorpvndesc = arguments.vendorpvndesc;
		variables.amount = arguments.amount;
		variables.datepaid = arguments.datepaid;
		variables.aksasacct = arguments.aksasacct;
		variables.aksasbatchnum = arguments.aksasbatchnum;
		variables.taid = arguments.taid;

		return this;
	}

}