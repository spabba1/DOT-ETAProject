<cfcomponent extends="model.services.CoreUtils">

	<cffunction name="getUserByUsername" access="remote" returnType="model.beans.User" output="false">
		<cfargument name="username" type="string" required="true">

		<cfset var empQuery = new Query()>
		<cfset var lastTa = {}>
		<cfset var lastUserTa = new Query()>
		<cfset var result = {}>

		<cfldap
			action="query"
			attributes="bargainingunit,uid,departmentNumber,employeeNumber,telephoneNumber,ou2,cn,ou,title,l"
			filter="uid=#username#"
			name="empQuery"
			port="389"
			scope="subtree"
			server="jnuldap.state.ak.us"
			start="ou=People,o=state.ak.us">

		<cfset var userBean = new model.beans.User(
			bu          = #empQuery.bargainingunit#,
			dept        = #empQuery.ou#,
			deptnum     = #empQuery.departmentNumber#,
			div         = #empQuery.ou2#,
			dutystation = #empQuery.l#,
			travelerid  = #empQuery.employeeNumber#,
			fullname    = #empQuery.cn#,
			phone       = #empQuery.telephoneNumber#,
			title       = #empQuery.title#,
			username    = #empQuery.uid#
		)>

		<!--- The following IF statement is for the test user ISSDTEST1 since
			it doesn't have an employee number. --->
		<cfif !len(trim(userBean.getTravelerid()))>
			<cfset userBean.setTravelerid(999999)>
		</cfif>

		<cfquery name="lastUserTa" result="result">
			SELECT homeaddress, homecity, homestate, homezip, workdays,
				   pvn, worktime
			  FROM ta
			 WHERE travelerid    = <cfqueryparam value="#userBean.getTravelerid()#" cfsqltype="CF_SQL_FLOAT">
			   AND rownum = 1
			 ORDER BY created ASC
		</cfquery>

		<cfset userBean.setAddress(#lastUserTa.homeaddress#)>
		<cfset userBean.setCity(#lastUserTa.homecity#)>
		<cfset userBean.setState(#lastUserTa.homestate#)>
		<cfset userBean.setZip(#lastUserTa.homezip#)>
		<cfset userBean.setWorkdays(#lastUserTa.workdays#)>
		<cfset userBean.setWorktime(#lastUserTa.worktime#)>
		<cfset userBean.setPvn(#lastUserTa.pvn#)>

		<cfreturn userBean>
	</cffunction>

    <cffunction name="getUserByEinForTa" access="remote" returnType="string" output="false" hint="Pulls fresh traveller information to put into a TA.  Called from javascript controller create.">
        <cfargument name="employeeNumber" type="numeric" required="yes">
        <cfset var empQuery = "">
        <cfset var data = new Query()>
        <cfldap
            action="query"
            name="data"
            attributes="uid,employeeNumber,cn,title,ou,ou2,bargainingunit,telephoneNumber,l,mail"
            start="ou=People,o=state.ak.us"
            scope="subtree"
            filter="employeeNumber=#arguments.employeeNumber#"
            server="jnuldap.state.ak.us"
            port="389">

			<cfset empQuery = queryToArray(data)>
            <cfset var doJson = serializeJSON(empQuery)>

			<cfreturn doJson>
    </cffunction>

	<cffunction name="findLdapUser" access="remote" output="false" hint="Used for typeahead, like 'get ta for someone else.'">
		<cfargument name="term" default="" type="string" hint="Search string">
		<cfset var userQuery = []>
		<cfset var data = new Query()>

		<!---
			attributes="employeeNumber,cn,ou,mail,uid,sn,givenName"
			filter="(&(ou=Transportation*)(|(givenName=*#arguments.term#*)(employeeNumber=*#arguments.term#*)(sn=*#arguments.term#*)(displayName=*#arguments.term#*)(mail=*#arguments.term#*)(&(givenName=*#arguments.term#*)(sn=*#arguments.term#*))))"
--->
		<cfldap
			action="query"
			attributes="employeeNumber,cn,ou,mail,uid,sn,givenName"
			filter="(&(ou=Transportation*)(|(givenName=*#term#*)(employeeNumber=*#term#*)(sn=*#term#*)(uid=*#term#*)(displayName=*#term#*)(mail=*#term#*)(&(givenName=*#term#*)(sn=*#term#*))))"
			name="data"
			port="389"
			scope="onelevel"
			maxrows=100
			server="jnuldap.state.ak.us"
			start="ou=People,o=state.ak.us">

			<cfset userQuery = queryToArray(data)>
			<!---<cfset var doJson = serializeJSON(userQuery)>--->
			<!---<cfreturn doJson>--->
			<cfreturn userQuery>
	</cffunction>

	<cffunction name="getEmailById" returnType="string" output="false">
		<cfargument name="personId" required="true" type="numeric">

		<cfset var ldapQuery = deserializejson(getUserByEinForTa(personId))>

		<cfreturn ldapQuery[1].mail>
	</cffunction>

	<cffunction name="checkUserExists" access="remote" returnFormat="plain" output="false">
		<cfargument name="employeeNumber" type="numeric" required="yes">
		<cfset var getUserInfo = "">

		<cfldap
			action="query"
			name="getUserInfo"
			attributes="employeeNumber"
			start="ou=People,o=state.ak.us"
			scope="subtree"
			filter="employeeNumber=#arguments.employeeNumber#"
			port="389"
			server="jnuldap.state.ak.us">

		<cfif #getUserInfo.recordcount# gt 0>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<!---<cffunction name="queryLdap">--->

		<!---<c--->

	<!---</cffunction>--->

</cfcomponent>
