<cfcomponent hint="I handle the 'Approvals' functions.">

	<cffunction name="getDataTableInfo" returnType="query" output="false"
		hint="Information for 'Approvals' DataTable">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var dtInfo = new Query()>
		<cfset var result = {}>

		<cfquery name="dtInfo" result="result">
			SELECT *
			FROM
				(SELECT ta.tanumber,
					ta.travelername,
					log.processid,
					log.created,
					staff.firstname,
					staff.lastname,
					Row_number () over (partition BY log.taid order by log.created DESC nulls last) r
				FROM ta ta,
					eta_log log,
					staff staff
				WHERE log.taid = <cfqueryparam value="#arguments.taid#" cfsqltype="cf_sql_float">
					AND ta.id    = log.taid
					AND staff.id = ta.estimatorid
				)
			WHERE r = 1
		</cfquery>

		<cfreturn dtInfo>
	</cffunction>

	<cffunction name="getWorkflowData" returnType="any" access="remote" output="false">
		<cfargument name="authdata" required="true" type="string">
		<cfset var auth = new model.services.CoreUtils().decodeAuthData(authdata)>

		<cfset var url = {}>
		<cfset url.workflow = "eta_workflow">
		<cfhttp
			url = "http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method = "POST"
			username = "#auth[1]#"
			password = "#auth[2]#"
			timeout = 5000>

			<cfhttpparam type="formfield" name="IdcService" value="LOAD_WORKFLOW_QUEUE">
			<!---<cfhttpparam type="formfield" name="IsJava" value="1">--->
			<cfhttpparam type="formfield" name="IsSoap" value="1">

		</cfhttp>
		<cfif #cfhttp.Statuscode# EQ "200 OK">
			<cfset var arrNodes = new model.services.CoreUtils().soapToArrayNodes(cfhttp.fileContent, "resultset")>

			<cfset var dtbArray = []>
			<cfset var thisdID = 0>
			<cfset var thisdDocName = "">
			<cfset var thisTaid = {}>
			<cfset var thisWorkflow = request.thisWorkflowName> <!--- set in application.cfc --->
			<cfset var workflowDataTables = {}>
			<cfset var i = 0>

			<cfif val(arrNodes[1].XmlAttributes.TotalRows) GT 0>
				<cfloop from="1" to="#arrayLen(arrNodes[1].XmlChildren)#" index="i">
					<!--- Filter only this workflow items. --->
					<cfif arrNodes[1].XmlChildren[i].XmlChildren[2].XmlText NEQ thisWorkflow>
						<cfcontinue>
					</cfif>

					<cfset thisdID = arrNodes[1].XmlChildren[i].XmlAttributes.dID>
					<cfset thisdDocName = arrNodes[1].XmlChildren[i].XmlAttributes.dDocName>
					<cfset thisTaid = new model.controller.Ta().getIdFromEdocsId(thisdID)>

					<cfif len(thisTaid)>
						<cfset workflowDataTables = getDataTableInfo(thisTaid)>
					<cfelse>
						<!-- something in your workflow queue may not necessarily
							be in ETA so start the next loop -->
						<cfcontinue>
					</cfif>

					<cfset dtbArray[i]["tanumber"] = workflowDataTables.tanumber>
					<cfset dtbArray[i]["traveler"] = workflowDataTables.travelername>
					<cfset dtbArray[i]["created"] = workflowDataTables.created>
					<cfset dtbArray[i]["preparer"] = workflowDataTables.firstname & ' ' & workflowDataTables.lastname>

					<cfif arrNodes[1].row[i].xmlChildren[1].XmlText EQ 'Initial_Import'>
						<cfset dtbArray[i]["actions"] = 'Rejected, waiting for re-submission or cancellation.'>
					<cfelse>
						<cfset dtbArray[i]["actions"] = '<button data-ng-click="ApprovalsCtrl.view(#thisTaid#)">View (Accept/Reject)</button>'>
					</cfif>
				</cfloop>
			</cfif>

			<!---<cfset var jsonOutput = serializeJSON(dtbArray)>--->
			<!---<cfset var newOutput = '{"data": ' & jsonOutput & '}'>--->

		<cfelse>
			<cfthrow message="Stellent may be down!">
		</cfif>

		<cfreturn dtbArray>
	</cffunction>

	<cffunction name="approve" access="remote" returnType="struct" output="false">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="authData" required="true" type="string">

		<cfset var approve = {}>

		<cfset var auth = new model.services.CoreUtils().decodeAuthData(authData)>
		<cfset var edocsInfo = new model.controller.Ta().getEdocsInfoFromTaid(taid)>

		<cfset approve = new model.controller.Edocs().workflowApprove(
					auth[1],
					auth[2],
					edocsInfo.dID
					)>

		<cfreturn approve>
	</cffunction>

	<cffunction name="reject" access="remote" returnType="struct" output="false">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="rejectReason" required="true" type="string">
		<cfargument name="authData" required="true" type="string">

		<cfset var returnStruct = {}>

		<cftry>
			<cfset var auth = new model.services.CoreUtils().decodeAuthData(authData)>

			<cfset var edocsInfo = new model.controller.Ta().getEdocsInfoFromTaid(taid)>

				<cfset returnStruct = new model.controller.Edocs().workflowReject(
						taid,
						auth,
						edocsInfo.dID,
						rejectReason
				)>

			<!--- Logging --->

			<cfset var processid = new model.controller.Workflow_processes().getIdFromName("Rejected")>
			<cfset var statusid = new model.controller.Ta_status().getIdFromDesc("Pre-Trip")>
			<cfset var travelerid = new model.controller.Ta().getTravelerByTaid(taid)>
			<cfset var preparerid = new model.controller.Ta().getPreparerByTaid(taid)>
			<cfset var staffid = new model.controller.Staff().getIdFromUsername(auth[1])>
			<cfset var approverid = new model.controller.Staff().getIdFromUsername(auth[1])>

			<cfset var logger = new model.beans.Logger().init(
					taid = taid,
					processid = processid,
					statusid = statusid,
					travelerid = travelerid,
					preparerid = preparerid,
					staffid = staffid,
					approverid = approverid,
					details = rejectReason,
					created = request.nowstamp
				)>

			<cfset var doLog = new model.controller.Logger().logProcess(logger)>
			<cfset var sendEmail = new model.controller.mailer().rejected(
				taid,
				travelerid,
				preparerid,
				rejectReason
			)>

			<cfcatch>
				<cfset returnStruct.status = 'error'>
				<cfset returnStruct.message = #cfcatch.data.Message#>
			</cfcatch>
		</cftry>

		<cfreturn returnStruct>
	</cffunction>

</cfcomponent>
