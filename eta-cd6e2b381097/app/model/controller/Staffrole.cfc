<cfcomponent hint="I am the Staff Role controller." extends="model.services.CoreUtils">

    <cfset init()>

    <cffunction name="init" output="false">
        <cfset variables.staffroleService = new model.services.Staffrole().init()>

        <cfreturn this>
    </cffunction>

	<cffunction name="getAll" access="remote">
		<cfreturn queryToArray(variables.staffroleService.getAllStaff_role())>
	</cffunction>

    <cffunction name="getStaffRoles" access="remote" returntype="struct" returnFormat="json" output="false">

        <cfset var qStaffRoles = new Query()>
        <cfset var output = []>
        <cfset var result = []>

        <cfquery name="qStaffRoles" result="result">
            SELECT ID, DESCRIPTION
              FROM STAFF_ROLE
             ORDER BY ID ASC
        </cfquery>

        <!---<cfloop query="qStaffRoles">
            <cfset output[qStaffRoles.CurrentRow]['value'] = #id#>
            <cfset output[qStaffRoles.CurrentRow]['name'] = #description#>
        </cfloop>--->

        <!---<cfreturn output>--->
        <cfdump var="#result#">
        <cfdump var="#qStaffRoles#" abort>
        <cfreturn qStaffRoles>
    </cffunction>

	<cffunction name="getFakeStaffRoles" access="remote" returnType="query" returnFormat="json" output="false">

		<cfset var expected = QueryNew("name, value", "varchar, integer")>

		<cfset QueryAddRow(expected)>
		<cfset QuerySetCell(expected, "value", 1)>
		<cfset QuerySetCell(expected, "name", "Travel Planner")>
		<cfset QueryAddRow(expected)>
		<cfset QuerySetCell(expected, "value", 2)>
		<cfset QuerySetCell(expected, "name", "Divisional Approver")>
		<cfset QueryAddRow(expected)>
		<cfset QuerySetCell(expected, "value", 3)>
		<cfset QuerySetCell(expected, "name", "Departmental Approver")>

		<cfreturn expected>
	</cffunction>

</cfcomponent>
