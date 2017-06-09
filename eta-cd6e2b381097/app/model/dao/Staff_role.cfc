<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the Staff_roleDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the Staff_roleDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getStaff_role" access="public" output="false" returnType="boolean"
			hint="I return the Staff_role bean populated with details of a specific Staff_role.">
		<cfargument name="staff_role" required="true" type="Staff_role">

		<cfset var qSearch = new query()>
		<cfset var objStaff_role = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				DESCRIPTION
			FROM STAFF_ROLE
			WHERE ID = <cfqueryparam value="#arguments.staff_role.getStaff_roleID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the Staff_roleId, create an instance of the Staff_role bean and return it. --->
			<cfset arguments.staff_role.init(
				id = qSearch.ID,
				description = qSearch.DESCRIPTION
			)>
		</cfif>
		<cfreturn objSTAFF_ROLE>
	</cffunction>

	<cffunction name="deleteStaff_roleById" access="public" output="false" returnType="boolean" hint="I delete a Staff_role from the database.">
		<cfargument name="staff_roleId" required="true" type="numeric"
				hint="I am the Id of the Staff_role you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Staff_role
				where Id = <cfqueryparam value="#arguments.staff_roleId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveStaff_role" access="public" output="false" returnType="string"
		hint="I handle saving a Staff_role, either by creating a new entry or updating an existing one.">
	    <cfargument name="Staff_role" required="true" type="model.beans.Staff_role" hint="I am the Staff_role bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.staff_role)>
	        <cfset success = updateStaff_role(arguments.staff_role)>
	    <cfelse>
	        <cfset success = createNewStaff_role(arguments.staff_role)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateStaff_role" access="public" output="false" returnType="boolean"
			hint="I update a Staff_roles details">
			<cfargument name="staff_role" required="true" type="Staff_role" hint="I am the Staff_role bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE STAFF_ROLE
						SET
							ID = <cfqueryparam value="#arguments.staff_role.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.staff_role.getDescription()#)>
								DESCRIPTION = <cfqueryparam value="#arguments.staff_role.getDescription()#" cfsqltype="cf_sql_varchar" />
							<cfelse>
								DESCRIPTION = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.staff_role.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Staff_role exists within the database, using the ID as a check.">
		<cfargument name="Staff_role" required="true" type="model.beans.Staff_role" hint="I am the Staff_role bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM STAFF_ROLE
			WHERE ID = <cfqueryparam value="#arguments.Staff_role.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewStaff_role" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="staff_role" required="true" type="model.beans.Staff_role" hint="I am the Staff_role bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO STAFF_ROLE
					(
							ID,
							DESCRIPTION
					) VALUES (
						<cfqueryparam value="#arguments.staff_role.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.staff_role.getDescription()#)>
							<cfqueryparam value="#arguments.staff_role.getDescription()#" cfsqltype="cf_sql_varchar" />
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