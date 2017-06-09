<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the OnecardtypesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the OnecardtypesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getOnecardtypes" access="public" output="false" returnType="boolean"
			hint="I return the Onecardtypes bean populated with details of a specific Onecardtypes.">
		<cfargument name="onecardtypes" required="true" type="Onecardtypes">

		<cfset var qSearch = new query()>
		<cfset var objOnecardtypes = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM ONECARDTYPES
			WHERE ID = <cfqueryparam value="#arguments.onecardtypes.getOnecardtypesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the OnecardtypesId, create an instance of the Onecardtypes bean and return it. --->
			<cfset arguments.onecardtypes.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objONECARDTYPES>
	</cffunction>

	<cffunction name="deleteOnecardtypesById" access="public" output="false" returnType="boolean" hint="I delete a Onecardtypes from the database.">
		<cfargument name="onecardtypesId" required="true" type="numeric"
				hint="I am the Id of the Onecardtypes you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Onecardtypes
				where Id = <cfqueryparam value="#arguments.onecardtypesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveOnecardtypes" access="public" output="false" returnType="string"
		hint="I handle saving a Onecardtypes, either by creating a new entry or updating an existing one.">
	    <cfargument name="Onecardtypes" required="true" type="model.beans.Onecardtypes" hint="I am the Onecardtypes bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.onecardtypes)>
	        <cfset success = updateOnecardtypes(arguments.onecardtypes)>
	    <cfelse>
	        <cfset success = createNewOnecardtypes(arguments.onecardtypes)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateOnecardtypes" access="public" output="false" returnType="boolean"
			hint="I update a Onecardtypess details">
			<cfargument name="onecardtypes" required="true" type="Onecardtypes" hint="I am the Onecardtypes bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE ONECARDTYPES
						SET
							ID = <cfqueryparam value="#arguments.onecardtypes.getId()#" cfsqltype="cf_sql_decimal" />,
							NAME = <cfqueryparam value="#arguments.onecardtypes.getName()#" cfsqltype="cf_sql_varchar" />
						WHERE ID = <cfqueryparam value="#arguments.onecardtypes.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Onecardtypes exists within the database, using the ID as a check.">
		<cfargument name="Onecardtypes" required="true" type="model.beans.Onecardtypes" hint="I am the Onecardtypes bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM ONECARDTYPES
			WHERE ID = <cfqueryparam value="#arguments.Onecardtypes.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewOnecardtypes" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="onecardtypes" required="true" type="model.beans.Onecardtypes" hint="I am the Onecardtypes bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO ONECARDTYPES
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.onecardtypes.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.onecardtypes.getName()#" cfsqltype="cf_sql_varchar" />
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