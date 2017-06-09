component accessors="true" output="false" {

	property name="id" type="numeric" default=0;
	property name="fiscalyear" type="string" default="";
	property name="tanumber" type="string" default="";
	property name="ee" type="string" default="";
	property name="instate" type="string" default="";
	property name="physaddr" type="string" default="";
	property name="warrantaddr" type="string" default="";
	property name="pvn" type="string" default="";
	property name="travelername" type="string" default="";
	property name="title" type="string" default="";
	property name="dept" type="string" default="";
	property name="div" type="string" default="";
	property name="bu" type="string" default="";
	property name="dutystation" type="string" default="";
	property name="homeaddress" type="string" default="";
	property name="homecity" type="string" default="";
	property name="homestate" type="string" default="";
	property name="homezip" type="string" default="";
	property name="workdays" type="string" default="";
	property name="worktime" type="string" default="";
	property name="destination" type="string" default="";
	property name="travpref" type="string" default="";
	property name="departurefrom" type="string" default="";
	property name="departuredate" type="string" default="";
	property name="returndate" type="string" default="";
	property name="purpose" type="string" default="";
	property name="estcost" type="string" default="";
	property name="actualsreq" type="string" default="";
	property name="travadv" type="string" default="";
	property name="perstrav" type="string" default="";
	property name="perstravbegin" type="string" default="";
	property name="perstravend" type="string" default="";
	property name="perstravairfare" type="string" default="";
	property name="stateauthtrv" type="string" default="";
	property name="hotelinc" type="string" default="";
	property name="carinc" type="string" default="";
	property name="confcom" type="string" default="";
	property name="supervisor" type="string" default="";
	property name="issubmitted" type="string" default="";
	property name="specialinst" type="string" default="";
	property name="created" type="string" default="";
	property name="updated" type="string" default="";
	property name="submitted" type="string" default="";
	property name="deleted" type="string" default="";
	property name="travelerid" type="string" default="";
	property name="preparerid" type="string" default="";
	property name="travadvwn" type="string" default="";
	property name="travadvwnamt" type="string" default="";
	property name="atmwithdrawal" type="string" default="";
	property name="edocsid" type="string" default="";
	property name="edocsname" type="string" default="";
	property name="destinationto" type="string" default="";
	property name="estimatorid" type="string" default="";
	property name="taxtravnontax" type="string" default="";
	property name="taxtravtaxable" type="string" default="";
	property name="taxtravtotal" type="string" default="";
	property name="processid" type="numeric" default=0;
	property name="mileagerate" type="numeric" default=0;
	property name="ooptotals" type="string" default="";
	property name="totaldue" type="string" default="";
	property name="totaltripexpense" type="string" default="";

	// Pseudo-constructor
	variables.instance = {
		id = 0,
		fiscalyear = "",
		tanumber = "",
		ee = "",
		instate = "",
		physaddr = "",
		warrantaddr = "",
		pvn = "",
		travelername = "",
		title = "",
		dept = "",
		div = "",
		bu = "",
		dutystation = "",
		homeaddress = "",
		homecity = "",
		homestate = "",
		homezip = "",
		workdays = "",
		worktime = "",
		destination = "",
		travpref = "",
		departurefrom = "",
		departuredate = "",
		returndate = "",
		purpose = "",
		estcost = "",
		actualsreq = "",
		travadv = "",
		perstrav = "",
		perstravbegin = "",
		perstravend = "",
		perstravairfare = "",
		stateauthtrv = "",
		hotelinc = "",
		carinc = "",
		confcom = "",
		supervisor = "",
		issubmitted = "",
		specialinst = "",
		created = "",
		updated = "",
		submitted = "",
		deleted = "",
		travelerid = "",
		preparerid = "",
		travadvwn = "",
		travadvwnamt = "",
		atmwithdrawal = "",
		edocsid = "",
		edocsname = "",
		destinationto = "",
		estimatorid = "",
		taxtravnontax = "",
		taxtravtaxable = "",
		taxtravtotal = "",
		processid = 0,
		mileagerate = 0,
		ooptotals = "",
		totaldue = "",
		totaltripexpense = ""
	};

	public Ta function init(
			required numeric id = 0,
			required string fiscalyear = "",
			required string tanumber = "",
			required string ee = "",
			required string instate = "",
			required string physaddr = "",
			required string warrantaddr = "",
			required string pvn = "",
			required string travelername = "",
			required string title = "",
			required string dept = "",
			required string div = "",
			required string bu = "",
			required string dutystation = "",
			required string homeaddress = "",
			required string homecity = "",
			required string homestate = "",
			required string homezip = "",
			required string workdays = "",
			required string worktime = "",
			required string destination = "",
			required string travpref = "",
			required string departurefrom = "",
			required string departuredate = "",
			required string returndate = "",
			required string purpose = "",
			required string estcost = "",
			required string actualsreq = "",
			required string travadv = "",
			required string perstrav = "",
			required string perstravbegin = "",
			required string perstravend = "",
			required string perstravairfare = "",
			required string stateauthtrv = "",
			required string hotelinc = "",
			required string carinc = "",
			required string confcom = "",
			required string supervisor = "",
			required string issubmitted = "",
			required string specialinst = "",
			required string created = "",
			required string updated = "",
			required string submitted = "",
			required string deleted = "",
			required string travelerid = "",
			required string preparerid = "",
			required string travadvwn = "",
			required string travadvwnamt = "",
			required string atmwithdrawal = "",
			required string edocsid = "",
			required string edocsname = "",
			required string destinationto = "",
			required string estimatorid = "",
			required string taxtravnontax = "",
			required string taxtravtaxable = "",
			required string taxtravtotal = "",
			required numeric processid = 0,
			required numeric mileagerate = 0,
			required string ooptotals = "",
			required string totaldue = "",
			required string totaltripexpense = ""
		) {

		variables.id = arguments.id;
		variables.fiscalyear = arguments.fiscalyear;
		variables.tanumber = arguments.tanumber;
		variables.ee = arguments.ee;
		variables.instate = arguments.instate;
		variables.physaddr = arguments.physaddr;
		variables.warrantaddr = arguments.warrantaddr;
		variables.pvn = arguments.pvn;
		variables.travelername = arguments.travelername;
		variables.title = arguments.title;
		variables.dept = arguments.dept;
		variables.div = arguments.div;
		variables.bu = arguments.bu;
		variables.dutystation = arguments.dutystation;
		variables.homeaddress = arguments.homeaddress;
		variables.homecity = arguments.homecity;
		variables.homestate = arguments.homestate;
		variables.homezip = arguments.homezip;
		variables.workdays = arguments.workdays;
		variables.worktime = arguments.worktime;
		variables.destination = arguments.destination;
		variables.travpref = arguments.travpref;
		variables.departurefrom = arguments.departurefrom;
		variables.departuredate = arguments.departuredate;
		variables.returndate = arguments.returndate;
		variables.purpose = arguments.purpose;
		variables.estcost = arguments.estcost;
		variables.actualsreq = arguments.actualsreq;
		variables.travadv = arguments.travadv;
		variables.perstrav = arguments.perstrav;
		variables.perstravbegin = arguments.perstravbegin;
		variables.perstravend = arguments.perstravend;
		variables.perstravairfare = arguments.perstravairfare;
		variables.stateauthtrv = arguments.stateauthtrv;
		variables.hotelinc = arguments.hotelinc;
		variables.carinc = arguments.carinc;
		variables.confcom = arguments.confcom;
		variables.supervisor = arguments.supervisor;
		variables.issubmitted = arguments.issubmitted;
		variables.specialinst = arguments.specialinst;
		variables.created = arguments.created;
		variables.updated = arguments.updated;
		variables.submitted = arguments.submitted;
		variables.deleted = arguments.deleted;
		variables.travelerid = arguments.travelerid;
		variables.preparerid = arguments.preparerid;
		variables.travadvwn = arguments.travadvwn;
		variables.travadvwnamt = arguments.travadvwnamt;
		variables.atmwithdrawal = arguments.atmwithdrawal;
		variables.edocsid = arguments.edocsid;
		variables.edocsname = arguments.edocsname;
		variables.destinationto = arguments.destinationto;
		variables.estimatorid = arguments.estimatorid;
		variables.taxtravnontax = arguments.taxtravnontax;
		variables.taxtravtaxable = arguments.taxtravtaxable;
		variables.taxtravtotal = arguments.taxtravtotal;
		variables.processid = arguments.processid;
		variables.mileagerate = arguments.mileagerate;
		variables.ooptotals = arguments.ooptotals;
		variables.totaldue = arguments.totaldue;
		variables.totaltripexpense = arguments.totaltripexpense;

		return this;
	}

}