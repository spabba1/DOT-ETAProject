<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
	hint="I am the Eta_logDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the Eta_logDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getEta_log" access="public" output="false" returnType="boolean"
			hint="I return the Eta_log bean populated with details of a specific Eta_log.">
		<cfargument name="eta_log" required="true" type="Eta_log">

		<cfset var qSearch = new query()>
		<cfset var objEta_log = {}>
		<cfquery name="qSearch">
			SELECT
				CREATED,
				STATUSID,
				PROCESSID,
				TAID,
				TRAVELERID,
				ID,
				STAFFID,
				APPROVED,
				DETAILS,
				APPROVERID,
				PREPARERID
			FROM ETA_LOG
			WHERE ID = <cfqueryparam value="#arguments.eta_log.getEta_logID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the Eta_logId, create an instance of the Eta_log bean and return it. --->
			<cfset arguments.eta_log.init(
				created = qSearch.CREATED,
				statusid = qSearch.STATUSID,
				processid = qSearch.PROCESSID,
				taid = qSearch.TAID,
				travelerid = qSearch.TRAVELERID,
				id = qSearch.ID,
				staffid = qSearch.STAFFID,
				approved = qSearch.APPROVED,
				details = qSearch.DETAILS,
				approverid = qSearch.APPROVERID,
				preparerid = qSearch.PREPARERID
			)>
		</cfif>
		<cfreturn objETA_LOG>
	</cffunction>

	<cffunction name="deleteEta_logById" access="public" output="false" returnType="boolean" hint="I delete a Eta_log from the database.">
		<cfargument name="eta_logId" required="true" type="numeric"
				hint="I am the Id of the Eta_log you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Eta_log
				where Id = <cfqueryparam value="#arguments.eta_logId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveEta_log" access="public" output="false" returnType="string"
		hint="I handle saving a Eta_log, either by creating a new entry or updating an existing one.">
	    <cfargument name="Eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.eta_log)>
	        <cfset success = updateEta_log(arguments.eta_log)>
	    <cfelse>
	        <cfset success = createNewEta_log(arguments.eta_log)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateEta_log" access="public" output="false" returnType="boolean"
			hint="I update a Eta_logs details">
			<cfargument name="eta_log" required="true" type="Eta_log" hint="I am the Eta_log bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE ETA_LOG
						SET
							<cfif len(#arguments.eta_log.getCreated()#)>
								CREATED = <cfqueryparam value="#arguments.eta_log.getCreated()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								CREATED = <cfqueryparam null="true">,
							</cfif>
							STATUSID = <cfqueryparam value="#arguments.eta_log.getStatusid()#" cfsqltype="cf_sql_decimal" />,
							PROCESSID = <cfqueryparam value="#arguments.eta_log.getProcessid()#" cfsqltype="cf_sql_decimal" />,
							TAID = <cfqueryparam value="#arguments.eta_log.getTaid()#" cfsqltype="cf_sql_decimal" />,
							TRAVELERID = <cfqueryparam value="#arguments.eta_log.getTravelerid()#" cfsqltype="cf_sql_decimal" />,
							ID = <cfqueryparam value="#arguments.eta_log.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif #arguments.eta_log.getStaffid()#>
								STAFFID = <cfqueryparam value="#arguments.eta_log.getStaffid()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								STAFFID = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.eta_log.getApproved()#>
								APPROVED = <cfqueryparam value="#arguments.eta_log.getApproved()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								APPROVED = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.eta_log.getDetails()#)>
								DETAILS = <cfqueryparam value="#arguments.eta_log.getDetails()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DETAILS = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.eta_log.getApproverid()#>
								APPROVERID = <cfqueryparam value="#arguments.eta_log.getApproverid()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								APPROVERID = <cfqueryparam null="true">,
							</cfif>
							PREPARERID = <cfqueryparam value="#arguments.eta_log.getPreparerid()#" cfsqltype="cf_sql_decimal" />
						WHERE ID = <cfqueryparam value="#arguments.eta_log.getId()#" cfsqltype="cf_sql_float" />
					</cfquery>
					<cfcatch type="database">
						<cftransaction action="rollback" />
						<cfreturn false />
					</cfcatch>
				</cftry>
			</cftransaction>
		<cfreturn true>
	</cffunction>

	<cffunction name="exists" access="public" output="false" returnType="boolean"
			hint="I check to see if a specific Eta_log exists within the database, using the ID as a check.">
		<cfargument name="Eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM ETA_LOG
			WHERE ID = <cfqueryparam value="#arguments.Eta_log.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewEta_log" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO ETA_LOG
					(
							CREATED,
							STATUSID,
							PROCESSID,
							TAID,
							TRAVELERID,
							ID,
							STAFFID,
							APPROVED,
							DETAILS,
							APPROVERID,
							PREPARERID
					) VALUES (
						<cfif len(#arguments.eta_log.getCreated()#)>
							<cfqueryparam value="#arguments.eta_log.getCreated()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.eta_log.getStatusid()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.eta_log.getProcessid()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.eta_log.getTaid()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.eta_log.getTravelerid()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.eta_log.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif #arguments.eta_log.getStaffid()#>
							<cfqueryparam value="#arguments.eta_log.getStaffid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.eta_log.getApproved()#>
							<cfqueryparam value="#arguments.eta_log.getApproved()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.eta_log.getDetails()#)>
							<cfqueryparam value="#arguments.eta_log.getDetails()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.eta_log.getApproverid()#>
							<cfqueryparam value="#arguments.eta_log.getApproverid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.eta_log.getPreparerid()#" cfsqltype="cf_sql_decimal" />
					)
				</cfquery>

				<cfcatch type="database">
					<cftransaction action="rollback" />
					<cfreturn false />
				</cfcatch>
			</cftry>
		</cftransaction>

		<cfreturn true>
	</cffunction>

</cfcomponent>
