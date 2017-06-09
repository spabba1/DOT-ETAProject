<cfcomponent hint="I query the database for DataTables">
<cfscript>

    remote string function deleteStaff(required numeric id) returnFormat="plain" {
        var staffDAO = new model.services.staff();

        var deleteMember = staffDAO.deleteStaffById(arguments.id);

        if (NOT deleteMember) {
            return "failure!";
        } else {
            return "ok";
        }
    }

    remote any function addStaff(
        required numeric ein,
        required string email,
        required string firstName,
        required string lastName,
        required string notify,
        required numeric staffRole,
        required string otherDetails) returnFormat="plain" {

        var staff = new model.beans.Staff();
        var staffService = new model.services.staff();

        var currentTime = Now();

        staff.id = arguments.ein;
        staff.firstname = arguments.firstName;
        staff.lastname = arguments.lastName;
        staff.email = arguments.email;
        staff.datejoined = currentTime;
        staff.otherdetails = arguments.otherDetails;
        staff.notify = arguments.notify;
        staff.fk_staffroleid = arguments.staffRole;

        var returnedId = staffService.createNewStaff(staff);

        return returnedId;
    }

	/*
    remote function getTaReviewList(string type) returnFormat='json' {
        var personTable = new model.services.Person();
        var currentUserId = personTable.getIdFromEin(session.auth.user.employeeNumber);
        var output = [];

        if (arguments.type EQ 'yours') {
            var yourActiveEvents = new Query();
            yourActiveEvents.setSQL("
              SELECT *
              FROM   (SELECT t.tanumber,
                            t.destination,
                            tp.fk_taid AS aeid,
                            e.name,
                            Row_number()
                              over (
                                PARTITION BY tp.fk_taid
                                ORDER BY tp.created DESC nulls last ) r
                      FROM   ta t,
                            ta_processes tp,
                            workflow_processes e
                      WHERE  t.fk_userid = #currentuserid#
                            AND t.id = tp.fk_taid
                            AND tp.fk_process = e.id)
              WHERE  r = 1
            ");


            var yourActiveEventsResult = yourActiveEvents.execute();
            var actualEvent = yourActiveEventsResult.getResult();

        } else if (arguments.type EQ 'prepared') {
            var yourPreparingEvents = new Query();
            yourPreparingEvents.setSQL("
              SELECT *
              FROM   (SELECT t.tanumber,
                            t.travelername,
                            t.destination,
                            tp.fk_taid AS aeid,
                            e.name,
                            Row_number()
                              over (
                                PARTITION BY tp.fk_taid
                                ORDER BY tp.created DESC nulls last ) r
                      FROM   ta t,
                            ta_processes tp,
                            workflow_processes e
                      WHERE  t.fk_preparerid = #currentuserid#
                            AND t.id = tp.fk_taid
                            AND tp.fk_process = e.id)
              WHERE  r = 1
          ");
            var yourPreparingEventsResult = yourPreparingEvents.execute();
            var actualEvent = yourPreparingEventsResult.getResult();
        } else if (arguments.type EQ 'completed') {
            var yourCompletedEvents = new Query();
            yourCompletedEvents.setSQL("
              SELECT *
              FROM   (SELECT t.tanumber,
                            t.travelername,
                            t.destination,
                            tp.fk_taid                                AS aeid,
                            e.name,
                            Row_number()
                              over (
                                PARTITION BY tp.fk_taid
                                ORDER BY tp.created DESC nulls last ) r
                      FROM   ta t,
                            ta_processes tp,
                            workflow_processes e
                      WHERE  t.fk_preparerid = #currentuserid#
                              OR t.fk_userid = #currentuserid#
                                AND t.id = tp.fk_taid
                                AND e.id > 10)
              WHERE  r = 1
                    ");
            var yourCompletedEventsResult = yourCompletedEvents.execute();
            var actualEvent = yourCompletedEventsResult.getResult();
        }


        if (arguments.type EQ 'yours') {
            for (var i = 1; i <= actualEvent.RecordCount; i += 1) {

                output[i][0] = actualEvent["taNumber"][i];
                output[i][1] = actualEvent["name"][i];
                output[i][2] = actualEvent["destination"][i];
                if (actualEvent["name"][i] EQ 'Start TA') {
                    output[i][3] = '<button class="updateTaBtn" id="#actualEvent["aeid"][i]#">Edit</button>';
                } else {
                    output[i][3] = '<button class="viewTaBtn" id="#actualEvent["aeid"][i]#">View</button>';
                }
            }
        } else if (arguments.type EQ 'prepared') {
            for (var i = 1; i <= actualEvent.RecordCount; i += 1) {

                output[i][0] = actualEvent["taNumber"][i];
                output[i][1] = actualEvent["travelerName"][i];
                output[i][2] = actualEvent["name"][i];
                output[i][3] = actualEvent["destination"][i];
                if (actualEvent["name"][i] EQ 'Start TA') {
                    output[i][4] = '<button class="updateTaBtn" id="#actualEvent["aeid"][i]#">Edit</button>';
                } else {
                    output[i][4] = '<button class="viewTaBtn" id="#actualEvent["aeid"][i]#">View</button>';
                }
            }
        } else if (arguments.type EQ 'completed') {
            for (var i = 1; i <= actualEvent.RecordCount; i += 1) {
                var thisEvent = actualEvent["name"][i];
                if (thisEvent EQ "Completed") {
                    output[i][0] = actualEvent["taNumber"][i];
                    output[i][1] = actualEvent["travelerName"][i];
                    output[i][2] = actualEvent["name"][i];
                    output[i][3] = actualEvent["destination"][i];
                    output[i][4] = '<button class="viewTaBtn" id="#actualEvent["aeid"][i]#">View</button>';
                }
            }
        }


        jsonOutput = serializeJSON(output);
        newOutput = '{"aaData": ' & jsonOutput & '}';
        return newOutput;
    }
	*/
