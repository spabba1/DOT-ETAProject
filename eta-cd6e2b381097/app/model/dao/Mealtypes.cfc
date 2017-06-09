<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the MealtypesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the MealtypesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getMealtypes" access="public" output="false" returnType="boolean"
			hint="I return the Mealtypes bean populated with details of a specific Mealtypes.">
		<cfargument name="mealtypes" required="true" type="Mealtypes">

		<cfset var qSearch = new query()>
		<cfset var objMealtypes = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM MEALTYPES
			WHERE ID = <cfqueryparam value="#arguments.mealtypes.getMealtypesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the MealtypesId, create an instance of the Mealtypes bean and return it. --->
			<cfset arguments.mealtypes.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objMEALTYPES>
	</cffunction>

	<cffunction name="deleteMealtypesById" access="public" output="false" returnType="boolean" hint="I delete a Mealtypes from the database.">
		<cfargument name="mealtypesId" required="true" type="numeric"
				hint="I am the Id of the Mealtypes you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Mealtypes
				where Id = <cfqueryparam value="#arguments.mealtypesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveMealtypes" access="public" output="false" returnType="string"
		hint="I handle saving a Mealtypes, either by creating a new entry or updating an existing one.">
	    <cfargument name="Mealtypes" required="true" type="model.beans.Mealtypes" hint="I am the Mealtypes bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.mealtypes)>
	        <cfset success = updateMealtypes(arguments.mealtypes)>
	    <cfelse>
	        <cfset success = createNewMealtypes(arguments.mealtypes)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateMealtypes" access="public" output="false" returnType="boolean"
			hint="I update a Mealtypess details">
			<cfargument name="mealtypes" required="true" type="Mealtypes" hint="I am the Mealtypes bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE MEALTYPES
						SET
							ID = <cfqueryparam value="#arguments.mealtypes.getId()#" cfsqltype="cf_sql_decimal" />,
							NAME = <cfqueryparam value="#arguments.mealtypes.getName()#" cfsqltype="cf_sql_varchar" />
						WHERE ID = <cfqueryparam value="#arguments.mealtypes.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Mealtypes exists within the database, using the ID as a check.">
		<cfargument name="Mealtypes" required="true" type="model.beans.Mealtypes" hint="I am the Mealtypes bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM MEALTYPES
			WHERE ID = <cfqueryparam value="#arguments.Mealtypes.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewMealtypes" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="mealtypes" required="true" type="model.beans.Mealtypes" hint="I am the Mealtypes bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO MEALTYPES
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.mealtypes.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.mealtypes.getName()#" cfsqltype="cf_sql_varchar" />
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