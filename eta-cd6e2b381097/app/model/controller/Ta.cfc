<cfcomponent accessors="true">

	<cfset init()>

	<cffunction name="init" output="false" returnType="Ta">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTaByTaid" access="remote" output="false" returnType="model.beans.Ta">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var thisTa = new model.services.Ta().read(taid)>

		<!---<cfset thisTa.setDepartureDate(new model.services.CoreUtils().toDatepickerConvert(thisTa.getDepartureDate()))>--->
		<!---<cfset thisTa.setReturnDate(new model.services.CoreUtils().toDatepickerConvert(thisTa.getReturnDate()))>--->
		<!---<cfset ta.setDepartureDate(DateFormat(ta.getDepartureDate(), 'mm/dd/yyyy'))>--->
		<!---<cfset ta.setReturnDate(DateFormat(ta.getDepartureDate(), 'mm/dd/yyyy'))>--->

		<cfreturn thisTa>
	</cffunction>

	<cffunction name="getIdFromRowid" output="false" returnType="numeric">
		<cfargument name="rowid" required="true" type="string">
		<cfset var getTaid = new Query()>
		<cfset var result = {}>

		<cfquery name="getTaid" result="result">
			select id
			from ta
			where ROWID = <cfqueryparam value="#arguments.rowid#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfreturn getTaid.id>
	</cffunction>

	<cffunction name="getIdFromEdocsId" access="remote" output="false" returnType="numeric">
		<cfargument name="dID" type="numeric" required="true">
		<cfset var idQuery = new Query()>
		<cfset var result = {}>

		<cfquery name="idQuery" result="result">
			select id
			from TA
			where edocsid = <cfqueryparam value="#arguments.dID#">
		</cfquery>

		<cfreturn idQuery.id>
	</cffunction>

	<cffunction name="getTravelerByTaid" returnType="numeric" output="false"
			hint="Get the travelers ID (EIN)">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var getEin = new Query()>

		<cfquery name="getEin">
			select travelerid
		   	from ta
		   	where id = <cfqueryparam value="#taid#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfreturn getEin.travelerid>
	</cffunction>

	<cffunction name="getPreparerByTaid" returnType="numeric" output="false"
			hint="Get the Staffer who estimated the TA's ID (EIN)">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var getEin = new Query()>

		<cfquery name="getEin">
			select preparerid
		   	from ta
		   	where id = <cfqueryparam value="#taid#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfreturn getEin.preparerid>
	</cffunction>

	<cffunction name="getEdocsInfoFromTaid" returnType="struct" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var returnStruct = {}>
		<cfset var didQuery = new Query()>
		<cfset var result = {}>

		<cfquery name="didQuery" result="result">
			select edocsid, edocsname
			from ta
			where id = <cfqueryparam value="#arguments.taid#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfset returnStruct.dID = didQuery.edocsid>
		<cfset returnStruct.dDocName = didQuery.edocsname>

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="getTaReviewList" access="remote" output="false" returnFormat="json" returnType="array">
		<cfargument name="username" required="true" type="string">
		<cfargument name="type" required="true" type="string">

		<cfset var result = {}>
		<cfset var output = []>

		<cfif arguments.type EQ "yours">
			<cfset var yourActiveEvents = new Query()>

			<cfquery name="yourActiveEvents" result="result">
				select ta.id, ta.tanumber, ta.destinationto, workflow_processes.name
				  from ta, etauser, workflow_processes
				 where etauser.username       = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
				   and etauser.ein            = ta.travelerid
				   and workflow_processes.id = ta.processid
				   and ta.processid BETWEEN 1 and 11
			</cfquery>

			<cfloop query="yourActiveEvents">
				<cfset output[yourActiveEvents.CurrentRow]["id"] = #id#>
				<cfset output[yourActiveEvents.CurrentRow]["tanumber"] = #tanumber#>
				<cfset output[yourActiveEvents.CurrentRow]["status"] = #name#>
				<cfset output[yourActiveEvents.CurrentRow]["destination"] = #destinationto#>
				<cfset output[yourActiveEvents.CurrentRow]["actions"] = #id#>
			</cfloop>

		<cfelseif arguments.type EQ "prepared">
			<cfset var yourPreparingEvents = new Query()>
			<cfquery name="yourPreparingEvents" result="result">
				select ta.id, ta.tanumber, ta.destinationto, ta.travelername,
				       workflow_processes.name
				  from ta, etauser, workflow_processes
				 where etauser.username       = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
				   and etauser.ein            = ta.preparerid
				   and workflow_processes.id = ta.processid
			</cfquery>

			<cfloop query="yourPreparingEvents">
				<cfset output[yourPreparingEvents.CurrentRow]["DT_RowId"] = #id#>
				<cfset output[yourPreparingEvents.CurrentRow]["tanumber"] = #tanumber#>
				<cfset output[yourPreparingEvents.CurrentRow]["traveler"] = #travelerName#>
				<cfset output[yourPreparingEvents.CurrentRow]["status"] = #name#>
				<cfset output[yourPreparingEvents.CurrentRow]["destination"] = #destinationto#>
				<cfset output[yourPreparingEvents.CurrentRow]["actions"] = #id#>
			</cfloop>

		<cfelseif arguments.type EQ "completed">
			<cfset var yourCompletedEvents = new Query()>
			<cfquery name="yourCompletedEvents" result="result">
				select ta.id, ta.tanumber, ta.destinationto, workflow_processes.name
				  from ta, etauser, workflow_processes
				 where etauser.username       = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
				   and etauser.ein            = ta.travelerid
				   and workflow_processes.id = ta.processid
			</cfquery>

			<cfloop query="yourCompletedEvents">
				<cfif #name# EQ "Completed">
					<cfset output[yourCompletedEvents.CurrentRow]["DT_RowId"] = #id#>
					<cfset output[yourCompletedEvents.CurrentRow]["tanumber"] = #tanumber#>
					<cfset output[yourCompletedEvents.CurrentRow]["traveler"] = #travelername#>
					<cfset output[yourCompletedEvents.CurrentRow]["status"] = #name#>
					<cfset output[yourCompletedEvents.CurrentRow]["destination"] = #destinationto#>
					<cfset output[yourCompletedEvents.CurrentRow]["actions"] = #id#>
				</cfif>
			</cfloop>
		</cfif>

		<cfreturn output>
	</cffunction>

	<cffunction name="getTasInEstimation" access="remote" output="false" returnType="array">
		<cfset var processID = new model.controller.Workflow_processes().getIdFromName("Travel Envelope Preparation")>
		<cfset var qEvent = new Query()>
		<cfset var result = {}>
		<cfset var output = []>

		<cfquery name="qEvent" result="result">
				SELECT ta.id AS taid, ta.tanumber, ta.travelername, ta.bu, ta.destination,
				ta.submitted, workflow_processes.name, workflow_processes.id AS wpid
				FROM ta, workflow_processes
				WHERE ta.processid BETWEEN 2 AND 7 AND
				workflow_processes.id = ta.processid
		</cfquery>

		<!---
		<cfquery name="qEvent" result="result">
			   SELECT *
			     FROM (
					SELECT ta.tanumber, ta.bu, ta.travelername, ta.destinationto, ta.submitted,
							workflow_processes.name, workflow_processes.id AS eventId, ta.id AS tid,
							eta_log.id AS aeid, eta_log.details, ta_status.description,
							Row_number()
						over (
						PARTITION BY eta_log.taid
						ORDER BY eta_log.created DESC nulls last ) r
						FROM ta, eta_log, ta_status, workflow_processes
						WHERE workflow_processes.id = eta_log.processid
						AND eta_log.taid          = ta.id
						AND ta.processid > 1)
			    WHERE r                     = 1
		</cfquery>
		--->

		<cfloop query="qEvent">
			<cfset var rejected = false>
			<cfif #name# EQ "Waiting for Div Approval">
				<cfset var waitingForApproval = 1>
			<cfelseif #wpid# GTE processID>
				<cfset var waitingForApproval = 0>
				<cfset var approved = 1>
			<cfelseif #name# EQ "Rejected">
				<cfset var waitingForApproval = 0>
				<cfset var approved = 0>
				<cfset rejected = 1>
			<cfelse>
				<cfset var waitingForApproval = 0>
				<cfset var approved = 0>
			</cfif>

			<cfset var taToGet = #taid#>
			<cfset output[qEvent.CurrentRow]['id'] = #taid#>
			<cfset output[qEvent.CurrentRow]['tanumber'] = #taNumber#>
			<cfset output[qEvent.CurrentRow]['traveler'] = #travelerName#>
			<cfset output[qEvent.CurrentRow]['bu'] = #bu#>
			<cfset output[qEvent.CurrentRow]['destination'] = #destination#>
			<cfset output[qEvent.CurrentRow]['submitted'] = #DateFormat(submitted, "short")#>

			<cfif waitingForApproval>
				<cfset output[qEvent.CurrentRow]['actions'] = '<button class="viewTaBtn">View</button> <span class="waiting-for-approval">Waiting for Approval</span>'>
			<cfelseif approved>
				<cfset output[qEvent.CurrentRow]['actions'] = '<span><a href="&##35;&##47;approved&##47;#taid#">Approved</span>'>
			<cfelseif rejected>
				<cfset var rejectReason = new model.controller.Eta_log().getRejectReason(taid)>
				<cfset output[qEvent.CurrentRow]['actions'] = '<a type="button" class="btn btn-default" href="&##35;&##47;estimate&##47;#taid#">Estimate/Send for Re-approval</a>&nbsp;<span class="rejected-text" data-ng-click="ToEstimateCtrl.openRejectReason(#taid#)">Rejected</span>'>

			<cfelse>
				<cfset output[qEvent.CurrentRow]['actions'] = '<a type="button" class="btn btn-default" href="&##35;&##47;estimate&##47;#taid#">Estimate/Send for Approval</a>'>
			</cfif>
		</cfloop>

		<cfreturn output>
	</cffunction>

	<cffunction name="getRejectReason" output="false" access="remote" returnType="string">
		<cfargument name="taid" required="true" type="numeric">
		<cfset var reason = new model.dao.Ta().getRejectReason(taid)>
		<cfreturn reason>
	</cffunction>

	<cffunction name="checkIfEstimatorIsEmpty" output="false" returnType="boolean">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="estimator" required="true" type="string">

		<cfset var estimatorSet = false>

		<cfset var ta = getTaByTaid(taid)>
		<cfif ta.getEstimatorID() EQ "">
			<cfset var estimatorid = new model.services.staff().getIdFromUsername(estimator)>
			<cfset var setEstimator = setEstimator(ta, estimatorid)>
			<cfset estimatorSet = true>
		</cfif>

		<cfreturn estimatorSet>
	</cffunction>

	<cffunction name="setEstimator" output="false" returnType="boolean"
			hint="Sets the logged in staff-user as the'preparer' when they click 'Estimate'">
		<cfargument name="ta" required="true" type="model.beans.Ta" hint="The current TA">
		<cfargument name="authUser" required="true" type="numeric" hint="The logged in staff user">

		<cfset var qUpdatePreparer = new Query()>
		<cfset var result = {}>
		<cfset var boolSuccess = false>

		<cfquery name="qUpdatePreparer" result="result">
			UPDATE ta
			   SET estimatorid = <cfqueryparam value="#authUser#" cfsqltype="cf_sql_float">
			 WHERE id        = <cfqueryparam value="#ta.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif result.recordCount>
			<cfset boolSuccess = 1>
		</cfif>

		<cfreturn boolSuccess>
	</cffunction>

	<cffunction name="getCurrentFiscalYear" returnType="numeric" output="false">
		<cfset var date = Now()>
		<cfset var thisYear = datePart("yyyy", date)>
		<cfset var thisMonth = datePart("m", date)>
		<cfset var qLastTaNum = new Query()>
		<cfif thisMonth GTE 7>
			<cfset thisYear = thisYear + 1>
		</cfif>

		<cfset var fiscalYear = int(thisYear)>

		<cfreturn fiscalYear>
	</cffunction>

	<cffunction name="makeNextTaNumber" returnType="string" output="false">
		<cfset var fiscalYear = getCurrentFiscalYear()>
		<cfset var qLastTaNum = new Query()>

		<cfquery name="qLastTaNum">
			SELECT tanumber
			FROM ta
			WHERE fiscalyear = <cfqueryparam value="#fiscalYear#" cfsqltype="CF_SQL_FLOAT" maxlength="4">
				AND tanumber IS NOT NULL
				ORDER BY tanumber DESC
			</cfquery>

			<cfif NOT qLastTaNum.recordCount>
				<cfset var taNum = 1>
				<cfelse>
				<cfset var lastTaNumFull = qLastTaNum.tanumber>
				<cfset var lastTaNum = lastTaNumFull.split("-")[3]>
				<cfset var taNum = lastTaNum + 1>
			</cfif>

			<cfset taNum = numberFormat(taNum, "00000")>
			<cfset var taNumber = "25-" & fiscalYear & "-" & taNum>

			<cfreturn taNumber>
		</cffunction>

	<cffunction name="updateTa" output="false" returnType="struct">
		<cfargument name="ta" required="true" type="model.beans.Ta">

		<cfset var qUpdate = new Query()>

		<cfset var result = {}>
		<cfset var boolSuccess = 1>
		<cfset var returnStruct = {}>
		<cftry>
			<cfset var doUpdate = new model.dao.Ta().update(ta)>

			<cfset returnStruct.text = "TA updated successfully.">
			<cfset returnStruct.type = "success">

		<cfcatch>
			<cfset returnStruct.text = "An error has occured, this TA was not updated.">
			<cfset returnStruct.type = "danger">
			<cfmail to="#request.developerEmail#"
				from="#request.systemEmail#"
				subject="taService.updateTa Error"
				server="#request.mailServer#"
				type="html">
				<cfdump var="#cfcatch#" label="CFCATCH">
				</cfmail>
			</cfcatch>
		</cftry>

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="isOutOfState" returnType="boolean" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var checkOutOfState = new Query()>
		<cfset var result = {}>

		<cfquery name="checkOutOfState" result="result">
			SELECT instate
			FROM ta
			WHERE id = <cfqueryparam value="#taid#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>

			<cfif checkOutOfState.instate EQ 0>
				<cfreturn true>
				<cfelse>
				<cfreturn false>
			</cfif>
		</cffunction>

	<cffunction name="getTaBean" access="remote" output="false" returnType="model.beans.Ta">
		<cfset var taBean = new model.beans.Ta().init()>
		<cfreturn taBean>
	</cffunction>

	<cffunction name="save" access="remote" output="false" returnType="struct"
			hint="Called from $scope.save in angular controller TaFormCtrl when
			'Save Ta' is clicked from ta.create">

		<cfargument name="ta" required="true" type="string">
		<cfargument name="ooState" required="false" type="string" default="">
		<cfargument name="submit" required="false" default="false">

		<cfset var returnStruct = {}>
		<cfset var EtauserCtrl = new model.controller.Etauser()>

		<cfif arguments.submit>
			<cfset var workflowProcessId = new model.controller.Workflow_processes().getIdFromName("Sent to Travel Planner")>
		<cfelse>
			<cfset var workflowProcessId = new model.controller.Workflow_processes().getIdFromName("Start TA")>
		</cfif>

		<cfset var statusId = new model.controller.Ta_status().getIdFromDesc("Pre-Trip")>

		<cfset ta = deSerializeJson(ta)>

		<cfset var taBean = new model.beans.Ta().init(argumentCollection=ta)>

		<!--- Check if the traveller exists in ETA database --->
		<cfset var traveler = new model.beans.Etauser().init(ein=ta.travelerid)>
		<cfset var travelerExists = new model.services.Etauser().read(traveler)>

		<!--- Get ID if exists --->
		<cfif travelerExists>
			<cfset var travelerid = traveler.getEin()>
			<!--- or create the user --->
		<cfelse>
			<cfset var newTraveler = EtauserCtrl.save(traveler)>
			<cfset var travelerid = newTraveler.getEin()>
		</cfif>

		<cfset taBean.setTravelerid(travelerid)>
		<cfset taBean.setProcessid(workflowProcessId)>

		<cfif NOT taBean.getMileagerate()>
			<cfset taBean.setMileageRate(new model.controller.Mileagerate().getLatest())>
		</cfif>

		<cfset var nowStamp = CreateODBCDateTime(now())>

		<!--- make the dates compatible --->
		<cfif len(taBean.getDepartureDate())>
			<cfset taBean.setDepartureDate(new model.services.CoreUtils().fromDatepickerConvert(taBean.getDepartureDate()))>
		</cfif>

		<cfif len(taBean.getReturnDate())>
			<cfset taBean.setReturnDate(new model.services.CoreUtils().fromDatepickerConvert(taBean.getReturnDate()))>
		</cfif>

		<cfset var preparerId = new model.controller.Etauser().getEinByUsername(ta.preparer)>

		<cftry>
			<cftransaction action="begin">

				<cfif arguments.submit>
					<cfset var taNumber = makeNextTaNumber()>

					<cfset taBean.setTanumber(taNumber)>
					<cfset taBean.setFiscalYear(getCurrentFiscalYear())>
					<cfset taBean.setSubmitted(nowStamp)>
					<cfset taBean.setIsSubmitted(1)>
				<cfelse>
					<cfset taBean.setIsSubmitted(0)>
				</cfif>


				<cfset taBean.setpreparerId(preparerId)>
				<cfset taBean.setCreated(nowStamp)>

				<cfif taBean.getId() EQ 0>
					<cfset var thisTa = new model.services.Ta().save(taBean)>
					<cfif NOT len(thisTa)>
						<cfthrow message="An error occured while saving TA" detail="thisTa.RESULT.RootCause">
					</cfif>
				<cfelse>
					<cfset var thisTa = new model.services.Ta().save(taBean)>
					<cfif NOT len(thisTa)>
						<cfthrow message="An error occured while updating TA" detail="thisTa.RESULT.RootCause">
					</cfif>
				</cfif>


				<cfif NOT taBean.getInstate()>
					<cfset ooState = deSerializeJson(ooState)>
					<cfset ooState.taid = taBean.getId()>
					<cfset var ooStateBean = new model.beans.Oostate().init(argumentCollection=ooState)>
					<cftransaction action="setsavepoint" savepoint="beforeCreateOoState">
						<cfif arguments.submit>
							<cfset var createOoState = new model.services.Oostate().save(ooStateBean)>
						<cfelse>
							<cfset var updateOoState = new model.services.Oostate().save(ooStateBean)>
						</cfif>
					</cftransaction>
				</cfif>



				<cftransaction action="setsavepoint" savepoint="beforeLog">
					<cfset var logBean = new model.beans.Eta_log().init(
							taid = taBean.getId(),
							processid = workflowProcessId,
							statusid = statusid,
							travelerid = taBean.getTravelerId(),
							preparerid = taBean.getPreparerId(),
							created = nowstamp
							)>

					<cfset var isStaff = new model.controller.Staff().isAdmin(preparerId)>

					<cfif isStaff>
						<cfset logBean.setStaffid(preparerId)>
					</cfif>

					<cfset var doLog = new model.controller.Logger().create(logBean)>
					<cfif doLog.type EQ 'error'>
						<cfthrow message="#doLog.detail#" />
					</cfif>

				</cftransaction>

				<cftransaction action="commit" />

			</cftransaction>
			<cfif arguments.submit>
				<cfset var mailer = new model.controller.Mailer().send(taBean)>
			</cfif>

			<cfset returnStruct.success = true>

			<cfcatch type="any">
				<cfset returnStruct.success = false>
				<cfset returnStruct.errorMsg = #cfcatch#>
			</cfcatch>
		</cftry>

		<cfreturn returnStruct>
	</cffunction>