</cfscript>

<!---

	remote function getWorkflowData() returnFormat='json' {
		var url.workflow = "eta_workflow";
		var edocsRetrieval = new http();
		var edocsEntry = new model.services.login().getSessionKeys(
								session.auth.sessionkey,
								session.auth.sessionid);

		edocsRetrieval.setMethod("post");
		edocsRetrieval.setUrl("http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg");
		edocsRetrieval.setUsername("#session.auth.user.uid#");
		edocsRetrieval.setPassword("#edocsEntry#");
		edocsRetrieval.addParam(type="formfield",name="IdcService",value="LOAD_WORKFLOW_QUEUE");
		edocsRetrieval.addParam(type="formfield",name="IsSoap",value="1");

		var result = edocsRetrieval.send().getPrefix();
		/*writeDump(result);*/

		var arrNodes = new model.services.usefulfunctions().soapToArrayNodes(result.fileContent, "resultset");
		/*writeDump(arrNodes);*/

		var dtbArray = [];
		if (val(arrNodes[1].XmlAttributes.TotalRows) GT 0) {
			for (i = 1; i LTE arrayLen(arrNodes[1].XmlChildren); i += 1) {
				var thisdID = arrNodes[1].XmlChildren[i].XmlAttributes.dID;
				var thisdDocName = arrNodes[1].XmlChildren[i].XmlAttributes.dDocName;
				var thisTaid = new model.services.ta().getIdFromEdocsId(thisdID);
				/* writeDump(thisTaid); */
				var workflowDataTables = new model.services.workflow_processes().getDataTableInfo(thisTaid);
				dtbArray[i][0] = workflowDataTables.tanumber;
				dtbArray[i][1] = workflowDataTables.travelername;
				dtbArray[i][2] = workflowDataTables.created;
				dtbArray[i][3] = workflowDataTables.firstname & ' ' & workflowDataTables.lastname;

				if (arrNodes[1].row[i].xmlChildren[1].XmlText EQ 'Contribution') {
				dtbArray[i][4] = 'Rejected, waiting for re-submission or cancellation.';
				} else {
				dtbArray[i][4] = '<button class="workflowPdfView" onclick="workflowPdfView(#thisdID#, &quot;#thisdDocName#&quot;)">View</button>';
				}
			}
		}
		jsonOutput = serializeJSON(dtbArray);
		newOutput = '{"aaData": ' & jsonOutput & '}';
		return newOutput;
	}
--->
</cfcomponent>
