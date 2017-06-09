<cfcomponent>

	<cfset init()>

	<cffunction name="init" output="false" returnType="Logger">

		<cfreturn this>
	</cffunction>

	<cffunction name="doLog" returnType="any" output="false"
		hint="Function to write the log (not used yet)">
		<cfargument name="logBean" type="model.beans.Eta_log" required="true">


	</cffunction>

	<cffunction name="create" output="false">
		<cfargument name="eta_log" type="model.beans.Eta_log" required="true">
		<cfset var logMe = new model.services.Eta_log().save(eta_log)>

		<cfreturn logMe>
	</cffunction>

<!---
	<cffunction name="logProcess" returnType="struct" output="false">
		<cfargument name="logBean" required="true" type="model.beans.Eta_log">
		<cfset var logMe = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>
			<cfquery name="logMe" result="result">
				insert into eta_log(
						taid,
						processid,
						statusid,
						travelerid,
						preparerid,
						staffid,
						created,
						details,
						approved,
						approverid
				) values (
						<cfqueryparam value="#int(logBean.getTaid())#" cfsqltype="cf_sql_float">,
						<cfqueryparam value="#int(logBean.getProcessid())#" cfsqltype="cf_sql_float">,
						<cfqueryparam value="#int(logBean.getStatusid())#" cfsqltype="cf_sql_float">,
						<cfqueryparam value="#int(logBean.getTravelerid())#" cfsqltype="cf_sql_float">,
						<cfqueryparam value="#int(logBean.getPreparerid())#" cfsqltype="cf_sql_float">,
						<cfif logBean.getStaffid()>
							<cfqueryparam value="#int(logBean.getStaffid())#" cfsqltype="cf_sql_float">,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#logBean.getCreated()#" cfsqltype="cf_sql_timestamp">,
						<cfqueryparam value="#logBean.getDetails()#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#int(logBean.getApproved())#" cfsqltype="cf_sql_float">,
						<cfif logBean.getApproverid()>
							<cfqueryparam value="#int(logBean.getApproverid())#" cfsqltype="cf_sql_float">
						<cfelse>
							<cfqueryparam null="true">
						</cfif>
				)

			</cfquery>
				<cfset msg.id = result.ROWID>
				<cfset msg.type = "success">
				<cfset msg.text = "Record inserted successfully">
			<cfcatch>
				<cfset msg.type = "error">
				<cfset msg.text = #cfcatch.message#>
				<cfset msg.detail = #cfcatch.cause.message#>
			</cfcatch>
		</cftry>

		<cfreturn msg>
	</cffunction>
--->

	<cffunction name="OldlogProcess" output="false">
		<cfargument name="infoToLog" type="model.beans.log_process" required="true" />

		<!--- Save the process --->
		<cfset var logged = new model.services.log_process().createNewTaProcess(infoToLog)>

		<cfreturn logged>
	</cffunction>

</cfcomponent>
