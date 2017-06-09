/**
 * I manage TA processes
 */
component accessors="true" output="false" {

	property beanFactory;
	property expenseService;
	property financialcodeService;
	property formUtilitiesService;
	property ldapfuncsService;
	property loggerService;
	property onecardService;
	property outofstateService;
	property personService;
	property staffService;
	property taService;
	property ta_processesService;
	property ta_statusService;
	property trwService;
	property workflow_processesService;
	/*property expense;
	property financialcode;
	property formutilities;
	property ldapfuncs;
	property logger;
	property onecard;
	property outofstate;
	property person;
	property staff;
	property ta_processes;
	property ta_status;
	property ta;
	property trw;
	property workflow_processes;*/

	public any function init(required struct fw) {
		variables.fw = arguments.fw;
		mileageRate = 0.575;
		return this;
	};

	/**
	 * I am used to create a new Travel Request
	 */
	public void function create (required struct rc) {
		rc.pagetitle = "Create TA | ";
		rc.breadcrumb.3 = '<a href="#fw.buildUrl("ta.create")#">Create TA</a>';
		rc.ta = beanFactory.getBean("taBean");
		rc.oostate = beanFactory.getBean("outofstateBean");
	};


	/**
	 *	I handle the TA form when it has been submitted.
	 *	@param	rc	Struct containing all the URL and form scope variables
	 *				passed into the request
	 *	@param	formAction	String describing how to handle the TA.
	 */
	public void function submit(required struct rc) {
		writeDump(rc);abort;
		formStruct = variables.formUtilitiesService.buildFormCollections(rc);
		var formAction = formStruct.ta.action;

		if (formAction == "Cancel") {
			rc.message = ["You cancelled your TA."];
			rc.type = ['info'];
			variables.fw.redirect(action='main', preserve='message, type');
		}

		if (len(formStruct.ta.id)) {
			var isNew = false;
			var taId = formstruct.ta.id;
			var taBean = variables.taService.getTaById(taid);
		} else {
			var isNew = true;
			formStruct.ta.fk_userid = personService.getIdFromEin(formStruct.ta.ein);
			formStruct.ta.fk_preparerid = personService.getIdFromEin(formStruct.ta.preparer);
			var taBean = beanFactory.getBean("taBean").init(argumentCollection=formStruct.ta);
		}

		application.chromelogger.log(taBean);

		writeDump(taBean);
		writeDump(formStruct);

		if (not taBean.getInstate()) {
			var OutOfStateBean = beanFactory.getBean("outofstateBean").init(argumentCollection=formStruct.ooState);
			writeDump(OutOfStateBean);
		}


		abort;


		if (formAction == "Submit") {

		}







		// Start workflow process (save)
		if (structKeyExists(formStruct.action, "saveTa")) {
			//TODO: make this the real ID
			// Is this even being used?
			/*var travelerId = formStruct.ta.ein;*/
			// Check if user (traveler) exists
			var travelerExists = variables.personService.checkUserExist(formStruct.ta.ein);
			if (travelerExists) {
				var userExists = true;
				var traveler = "";
			} else {
				var userExists = false;
				var newUserInfo =
					variables.ldapfuncs.getUserByEinForTa(formStruct.ta.ein);
				var newUserId = variables.personService.addUser(newUserInfo);
				formstruct.ta.fk_userid = newUserId;
			}
			formStruct.ta.Created = request.nowStamp;
			// create TA Number
			var date = Now();
			var thisYear = datePart("yyyy", date);
			var thisMonth = datePart("m", date);
			if (thisMonth GTE 7) {
				thisYear = thisYear + 1;
			}
			formstruct.ta.FiscalYear=thisYear;
			var objTaBean = beanFactory.getBean("tabean").init(argumentCollection=formstruct.ta);
			// sent the TA bean into the Data Object to add record to database
			// then take the 'generated key' and find out what the actual ID is
			// Now lets add this into the event 'workflow'
			objTaBean.fk_preparerid = formStruct.ta.fk_preparerid;
			var thisTaId = variables.taService.createNewTa(objTaBean);
			// Log the process
			var infoToLog = beanFactory.getBean("ta_processesBean");
			var personId  = variables.personService.getIdFromEin(session.auth.user.employeeNumber);
			var isStaff   = variables.staffService.isStaff(session.auth.user.employeeNumber);
			var processId = variables.workflow_processesService.getIdFromName("Start TA");
			var statusId  = variables.ta_statusService.getIdFromDesc("Pre-Trip");
			infoToLog.setFk_taid(thisTaId.id);
			infoToLog.setFk_process(processId);
			infoToLog.setFk_status(statusId);
			infoToLog.setFk_person(personId);
			if (isStaff) infoToLog.setFk_staffId(session.auth.user.employeeNumber);
			var logged = variables.loggerService.logProcess(infoToLog);
			rc.message = ["Your TA has been saved, but not yet submitted to the Travel Planners."];
			rc.type = ['success'];
		} else if (structKeyExists(formStruct.action, "updateTa")) {
			formStruct.ta.Updated = request.nowStamp;
			var objTaBean = beanFactory.getBean("ta").init(argumentCollection=formstruct.ta);
			if (!formStruct.ta.instate) {
				var objOoStateBean = beanFactory.getBean("outofstate").init(argumentCollection=formStruct.oostate);
			}
			var updateTaBean = variables.taService.updateTa(objTaBean);
			if (updateTaBean.recordCount) {
				// Log the process
				var infoToLog = beanFactory.getBean("ta_processes").init();
				var personId = variables.personService.getIdFromEin(session.auth.user.employeeNumber);
				var isStaff = variables.staffService.isStaff(session.auth.user.employeeNumber);
				var processId = variables.workflow_processesService.getIdFromName("Start TA");
				var statusId = variables.ta_statusService.getIdFromDesc("Pre-Trip");
				var details = "Updated TA";
				infoToLog.setFk_taid(updateTaBean.id);
				infoToLog.setFk_process(processId);
				infoToLog.setFk_status(statusId);
				infoToLog.setFk_person(personId);
				if (isStaff) infoToLog.setFk_staffId(session.auth.user.employeeNumber);
				infoToLog.setDetails(details);
				var logged = variables.loggerService.logProcess(infoToLog);
				rc.message = ["Your ta has been updated, but not yet submitted to the Travel Planners."];
				rc.type = ['success'];
			} else {
				rc.message = ["UPDATE TA FAILED"];
				rc.type = ['danger'];
			}


// SUMBIT TA
		} else if (structKeyExists(formStruct.action, "submitTa")) {
			// Check if user (traveler) exists
			var travelerExists = variables.personService.checkUserExist(formStruct.ta.ein);
			if (travelerExists) {
				var userExists = true;
				var userfk_userid = variables.personService.getIdFromEin(formStruct.ta.ein);
				var traveler = "";
			} else {
				var userExists = false;
				var newUserInfo = variables.ldapfuncsService.getUserByEinForTa(formStruct.ta.ein);
				var userfk_userid = variables.personService.addUser(newUserInfo);
			}
			// create TA Number
			var date = Now();
			var thisYear = datePart("yyyy", date);
			var thisMonth = datePart("m", date);
			if (thisMonth GTE 7) {
				thisYear = thisYear + 1;
			}
			formstruct.ta.FiscalYear=thisYear;
			var qlastTaNum = new Query();
			//TODO: put this in a service
			qlastTaNum.setSQL("
					select tanumber
					from Ta
					where fiscalyear = '#thisYear#'
					and tanumber is not null
					order by tanumber desc
					");
			lastTaNumResult = qlastTaNum.execute();
			if (!lastTaNumResult.getPrefix().recordcount) {
				var taNum = 1;
			} else {
				/*var lastTaNumFull = lastTa[1];*/
				var lastTaNumFull = lastTaNumResult.getResult().tanumber;
				var lastTaNum = #lastTaNumFull.split("-")[3]#;
				var taNum = lastTaNum + 1;
			}
			taNum = numberFormat(taNum, "00000");
			var taNumber = "25-" & thisYear & "-" & taNum;
			formStruct.ta.TaNumber = taNumber;
			formStruct.ta.Updated = request.nowStamp;
			formStruct.ta.Submitted = request.nowStamp;
			formStruct.ta.IsSubmitted = true;
			// Write to TA
			if (isNew) {
				writeoutput("isNew");
				formstruct.ta.Created = ParseDateTime(request.nowStamp);
				var objTaBean = beanFactory.getBean("taBean").init(argumentCollection=formstruct.ta);
				objTaBean.setfk_userid(userfk_userid);
				var TaSubmitresult = variables.taService.createNewTa(objTaBean);
				if (formStruct.ta.instate IS 'no') {
					OutOfStateBean.setfk_taid(TaSubmitresult.id);
					var ooStateSubmitResult =
						variables.outofstate.create(OutOfStateBean);
				}
			} else {
				writeoutput("existingTa");
				var objTaBean =
					variables.tabean.init(argumentCollection=formstruct.ta);
				// Returns a struct
				// returnStruct.recordCount for true or false
				// returnStruct.id for row id
				var TaSubmitresult = variables.ta.updateTa(objTaBean);
			}
			var taId = TaSubmitresult.id;

			// Log the process
			var infoToLog = beanFactory.getBean("ta_processesBean");
			var process   = variables.workflow_processesService.getIdFromName("Sent to Travel Planner");
			var status    = variables.ta_statusService.getIdFromDesc("Pre-Trip");
			var personId  = variables.personService.getIdFromEin(session.auth.user.employeeNumber);
			var isStaff   = variables.staffService.isStaff(session.auth.user.employeeNumber);
			infoToLog.setFk_taid(taid);
			infoToLog.setFk_process(process);
			infoToLog.setFk_status(status);
			infoToLog.setFk_person(personId);
			if (isStaff) infoToLog.setFk_staffId(session.auth.user.employeeNumber);
			variables.ta_processesService.createNewTaProcess(infoToLog);

			// Send an email to the Travel Planner(s) on successful submission.
			// get recipients
			var qryTravelPlanners = new Query();
			qryTravelPlanners.setSQL("
					select S.email
					from Staff S, staff_role SR
					where SR.description = 'Travel Planner'
					AND notify         = 'Y'"
					);
			var resultTravelPlanners = qryTravelPlanners.execute();
			var travelPlannersEmail = resultTravelPlanners.getResult();
			var emailTo = [];
			for (i = 1; i LTE travelPlannersEmail.recordcount; i = i + 1) {
				emailTo[i] = travelPlannersEmail.email[i];
			}
			var mailerService = new Mail();
			if ( request.environment EQ "test" ) {
				savecontent variable="mailBody" {
					writeOutput("There is a Travel Authorization request
							ready for estimation, please login to <a href='http://jnudev1.dot.state.ak.us/eta/'>ETA</a> <br>
							Traveler: " & taBean.getTravelerName() & "<br>
							Destination: " & taBean.getDestination() & "<br>
							Departure Date: " & DateFormat(taBean.getDepartureDate()) & "<br>
							Return Date: " & DateFormat(taBean.getReturnDate()) & "<br>"
							);
				}
			} else if ( request.environment EQ "dev" ) {
				savecontent variable="mailBody" {
					writeOutput("There is a Travel Authorization request
							ready for estimation, please login to <a href='http://localhost:3000/eta/'>ETA</a> <br>
							Traveler: " & taBean.getTravelerName() & "<br>
							Destination: " & taBean.getDestination() & "<br>
							Departure Date: " & DateFormat(taBean.getDepartureDate()) & "<br>
							Return Date: " & DateFormat(taBean.getReturnDate()) & "<br>"
							);
				}
			} else if ( request.environment EQ "prod" ) {
				savecontent variable="mailBody" {
					writeOutput("There is a Travel Authorization request
							ready for estimation, please login to <a href='http://web.dot.state.ak.us/admsvc/eta/'>ETA</a> <br>
							Traveler: " & taBean.getTravelerName() & "<br>
							Destination: " & taBean.getDestination() & "<br>
							Departure Date: " & DateFormat(taBean.getDepartureDate()) & "<br>
							Return Date: " & DateFormat(taBean.getReturnDate()) & "<br>");
				}
			}
			mailerService.setServer("webmailj.alaska.gov");
			mailerService.setTo(arrayToList(emailTo, ","));
			mailerService.setFrom("noreply@alaska.gov");
			mailerService.setBcc("jeremey.hustman@alaska.gov");
			mailerService.setSubject("Message From eTA: New TA Available for Estimation");
			mailerService.setType("html");
			mailerService.send(body=mailBody);
			rc.message = ["Your TA has been submitted to the Travel Planner."];
			rc.type = ['success'];
		}
		variables.fw.redirect(action='main', preserve='message, type');
	}

	/**
	 * I handle the review TA page.
	 */
	public void function review(required struct rc) {
		rc.pagetitle = "Review TA List | ";
		rc.breadcrumb.3 = '<a href="#fw.buildUrl("ta.review")#">Review TA List</a>';
	}

	/**
	 * I handle the update page.
	 */
	public void function update(required struct rc) {
		rc.pagetitle = "Update TA | ";
		rc.breadcrumb.3 = '<a href="#fw.buildUrl("ta.review")#">Review TA List</a>';
		rc.breadcrumb.4 = '<a href="#fw.buildUrl("ta.update")#">Update TA</a>';
		rc.ta = variables.taService.getTaById(rc.taId);
		rc.oostate = variables.outofstateService.getByTaid(rc.taId);
	}

	/**
	 * I am called when the user wants to view their TA.
	 */
	public void function view(required struct rc) {
		rc.pagetitle = "View TA | ";
		rc.breadcrumb.3 = '<a href="#fw.buildUrl("ta.review")#">Review TA List</a>';
		rc.breadcrumb.4 = '<span>View TA</span>';
		rc.ta = variables.taService.getTaById(rc.taid);
		rc.fincodes = variables.financialcodeService.getFincodesByTaID(rc.taid);
		rc.expenseArray = variables.expenseService.getExpensesByTaId(rc.taid);
		rc.onecardArray = variables.onecardService.getOnecardsByTaId(rc.taid);
		rc.trw = variables.trwService.getTrwByTaid(rc.taid);
		rc.mileageRate = mileageRate;
	}
}
