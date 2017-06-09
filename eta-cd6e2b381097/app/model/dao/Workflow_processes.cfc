<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the Workflow_processesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the Workflow_processesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getWorkflow_processes" access="public" output="false" returnType="boolean"
			hint="I return the Workflow_processes bean populated with details of a specific Workflow_processes.">
		<cfargument name="workflow_processes" required="true" type="Workflow_processes">

		<cfset var qSearch = new query()>
		<cfset var objWorkflow_processes = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM WORKFLOW_PROCESSES
			WHERE ID = <cfqueryparam value="#arguments.workflow_processes.getWorkflow_processesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the Workflow_processesId, create an instance of the Workflow_processes bean and return it. --->
			<cfset arguments.workflow_processes.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objWORKFLOW_PROCESSES>
	</cffunction>

	<cffunction name="deleteWorkflow_processesById" access="public" output="false" returnType="boolean" hint="I delete a Workflow_processes from the database.">
		<cfargument name="workflow_processesId" required="true" type="numeric"
				hint="I am the Id of the Workflow_processes you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Workflow_processes
				where Id = <cfqueryparam value="#arguments.workflow_processesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveWorkflow_processes" access="public" output="false" returnType="string"
		hint="I handle saving a Workflow_processes, either by creating a new entry or updating an existing one.">
	    <cfargument name="Workflow_processes" required="true" type="model.beans.Workflow_processes" hint="I am the Workflow_processes bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.workflow_processes)>
	        <cfset success = updateWorkflow_processes(arguments.workflow_processes)>
	    <cfelse>
	        <cfset success = createNewWorkflow_processes(arguments.workflow_processes)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateWorkflow_processes" access="public" output="false" returnType="boolean"
			hint="I update a Workflow_processess details">
			<cfargument name="workflow_processes" required="true" type="Workflow_processes" hint="I am the Workflow_processes bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE WORKFLOW_PROCESSES
						SET
							ID = <cfqueryparam value="#arguments.workflow_processes.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.workflow_processes.getName()#)>
								NAME = <cfqueryparam value="#arguments.workflow_processes.getName()#" cfsqltype="cf_sql_varchar" />
							<cfelse>
								NAME = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.workflow_processes.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Workflow_processes exists within the database, using the ID as a check.">
		<cfargument name="Workflow_processes" required="true" type="model.beans.Workflow_processes" hint="I am the Workflow_processes bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM WORKFLOW_PROCESSES
			WHERE ID = <cfqueryparam value="#arguments.Workflow_processes.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewWorkflow_processes" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="workflow_processes" required="true" type="model.beans.Workflow_processes" hint="I am the Workflow_processes bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO WORKFLOW_PROCESSES
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.workflow_processes.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.workflow_processes.getName()#)>
							<cfqueryparam value="#arguments.workflow_processes.getName()#" cfsqltype="cf_sql_varchar" />
						<cfelse>
							<cfqueryparam null="true">
						</cfif>
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