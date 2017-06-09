<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the FacilitiesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the FacilitiesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getFacilities" access="public" output="false" returnType="boolean"
			hint="I return the Facilities bean populated with details of a specific Facilities.">
		<cfargument name="facilities" required="true" type="Facilities">

		<cfset var qSearch = new query()>
		<cfset var objFacilities = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM FACILITIES
			WHERE ID = <cfqueryparam value="#arguments.facilities.getFacilitiesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the FacilitiesId, create an instance of the Facilities bean and return it. --->
			<cfset arguments.facilities.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objFACILITIES>
	</cffunction>

	<cffunction name="deleteFacilitiesById" access="public" output="false" returnType="boolean" hint="I delete a Facilities from the database.">
		<cfargument name="facilitiesId" required="true" type="numeric"
				hint="I am the Id of the Facilities you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Facilities
				where Id = <cfqueryparam value="#arguments.facilitiesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveFacilities" access="public" output="false" returnType="string"
		hint="I handle saving a Facilities, either by creating a new entry or updating an existing one.">
	    <cfargument name="Facilities" required="true" type="model.beans.Facilities" hint="I am the Facilities bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.facilities)>
	        <cfset success = updateFacilities(arguments.facilities)>
	    <cfelse>
	        <cfset success = createNewFacilities(arguments.facilities)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateFacilities" access="public" output="false" returnType="boolean"
			hint="I update a Facilitiess details">
			<cfargument name="facilities" required="true" type="Facilities" hint="I am the Facilities bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE FACILITIES
						SET
							ID = <cfqueryparam value="#arguments.facilities.getId()#" cfsqltype="cf_sql_decimal" />,
							NAME = <cfqueryparam value="#arguments.facilities.getName()#" cfsqltype="cf_sql_varchar" />
						WHERE ID = <cfqueryparam value="#arguments.facilities.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Facilities exists within the database, using the ID as a check.">
		<cfargument name="Facilities" required="true" type="model.beans.Facilities" hint="I am the Facilities bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM FACILITIES
			WHERE ID = <cfqueryparam value="#arguments.Facilities.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewFacilities" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="facilities" required="true" type="model.beans.Facilities" hint="I am the Facilities bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO FACILITIES
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.facilities.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.facilities.getName()#" cfsqltype="cf_sql_varchar" />
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