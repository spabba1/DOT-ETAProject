<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the TrwtypesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the TrwtypesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTrwtypes" access="public" output="false" returnType="boolean"
			hint="I return the Trwtypes bean populated with details of a specific Trwtypes.">
		<cfargument name="trwtypes" required="true" type="Trwtypes">

		<cfset var qSearch = new query()>
		<cfset var objTrwtypes = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM TRWTYPES
			WHERE ID = <cfqueryparam value="#arguments.trwtypes.getTrwtypesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the TrwtypesId, create an instance of the Trwtypes bean and return it. --->
			<cfset arguments.trwtypes.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objTRWTYPES>
	</cffunction>

	<cffunction name="deleteTrwtypesById" access="public" output="false" returnType="boolean" hint="I delete a Trwtypes from the database.">
		<cfargument name="trwtypesId" required="true" type="numeric"
				hint="I am the Id of the Trwtypes you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Trwtypes
				where Id = <cfqueryparam value="#arguments.trwtypesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveTrwtypes" access="public" output="false" returnType="string"
		hint="I handle saving a Trwtypes, either by creating a new entry or updating an existing one.">
	    <cfargument name="Trwtypes" required="true" type="model.beans.Trwtypes" hint="I am the Trwtypes bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.trwtypes)>
	        <cfset success = updateTrwtypes(arguments.trwtypes)>
	    <cfelse>
	        <cfset success = createNewTrwtypes(arguments.trwtypes)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateTrwtypes" access="public" output="false" returnType="boolean"
			hint="I update a Trwtypess details">
			<cfargument name="trwtypes" required="true" type="Trwtypes" hint="I am the Trwtypes bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE TRWTYPES
						SET
							ID = <cfqueryparam value="#arguments.trwtypes.getId()#" cfsqltype="cf_sql_decimal" />,
							NAME = <cfqueryparam value="#arguments.trwtypes.getName()#" cfsqltype="cf_sql_varchar" />
						WHERE ID = <cfqueryparam value="#arguments.trwtypes.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Trwtypes exists within the database, using the ID as a check.">
		<cfargument name="Trwtypes" required="true" type="model.beans.Trwtypes" hint="I am the Trwtypes bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM TRWTYPES
			WHERE ID = <cfqueryparam value="#arguments.Trwtypes.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewTrwtypes" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="trwtypes" required="true" type="model.beans.Trwtypes" hint="I am the Trwtypes bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO TRWTYPES
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.trwtypes.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.trwtypes.getName()#" cfsqltype="cf_sql_varchar" />
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