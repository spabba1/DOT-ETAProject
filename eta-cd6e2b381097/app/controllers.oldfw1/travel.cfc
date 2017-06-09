component accessors="true" hint="I am the Travel controller" {

	property beanFactory;
	property edocsService;
	property expenseService;
	property financialcodeService;
	property formutilitiesService;
	property ldapfuncsService;
	property loginService;
	property onecardService;
	property outofstateService;
	property personService;
	property staffService;
	property taService;
	property ta_processesService;
	property ta_statusService;
	property trwService;
	property workflow_processesService;
	property usefulfunctionsService;

	public void function init(required struct fw) output="false" {
		variables.fw = fw;
		mileageRate = 0.575;
	};

	public void function default(required struct rc) output="false" {
		rc.pagetitle = "Estimate - Approval List | ";
		rc.breadcrumb.3 = "<a href='#fw.buildUrl('travel.default')#'>Estimate - Approval List</a>";
	};

	/**
	 * The submit function is called when the Travel Coordinator submits an
	 * estimated TA.
	 */
	public void function submit(required struct rc) output="false" {
		var formStruct = variables.formutilitiesService.buildFormCollections(rc);

		if (structKeyExists(rc, "action.saveestimate")
				AND rc.action.saveestimate EQ 'Save') {

			var taid = formStruct.ta.id;

			formStruct.ta.fk_preparerid = formStruct.ta.preparer;
			formStruct.ta.fk_userid = variables.personService.getIdFromEin(formstruct.ta.ein);

			// populate ta bean
			var ta = beanFactory.getBean("taBean").init(argumentCollection=formStruct.ta);

			ta.process = variables.workflow_processesService.getIdFromName("E-Travel Itinerary Research");
			ta.status = variables.ta_statusService.getIdFromDesc("Pre-Trip");



			// Financial Codes/*{*/

			// Delete Financial Codes flagged for deletion
			var fincodesToDelete = formstruct.delFincode.toDelete;
			var delFincodeArray = listToArray(fincodesToDelete);

			var i = 1;
			for (i = 1; i LTE arrayLen(delFincodeArray); i += 1) {
				var deletedFincode = variables.financialcodeService.delete(delFincodeArray[i]);
			}

			// Insert/Update new financial codes
			structDelete(formstruct.fincode, 0); // remove empty template

			var formFincodes = formstruct.fincode;

			var fincodeArray = structKeyArray(formFincodes);
			arraySort(fincodeArray, "numeric", "asc");

			for (i = 1; i LTE structCount(formFincodes); i += 1) {
				var isEmpty =variables.usefulfunctionsService.checkEmptyBean(formFincodes[fincodeArray[i]]);

				if (NOT isEmpty) {
					formFincodes[fincodeArray[i]].fk_taid = taid;

					var thisFincode = beanFactory.getBean("financial_codesBean").init(
							argumentCollection=formFincodes[fincodeArray[i]]
							);


					if (formFincodes[fincodeArray[i]].isNew) {
						var createNewFincode = variables.financialcodeService.create(thisFincode);
					} else {
						var updateFincode = variables.financialcodeService.update(thisFincode);
					}
				}
			}

			/*}*/

			// Expenses/*{*/

			// Delete Expenses flagged for deletion
			var expensesToDelete = formstruct.expensedel.toDelete;
			var delExpArray = listToArray(expensesToDelete);

			for (i = 1; i LTE arrayLen(delExpArray); i += 1) {
				var deletedExpense = variables.expenseService.delete(delExpArray[i]);
			}


			// Insert/Update Expenses
			structDelete(formstruct.expense, 0); // remove empty template

			var formExpenses = formstruct.expense;

			var expensesArray = structKeyArray(formExpenses);
			arraySort(expensesArray, "numeric", "asc");

			for (i = 1; i LTE structCount(formExpenses); i += 1) {

				var expenseId = expensesArray[i];
				var isEmpty = variables.usefulfunctionsService.checkEmptyBean(formExpenses[expensesArray[i]]);

				formExpenses[expensesArray[i]].id = expenseId;

				if (NOT isEmpty) {
					formExpenses[expensesArray[i]].fk_taid = taid;

					/*var thisExpense = variables.expensebean.init(argumentCollection=formExpenses[expensesArray[i]]);*/
					var thisExpense = beanFactory.getBean("expenseBean").init(argumentCollection=formExpenses[expensesArray[i]]);

					if (formExpenses[expensesArray[i]].isNew) {
						var createNewExpense = variables.expenseService.create(thisExpense);
					} else {
						var updateExpense = variables.expenseService.update(thisExpense);
					}

				} else {
					variables.expenseService.delete(expenseId);
				}

			}
			/*}*/

			// Travel Reimbursement Warrant (TRW)/*{*/

			// Delete TRW flagged for deletion
			var trwToDelete = formstruct.delTrw.toDelete;
			var delTRWArray = listToArray(trwToDelete);

			for (i = 1; i LTE arrayLen(delTRWArray); i += 1) {
				var deletedTRW = variables.trwService.deleteById(delTRWArray[i]);
			}

			// Insert/Update TRW's
			structDelete(formstruct.trw, 0); // remove empty template

			var formTRWs = formstruct.trw;

			var trwArray = structKeyArray(formTRWs);
			arraySort(trwArray, "numeric", "asc");
			for (i = 1; i LTE structCount(formTRWs); i += 1) {
				var isEmpty = variables.usefulfunctionsService.checkEmptyBean(formTRWs[trwArray[i]]);
				if (NOT isEmpty) {
					formTRWs[trwArray[i]].fk_taid = taid;

					/*var thisTRW = variables.trwbean.init(argumentCollection=formTRWs[trwArray[i]]);*/
					var thisTRW = beanFactory.getBean("trwBean").init(argumentCollection=formTRWs[trwArray[i]]);

					if (formTRWs[trwArray[i]].isNew) {
						var createNewTRW = variables.trwService.create(thisTRW);
					} else {
						var updateOneCard = variables.trwService.update(thisTRW);
					}
				} else {
					variables.trwService.deleteById(trwArray[i]);
				}

			}
			/*}*/

			// Onecard Expenses/*{*/

			// Delete Onecard Expenses flagged for deletion
			var onecardsToDelete = formstruct.delOnecard.toDelete;
			var delOnecardArray = listToArray(onecardsToDelete);

			for (i = 1; i LTE arrayLen(delOnecardArray); i += 1) {
				var deletedOnecard = variables.onecardService.deleteById(delOnecardArray[i]);
			}

			// Insert/Update Onecard Expenses
			structDelete(formstruct.onecard, 0); // remove empty template

			var formOnecards = formstruct.onecard;

			var onecardArray = structKeyArray(formOnecards);
			arraySort(onecardArray, "numeric", "asc");
			for (i = 1; i LTE structCount(formOnecards); i += 1) {

				var oneCardId = onecardArray[i];
				var isEmpty = variables.usefulfunctionsService.checkEmptyBean(formOnecards[oneCardId]);

				formOnecards[onecardArray[i]].id = oneCardId;

				if (NOT isEmpty) {
					formOnecards[onecardArray[i]].fk_taid = taid;

					/*var thisOnecard = variables.onecardbean.init(argumentCollection=formOnecards[onecardArray[i]]);*/
					var thisOnecard = beanFactory.getBean("onecardBean").init(argumentCollection=formOnecards[onecardArray[i]]);

					if (formOnecards[onecardArray[i]].isNew) {
						var createNewOnecard =
							variables.onecardService.create(thisOnecard);
					} else {
						var updateOneCard =
							variables.onecardService.update(thisOnecard);
					}
				} else {
					variables.onecardService.deleteById(onecardId);
				}

			}
			/*}*/

			// Commit changes to database
			var updateMyTa = variables.taService.updateTa(ta);

			// Log the process/*{*/
			var personId =
				variables.personService.getIdFromEin(session.auth.user.employeeNumber);
			var infoToLog = beanFactory.getBean("ta_processesBean").init();
			var isStaff = variables.staffService.isStaff(session.auth.user.employeeNumber);
			infoToLog.setFk_taid(ta.getId());
			infoToLog.setFk_process(ta.process);
			infoToLog.setFk_status(ta.status);
			infoToLog.setFk_person(personId);
			if (isStaff) {
				infoToLog.setFk_staffId(session.auth.user.employeeNumber);
			}
			infoToLog.setCreated(request.nowStamp);

			ta_processesService.createNewTaProcess(infoToLog);
			/*}*/

			rc.message = ['TA Estimate has been saved'];
			rc.type = ['success'];
			variables.fw.redirect(action='main', preserve='message, type');

		}
	}

	/**
	 * The view function is used when a travel coordinator wants to view an
	 * estimated TA.
	 */
	public void function view(required struct rc) output="false" {
		rc.pagetitle = "Sent TA for Approval | ";
		rc.breadcrumb.3 = "<a href='#fw.buildUrl('travel.default')#'>Estimate - Approval List</a>";
		rc.breadcrumb.4 = "<a href='#fw.buildUrl('travel.view')#'>Sent TA for Approval</a>";
		rc.ta = variables.taService.getTaById(rc.taid);

		// fetch fincodes
		rc.fincodes = variables.financialcodeService.getFincodesByTaid(rc.taid);

		// fetch expenses
		rc.expenseArray = variables.expenseService.getExpensesByTaId(rc.taid);

		// fetch traveler reimbersements
		rc.trw = variables.trwService.getTrwByTaid(rc.taId);

		// fetch onecard
		rc.onecardArray = variables.onecardService.getOnecardsByTaId(rc.taid);

		rc.mileageRate = mileageRate;
	}

	/**
	 * I simply pull an active TA ready for estimation.
	 */
	public void function estimate(required struct rc) output="false" {
		if (!StructKeyExists(rc, "taid")) {
			variables.fw.redirect('main.default');
		}
		rc.pagetitle = "Estimate TA | ";
		rc.breadcrumb.3 = "<a href='#fw.buildUrl('travel.default')#'>Estimate - Approval List</a>";
		rc.breadcrumb.4 = "<a href='#fw.buildUrl('travel.estimate')#'>Estimate TA</a>";
		var estimatorId = session.auth.user.employeeNumber;


		var setEstimator = variables.taService.setEstimator(rc.taId, estimatorId);
		rc.ta = variables.taService.getTaById(rc.taId);
		rc.ooState = variables.outofstateService.getByTaid(rc.taId);

		rc.fincodes = variables.financialcodeService.getFincodesByTaid(rc.taId);
		rc.expenses = variables.expenseService.getExpensesByTaId(rc.taId);
		rc.onecard = variables.onecardService.getOnecardsByTaId(rc.taId);
		rc.trw = variables.trwService.getTrwByTaid(rc.taId);

		var ldapInfo = deserializeJSON(variables.ldapfuncsService.getUserByEin(estimatorId));
		rc.preparedBy = ldapInfo.data[1][9];
		rc.preparersPhone = ldapInfo.data[1][15];

		rc.mileageRate = mileageRate;
	}

	/**
	 * I am the edocs upload handler
	 */
	public void function edocsUpload(required struct rc) output="false" {
		request.layout = false;

		/* For Testing */
		/*rc.taid = 61;*/
		/*var estimatorId = session.auth.user.employeeNumber;*/
		/*var setEstimator = variables.taService.setEstimator(rc.taId, estimatorId);*/
		/*rc.taInfo = variables.taService.getTaById(rc.taid);*/

		/*rc.fincodes = variables.financialcodeService.getFincodesByTaid(rc.taid);*/
		/*rc.expenseArray = variables.expenseService.getExpensesByTaId(rc.taid);*/
		/*rc.onecardArray = variables.onecardService.getOnecardsByTaId(rc.taid);*/
		/*rc.trwArray = variables.trwService.getTrwByTaid(rc.taid);*/
		/*rc.outofstate = false;*/
		/*var estimatorId = variables.personService.getEinById(rc.taInfo.getFk_preparerid());*/

		/*var ldapInfo = deserializeJSON(variables.ldapfuncsService.getUserByEin(estimatorId));*/
		/*rc.preparedBy = ldapInfo.data[1][9];*/
		/*rc.preparersPhone = ldapInfo.data[1][15];*/
		/* End Testing */


		var edocsKey = variables.loginService.getSessionKeys(
				session.auth.sessionkey,
				session.auth.sessionid
				);

		// Figure out if this is a rejected ta
		var isRejected = variables.workflow_processesService.isRejected(rc.taid);

		var isOutOfState = variables.taService.isOutOfState(rc.taid);

		// check-out by logged in user if rejected
		if (isRejected) {
			var edocsInfo = variables.taService.getEdocsInfoFromTaid(rc.taid);
			var checkedOut = edocsService.checkout(
					rc.reviewerId,
					edocsKey,
					edocsInfo.dID
					);
			if (!checkedOut.success) {
				rc.message = [checkedOut.message];
				rc.type = ['danger'];
				variables.fw.redirect(action='travel', preserve='message, type');
			}
		}

		var uploadToEdocs = edocsService.upload(
			rc.taid,
			rc.reviewerId,
			edocsKey,
			isOutOfState,
			isRejected
		);

		var thisTa = variables.taService.getTaById(rc.taid);

		if (NOT isRejected) {
			thisTa.setEdocsId(uploadToEdocs.dID);
			thisTa.setEdocsName(uploadToEdocs.dDocName);
		}

		var doUpdate = variables.taService.updateTa(thisTa);

		rc.message = [doUpdate.message];
		rc.type = [doUpdate.type];
		variables.fw.redirect(action='main.default', preserve="message,type");
	}
}
