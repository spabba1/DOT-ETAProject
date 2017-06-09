component extends="mxunit.framework.TestCase" {

	public void function setUp() {

		etaMock = mock('app.Application');
		debug(etaMock);

		taController = new app.controllers.ta();
		debug(taController);

		rc  =  {};
		rc.ta.preparer = 321333;
		rc.ta.id = "";
		rc.ta.created = "";
		rc.ta.updated = "";
		rc.ta.fk_userid = "";
		rc.ta.fk_preparerid = "";
		rc.ta.ee = "yes";
		rc.ta.instate = "no";
		rc.ta.physAddr = "No";
		rc.ta.warrantAddr = "no";
		rc.ta.ein = 231749;
		rc.ta.pvn = "";
		rc.ta.travelerName = "Wendy S Parker";
		rc.ta.title = "Analyst/Programmer V";
		rc.ta.dept = "Transportation & Public Facilities";
		rc.ta.div = "ISD-INFO SYS SVCS";
		rc.ta.bu = "GP";
		rc.ta.dutyStation = "Juneau";
		rc.ta.homeAddress = "";
		rc.ta.homeCity = "";
		rc.ta.homeState = "";
		rc.ta.homeZip = "";
		rc.ta.workDays = "M-F";
		rc.ta.workTime = "8:00 - 4:30";
		rc.ta.departureFrom = "Juneau";
		rc.ta.departureDate = "07/18/2015";
		rc.ta.destinationTo = "Mobile, Alabama";
		rc.ta.returnDate = "08/22/2015";
		rc.ta.purpose = "AASHTO HR Subcommittee Meeting.  Car will not be needed.  Hotel is the same as the conference location.";
		rc.ta.travPref = "No preferences at this time.";
		rc.ta.hotelInc = "yes";
		rc.ta.carInc = "no";
		rc.action.submitTa = "Submit";
		rc.oostate.confname = "This is the training or conference name spot.";
		rc.oostate.goal = "This explains your goals with this travel";
		rc.oostate.localoption = "Y";
		rc.oostate.localoptionreason = "Yes to this question.";
		rc.oostate.beneficial = "Because it shows me what to do";
		rc.oostate.sharing = "I will have a meeting";
		rc.oostate.groupable = "Y";
		rc.oostate.debrief = "Y";
		rc.oostate.comments = "There is only one class or something.";

	}

	public void function createTaTest() {

		taController.submit(rc);

	}

}