<!--- TA Deleting --->

    <cffunction name="recycle" access="remote" output="false"
            returnType="struct" returnFormat="json"
		   	hint="Flag TA's as deleted">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="deletor" required="true" type="string">
		<cfargument name="status" required="true" type="string">

		<cfset var timeIsNow = CreateODBCDateTime(now())>
		<cfset var returnStruct = {}>
		<cfset var updateTaQuery = new Query()>
		<cfset var result = {}>

		<cfset var deletorId = new model.controller.Etauser().getEinByUsername(deletor)>
		<cfset var statusId = new model.controller.Ta_status().getIdFromDesc(status)>
		<cfset var travelerId = new model.controller.Ta().getTravelerByTaid(taid)>

		<cftry>
			<cftransaction>

				<cfquery name="updateTaQuery" result="result">
					UPDATE ta
					   SET deleted   = <cfqueryparam value="#timeIsNow#" cfsqltype="CF_SQL_TIMESTAMP">,
					       processid = 0
					 WHERE id        = <cfqueryparam value="#taid#" cfsqltype="CF_SQL_FLOAT">
				</cfquery>

				<cftransaction action="setsavepoint" savepoint="after ta update" />

					<cfif result.recordcount>

						<cfset var logBean = new model.beans.Logger()>
						<cfset logBean.setTaid(taid)>
						<cfset logBean.setProcessid(0)>
						<cfset logBean.setStatusid(statusId)>
						<cfset logBean.setTravelerid(travelerId)>
						<cfset logBean.setPreparerid(deletorId)>
						<cfset logBean.setCreated(timeIsNow)>

						<cfset var logProcess = new model.services.logger()>
						<cfset var doLog = logProcess.logProcess(logBean)>
					</cfif>

					<cftransaction action="setsavepoint" savepoint="after writing log">

					<cftransaction action="commit">

				</cftransaction>
				<cfset returnStruct.text = "Record deleted successfully.">
				<cfset returnStruct.type = "success">
			<cfcatch>
				<cfset returnStruct.text = "An error has occured, the record was not deleted.">
				<cfset returnStruct.type = "error">
				<cfset returnStruct.result = #cfcatch#>
			</cfcatch>
		</cftry>

		<cfreturn returnStruct>
	</cffunction>

    <cffunction name="getDeleted" access="remote" output="false"
            returnType="array" hint="Get the list of TA's labelled 'Deleted'">
		<cfset var output = []>
		<cfset var doQuery = new Query()>
		<cfset var result = {}>

		<cfquery name="doQuery" result="result">
			select distinct ta.id, ta.tanumber, ta.travelername, etauser.username
			  from ta ta, etauser etauser, eta_log logger
			 where ta.processid      = 0
			   and ta.id             = logger.taid
			   and logger.preparerid = etauser.ein
		</cfquery>

		<cfloop query="doQuery">
			<cfset output[doQuery.CurrentRow]['id'] = #id#>
			<cfset output[doQuery.CurrentRow]['tanumber'] = #tanumber#>
			<cfset output[doQuery.CurrentRow]['travelername'] = #travelername#>
			<cfset output[doQuery.CurrentRow]['username'] = #username#>
		</cfloop>

		<cfreturn output>
	</cffunction>

	<cffunction name="permDelete" access="remote" output="false"
            returnType="struct" hint="Permanently delete TA's and their children">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var qDelete = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>
		<cftry>
			<cfquery name="qDelete" result="result">
				delete from ta where id = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfset msg.text = "TA Deleted Successfully.">
			<cfset msg.id = "success">
			<cfcatch type="any">
				<cfset msg.text = "An error has occured, the record was not deleted.">
				<cfset msg.id = "error">
				<cfset msg.details = "#cfcatch#">
			</cfcatch>
		</cftry>
		<cfreturn msg>
	</cffunction>

</cfcomponent>
