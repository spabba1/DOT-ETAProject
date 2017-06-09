<cfcomponent>

    <!---
	<cffunction name="createNewlog_process" returnType="boolean" output="false">
        <cfargument name="log_process" type="model.beans.Logger" required="true">
		<cfset var wfInsert = new Query()>
		<cfset var result = {}>

        <cfquery name="wfInsert" result="result">
            insert into eta_log (
                fk_taid,
			   	fk_process,
			   	fk_status,
			   	fk_etauser,
			   	fk_staffid,
			   	created,
                details,
			   	approved,
			   	fk_approver
            ) VALUES (
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getTaid())#'>,
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getProcess())#'>,
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getStatus())#'>,
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getTraveler())#'>,
				<cfif len(log_process.getStaff())>
                        <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getStaff())#'>,
				<cfelse>
						<cfqueryparam null="yes">,
				</cfif>
                <cfqueryparam cfsqltype='cf_sql_timestamp' value='#log_process.getCreated()#'>,
                <cfqueryparam cfsqltype='cf_sql_varchar' value='#log_process.getDetails()#'>,
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getApproved())#'>,
                <cfqueryparam cfsqltype='cf_sql_float' value='#int(log_process.getApprover())#'>
            )
        </cfquery>

        <cfreturn true>
    </cffunction>
	--->

    <cffunction name="getTaId" returntype="numeric" output="false">
        <cfargument name="actualEventId" type="numeric" required="true">
		<cfset var retrieveTaId = new Query()>
		<cfset var result = {}>

        <cfquery name="retrieveTaId" result="result">
            select fk_taid
            from eta_log
            where id = <cfqueryparam cfsqltype="cf_sql_float" value="#arguments.actualEventId#">
        </cfquery>

        <cfreturn retrieveTaId.fk_taid>
    </cffunction>

	<cffunction name="isApproved" returnType="struct" output="false">
		<cfargument name="taid" required="true" type="numeric">
		<cfset var qApproved = new Query()>
		<cfset var result = {}>
		<cfset var approval = {}>

		<cfquery name="qApproved" result="result">
			   select *
			     from (
					select approved, details, row_number()
						over (
						partition by fk_taid
						order by created desc nulls last ) r
						from eta_log
						where fk_taid = <cfqueryparam value="#arguments.taid#" cfsqltype="cf_sql_float">)
			    where r       = 1
		</cfquery>

		<cfset approval.approved = qApproved.approved>
		<cfset approval.details = qApproved.details>

		<cfreturn approval>
	</cffunction>

	<cffunction name="getApprovedTas" access="remote" returnType="array" returnFormat="JSON" output="false">
		<cfset var approvedTas = new Query()>
		<cfset var apList = []>

		<cfquery name="approvedTas">
				SELECT tap.fk_taid,
				tap.created,
				prepare.firstname AS preparerFn,
				prepare.lastname  AS preparerLn,
				approve.firstname AS approverFn,
				approve.lastname  AS approverLn
			FROM eta_log tap
			JOIN staff PREPARE
			ON tap.fk_staffid = prepare.id
			JOIN staff approve
			ON tap.fk_approver = approve.id
			WHERE approved     = 1
		</cfquery>

		<cfloop query="approvedTas">
			<cfset var ta = new model.services.ta().getTaById(fk_taid)>
			<cfset apList[CURRENTROW]["tanumber"] = ta.getTanumber()>
			<cfset apList[CURRENTROW]["traveler"] = ta.getTravelername()>
			<cfset apList[CURRENTROW]["dateSubmitted"] = ta.getSubmitted()>
			<cfset apList[CURRENTROW]["coordinator"] = "#preparerFn# #preparerLn#">
			<cfset apList[CURRENTROW]["approver"] = "#approverFn# #approverLn#">
			<cfset apList[CURRENTROW]["approvalDate"] = ta.getCreated()>
			<cfset apList[CURRENTROW]["taid"] = fk_taid>
		</cfloop>

		<cfreturn apList>
	</cffunction>

	<cffunction name="getApprovalPath" access="remote" returnType="array" output="false">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var qPath = new Query()>
		<cfset var arrPath = []>

		<cfquery name="qPath">
			SELECT ETA_LOG.ID, WORKFLOW_PROCESSES.NAME, TA.TANUMBER,
			       ETA_LOG.APPROVERID, ETA_LOG.PREPARERID, ETA_LOG.CREATED,
                   TA.TRAVELERNAME, ETA_LOG.APPROVED, ETA_LOG.DETAILS
			  FROM ETA_LOG
			 INNER JOIN WORKFLOW_PROCESSES
			    ON WORKFLOW_PROCESSES.ID = ETA_LOG.PROCESSID
			 INNER JOIN TA
			    ON TA.ID = ETA_LOG.TAID
			 WHERE ETA_LOG.TAID = <cfqueryparam value="#taid#" cfsqltype="cf_sql_float">
			 ORDER BY ETA_LOG.ID
         </cfquery>

		<!---
		<cfquery name="qPath">
			SELECT eta_log.id, eta_log.created, eta_log.details, eta_log.approved,
			       eta_log.approverid, ta_status.description, etauser.username,
			       staff1.firstname as preparerfirst, staff1.lastname as preparerlast,
			       staff2.firstname as approverfirst, staff2.lastname as approverlast,
			       workflow_processes.name
			  FROM eta_log, ta_status, etauser, staff staff1, staff staff2,
			       workflow_processes
			 WHERE eta_log.processid  = workflow_processes.id
			   AND eta_log.travelerid = etauser.ein
			   AND eta_log.staffid    = staff1.id
			   AND eta_log.approverid = staff2.id
			   AND eta_log.statusid   = ta_status.id
			   AND eta_log.taid       = <cfqueryparam value="#taid#" cfsqltype="cf_sql_float">
			 ORDER BY eta_log.created ASC
		</cfquery>
		--->

		<cfloop query="qPath" >

            <cfset var approvalPath = new model.beans.ApprovalPath().init(
					process  = name,
					<!---status   = description,--->
                    etauser   = travelername,
                    staff    = preparerid,
                    created  = created,
                    details  = details,
                    approved = approved,
                    approver = approverid,
					taid     = #taid#
					)>

			<!---<cfset var approvalPath = new model.beans.ApprovalPath().init(
					taid       = taid,
					process  = name,
					status   = description,
					etauser   = username,
					staff    = preparerfirst & " " & preparerlast,
					created  = created,
					details  = details,
					approved = approved,
					approver = approverfirst & " " & approverlast
					)>--->

			<cfset arrPath[CurrentRow] = approvalPath>

		</cfloop>

		<cfreturn arrPath>
	</cffunction>

	<cffunction name="getRejectReason" returnType="string" output="false">
		<cfargument name="taid" required="true" type="numeric">

		<cfquery name="qReason">
			select * from (
				select details
				from eta_log
				where taid = #taid#
				order by id desc
			) where rownum = 1
		</cfquery>

		<cfreturn qReason.details>

	</cffunction>

</cfcomponent>
