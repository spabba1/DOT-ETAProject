<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the Ta_statusDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the Ta_statusDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTa_status" access="public" output="false" returnType="boolean"
			hint="I return the Ta_status bean populated with details of a specific Ta_status.">
		<cfargument name="ta_status" required="true" type="Ta_status">

		<cfset var qSearch = new query()>
		<cfset var objTa_status = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				DESCRIPTION
			FROM TA_STATUS
			WHERE ID = <cfqueryparam value="#arguments.ta_status.getTa_statusID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the Ta_statusId, create an instance of the Ta_status bean and return it. --->
			<cfset arguments.ta_status.init(
				id = qSearch.ID,
				description = qSearch.DESCRIPTION
			)>
		</cfif>
		<cfreturn objTA_STATUS>
	</cffunction>

	<cffunction name="deleteTa_statusById" access="public" output="false" returnType="boolean" hint="I delete a Ta_status from the database.">
		<cfargument name="ta_statusId" required="true" type="numeric"
				hint="I am the Id of the Ta_status you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Ta_status
				where Id = <cfqueryparam value="#arguments.ta_statusId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveTa_status" access="public" output="false" returnType="string"
		hint="I handle saving a Ta_status, either by creating a new entry or updating an existing one.">
	    <cfargument name="Ta_status" required="true" type="model.beans.Ta_status" hint="I am the Ta_status bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.ta_status)>
	        <cfset success = updateTa_status(arguments.ta_status)>
	    <cfelse>
	        <cfset success = createNewTa_status(arguments.ta_status)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateTa_status" access="public" output="false" returnType="boolean"
			hint="I update a Ta_statuss details">
			<cfargument name="ta_status" required="true" type="Ta_status" hint="I am the Ta_status bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE TA_STATUS
						SET
							ID = <cfqueryparam value="#arguments.ta_status.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.ta_status.getDescription()#)>
								DESCRIPTION = <cfqueryparam value="#arguments.ta_status.getDescription()#" cfsqltype="cf_sql_varchar" />
							<cfelse>
								DESCRIPTION = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.ta_status.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Ta_status exists within the database, using the ID as a check.">
		<cfargument name="Ta_status" required="true" type="model.beans.Ta_status" hint="I am the Ta_status bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM TA_STATUS
			WHERE ID = <cfqueryparam value="#arguments.Ta_status.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewTa_status" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="ta_status" required="true" type="model.beans.Ta_status" hint="I am the Ta_status bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO TA_STATUS
					(
							ID,
							DESCRIPTION
					) VALUES (
						<cfqueryparam value="#arguments.ta_status.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.ta_status.getDescription()#)>
							<cfqueryparam value="#arguments.ta_status.getDescription()#" cfsqltype="cf_sql_varchar" />
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