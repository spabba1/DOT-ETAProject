<cfcomponent>

	<cfset init()>

	<cffunction name="init" output="false">
		<cfset staffService = new model.services.Staff().init()>

		<cfreturn this>
	</cffunction>

	<cffunction name="isAdmin" output="false" returnType="boolean"
			hint="I check if the user will be displayed the Travel Planner menu">

			<cfargument name="employeeId" type="numeric">

			<cfset var staffer = new model.beans.Staff().init(id=employeeId)>

			<cfset var isStaff = new model.dao.Staff().read(staffer)>

			<cfreturn isStaff>

	</cffunction>

	<cffunction name="getStaffById" access="remote" output="false">
		<cfargument name="staffId" required="true" type="numeric">

		<cfreturn staffService.read(staffId)>
	</cffunction>

	<cffunction name="updateStaff" output="false" access="remote">
		<cfargument name="staff" required="true">
		<cfset var staffData = deserializeJSON(staff)>

		<cfset var staffBean = new model.beans.Staff().init(argumentCollection=staffData)>

		<cfset var update = staffService.save(staffBean)>

		<cfreturn update>

	</cffunction>

	<cffunction name="getAllStaffWithJoins" access="public" output="false" returnType="query"
		hint="I run a query of all STAFF within the database table.">

		<cfset var qAllSTAFF = "">
		<cfquery name="qAllStaff">
			SELECT
				STAFF.ID
				,STAFF.FIRSTNAME
				,STAFF.LASTNAME
				,STAFF.EMAIL
				,STAFF.DATEJOINED
				,STAFF.DATELEFT
				,STAFF.OTHERDETAILS
				,STAFF_ROLE.DESCRIPTION
				,STAFF.NOTIFY
				,STAFF.USERNAME
			FROM STAFF, STAFF_ROLE
			WHERE STAFF.STAFFROLEID = STAFF_ROLE.ID
		</cfquery>
		<cfreturn qAllStaff>

	</cffunction>

	<cffunction name="getAllStaff" access="remote" output="false" returnType="array">
		<cfset var output = []>
		<cfset var i = 1>

		<cfset var staffList = getAllStaffWithJoins()>

		<cfloop query="staffList">
			<cfset output[i]['id'] = #id#>
			<cfset output[i]['name'] = #firstname# & ' ' & #lastname#>
			<cfset output[i]['staffrole'] = #description#>
			<cfset output[i]['email'] = #email#>
			<cfset output[i]['datejoined'] = #datejoined#>
			<cfset output[i]['dateleft'] = #dateleft#>
			<cfset output[i]['otherdetails'] = #otherdetails#>
			<cfset output[i]['notify'] = #notify#>

			<cfset i += 1>
		</cfloop>

		<cfreturn output>

	</cffunction>

	<cffunction name="getMailingList" output="false" returnType="array">
		<cfset var qStaffEmails = new Query()>
		<cfset var anArray = []>

		<cfquery name="qStaffEmails">
			select email from staff where notify = 'Y'
		</cfquery>

		<cfloop query="qStaffEmails">
			<cfset anArray[CurrentRow] = qStaffEmails.email>
		</cfloop>

		<cfreturn anArray>
	</cffunction>

	<cffunction name="getIdFromUsername" returnType="string" access="remote" output="false">
		<cfargument name="username" type="string" required="true">
		<cfset var idQuery = new Query()>
		<cfset var result = {}>

		<cfset var staffer = staffService.filterByUsername(arguments.username)>

		<cfreturn staffer[1].id>
	</cffunction>

</cfcomponent>
