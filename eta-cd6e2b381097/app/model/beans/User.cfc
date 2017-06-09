component accessors="true" {

	property string bu;
	property string username;
	property deptnum;
	property numeric travelerid;
	property string dutystation;
	property string dept;
	property string div;
	property string phone;
	property string title;
	property string fullname;

	property string address;
	property string city;
	property string state;
	property string zip;
	property string workdays;
	property string worktime;
	property string pvn;

	public any function init(
			bu = "",
			username = "",
			deptnum = "",
			travelerid = 0,
			dutystation = "",
			dept = "",
			div = "",
			phone = "",
			title = "",
			fullname = "",

			address = "",
			city = "",
			state = "",
			zip = "",
			workdays = "",
			worktime = "",
			pvn = ""
			) {

	variables.bu = arguments.bu;
	variables.username = arguments.username;
	variables.deptnum = arguments.deptnum;
	variables.travelerid = arguments.travelerid;
	variables.dutystation = arguments.dutystation;
	variables.dept = arguments.dept;
	variables.div = arguments.div;
	variables.phone = arguments.phone;
	variables.title = arguments.title;
	variables.fullname = arguments.fullname;

	variables.address = arguments.address;
	variables.city = arguments.city;
	variables.state = arguments.state;
	variables.zip = arguments.zip;
	variables.workdays = arguments.workdays;
	variables.worktime = arguments.worktime;
	variables.pvn = arguments.pvn;

	return this;

	}
}
