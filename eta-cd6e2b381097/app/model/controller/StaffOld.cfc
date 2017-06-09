<cfcomponent displayName="Staff Service" output="false"
	hint="I am the StaffSVC Class used to interact with the Staff package.">

	<!--- Pseudo-constructor --->
	<cfset variables.instance = {
			staffDao = "",
			staffGateway = ""
			}>

	<cffunction name="init" access="public" output="false" returnType="void"
		hint="I am the constructor class for the Staff class.">

		<!--- Set the initial values of the Bean --->
		<cfset variables.instance.staffDao = new model.dao.staff()>
		<cfset variables.instance.staffGateway = new model.dao.staff()>

		<cfreturn this>
	</cffunction>

	<cffunction name="addStaff" access="remote" returnType="struct" output="false">
		<cfargument name="staff" required="true" type="string">
		<cfset staff = deserializeJSON(staff)>

		<cfset var staffBean = new model.beans.Staff().init(
			id = staff.employeenumber,
			datejoined = request.nowstamp,
			email = staff.email,
			firstname = staff.firstname,
			lastname = staff.lastname,
			notify = staff.notify.value,
			staffroleid = staff.staffrole.id,
			username = staff.username
			)>

		<cfset var createStaff = new model.dao.staff().create(staffBean)>

        <cfreturn createStaff>
	</cffunction>

    <cffunction name="getStaffById" returnType="struct" output="false" access="remote">
        <cfargument name="staffId" type="numeric" required="true">
		<cfset var qSearch = new Query()>
		<cfset var result = {}>

		<cftry>
			<cfquery name="qSearch" result="result">
				SELECT id, firstname, lastname, email, datejoined, dateleft, otherdetails,
				       username, notify, staffroleid
				  FROM staff
				 WHERE id = <cfqueryparam value="#arguments.staffId#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
            <cfset var objStaff = new model.beans.staff().init(
                id=qSearch.id,
                firstname=qSearch.firstname,
                lastname=qSearch.lastname,
                email=qSearch.email,
                datejoined=qSearch.datejoined,
                dateleft=qSearch.dateleft,
                otherdetails=qSearch.otherdetails,
                staffroleid=qSearch.staffroleid,
                username=qSearch.username,
                notify=qSearch.notify)>
			<cfcatch type="any">
				<cfset objStaff.success = false>
				<cfset objStaff.message = cfcatch>
			</cfcatch>
		</cftry>

        <cfreturn objStaff>
    </cffunction>

	<cffunction name="updateStaffMember" output="false" returnType="struct" access="remote">
		<cfargument name="staff" required="true" type="string">
		<cfset staff = deSerializeJson(staff)>
		<cfset var staffBean = new model.beans.staff().init(
				id = staff.id,
				firstname = staff.firstname,
				lastname = staff.lastname,
				email = staff.email,
				datejoined = staff.datejoined,
				dateleft = staff.dateleft,
				otherdetails = staff.otherdetails,
				notify = staff.notify,
				username = staff.username,
				staffroleid = staff.staffroleid)>

		<cfset var result = {}>
		<cfset var doUpdate = new model.dao.staff().update(staffBean)>

		<cfreturn doUpdate>
	</cffunction>

	<cffunction name="updateStaff" access="remote" returnFormat="plain" output="false">
		<cfargument name="value" type="string" required="true">
		<cfargument name="id" type="numeric" required="true">
		<cfargument name="rowId" type="numeric" required="true">
		<cfargument name="columnPosition" type="numeric" required="true">
		<cfargument name="columnId" type="numeric" required="true">
		<cfargument name="columnName" type="string" required="true">
		<cfset var qUpdate = new Query()>
		<cfset var result = {}>

		<cfquery name="qUpdate" result="result">
			update staff
			set
				<cfswitch expression="#Trim(columnName)#">
					<cfcase value="First Name">
					firstname = <cfqueryparam value="#arguments.value#" cfsqltype="CF_SQL_VARCHAR">
					</cfcase>
					<cfcase value="Last Name">
					lastname = <cfqueryparam value="#arguments.value#" cfsqltype="CF_SQL_VARCHAR">
					</cfcase>
					<cfcase value="Email Notifications">
					notify = <cfqueryparam value="#arguments.value#" cfsqltype="CF_SQL_VARCHAR">
					</cfcase>
					<cfcase value="Other Details">
					otherdetails = <cfqueryparam value="#arguments.value#" cfsqltype="CF_SQL_VARCHAR">
					</cfcase>
					<cfcase value="Username">
					username = <cfqueryparam value="#arguments.value#" cfsqltype="CF_SQL_VARCHAR">
					</cfcase>
					<cfdefaultcase>
						<cfbreak>
					</cfdefaultcase>
				</cfswitch>
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>

		<cfif NOT result.recordCount>
			<cfreturn "false">
		<cfelse>
			<cfreturn "#arguments.value#">
		</cfif>
	</cffunction>

    <cffunction name="deleteStaff" access="remote" returnType="boolean" output="false">
        <cfargument name="id" type="numeric" required="true">
		<cfset var qDelete = new Query()>
		<cfset var result = {}>
        <cfset var boolSuccess = true>

        <cfquery name="qDelete" result="result">
            delete from staff
             where id = <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfif NOT result.recordCount>
            <cfset boolSuccess = "false">
        </cfif>

        <cfreturn boolSuccess>
    </cffunction>

    <cffunction name="isAdmin" returnType="struct" output="false">
        <cfargument name="userId" required="true" type="numeric">
		<cfset var qAdmin = new Query()>
		<cfset var result = {}>
        <cfset var returnStruct = {}>

        <cfquery name="qAdmin" result="result">
			SELECT staff.id, staff_role.description
			  FROM staff staff, staff_role staff_role
			 WHERE staff.id             = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_FLOAT">
			   AND staff.staffroleid = staff_role.id
        </cfquery>

        <cfif result.recordCount>
            <cfset returnStruct.isAdmin = true>
            <cfset returnStruct.staffRole = qAdmin.description>
        <cfelse>
            <cfset returnStruct.isAdmin = false>
            <cfset returnStruct.staffRole = "User">
        </cfif>

        <cfreturn returnStruct>
    </cffunction>

	<cffunction name="getStaffList" access="remote" output="false" returnType="array">
		<cfset var output = []>
		<!---<cfset var getStaffList = new model.dao.staff().getAll()>--->
		<cfdump var="#Application#" abort>
		<cfset var getStaffList = Application.staffDao().getAll()>

		<!---<cfset var staffBean = new model.beans.staff().init(argumentCollection=staffList)>--->
		<!---<cfdump var="#staffList#" abort>--->
		<!---<cfdump var="#staffBean#" abort>--->
		<cfloop query="getStaffList">
			<cfset output[getStaffList.CurrentRow]['id'] = #id#>
			<cfset output[getStaffList.CurrentRow]['name'] = #firstname# & ' ' & #lastname#>
			<cfset output[getStaffList.CurrentRow]['staffrole'] = #description#>
			<cfset output[getStaffList.CurrentRow]['email'] = #email#>
			<cfset output[getStaffList.CurrentRow]['datejoined'] = #datejoined#>
			<cfset output[getStaffList.CurrentRow]['dateleft'] = #dateleft#>
			<cfset output[getStaffList.CurrentRow]['otherdetails'] = #otherdetails#>
			<cfset output[getStaffList.CurrentRow]['notify'] = #notify#>
		</cfloop>

		<cfreturn output>
	</cffunction>

    <!---<cffunction name="getStaffList" returnFormat="JSON" access="remote" output="false">
		<cfset var qAllStaff = new Query()>
		<cfset var result = {}>
		<cfset var output = []>

        <cfquery name="qAllStaff" result="result">
			SELECT staff.id,
				staff.firstname,
				staff.lastname,
				staff.email,
				staff.datejoined,
				staff.dateleft,
				staff.notify,
				staff.otherdetails,
				role.description,
				role.id
			FROM staff,
				staff_role role
			WHERE staff.staffroleid = role.id
        </cfquery>

		<cfloop query="qAllStaff">
			<cfset output[CURRENTROW]["id"] = qAllStaff.id>
			<cfset output[CURRENTROW]["first"] = qAllStaff.FirstName>
			<cfset output[CURRENTROW]["last"] = qAllStaff.LastName>
			<cfset output[CURRENTROW]["role"] = qAllStaff.description>
			<cfset output[CURRENTROW]["email"] = qAllStaff.notify>
			<cfset output[CURRENTROW]["other"] = qAllStaff.OtherDetails>
		</cfloop>

		[><cfloop query="qAllStaff"><]
			[><cfset output[CURRENTROW][0] = qAllStaff.id><]
			[><cfset output[CURRENTROW][1] = qAllStaff.FirstName><]
			[><cfset output[CURRENTROW][2] = qAllStaff.LastName><]
			[><cfset output[CURRENTROW][3] = qAllStaff.description><]
			[><cfset output[CURRENTROW][4] = qAllStaff.notify><]
			[><cfset output[CURRENTROW][5] = qAllStaff.OtherDetails><]
		[></cfloop><]

		[><cfset var jsonOutput = serializeJSON(output)><]
		[><cfset var newOutput = '{"aaData": ' & jsonOutput & '}'><]

        [><cfreturn newOutput><]

		<cfreturn output>
    </cffunction>--->

    <cffunction name="isStaff" returnType="boolean" output="false">
        <cfargument name="username" required="true" type="string">
		<cfset var qStaff = new Query()>
		<cfset var result = {}>

        <cfquery name="qStaff" result="result">
            select id
              from staff
             where id = <cfqueryparam value="#arguments.ein#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfif result.recordCount>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

	<cffunction name="getEmailById" returnType="string" output="false">
		<cfargument name="staffId" type="numeric" required="true">

		<cfset var getEmail = new Query()>

		<cfquery name="getEmail">
			select email
		   	from staff
			where id = <cfqueryparam value="#int(staffId)#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfreturn getEmail.email>
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


</cfcomponent>
