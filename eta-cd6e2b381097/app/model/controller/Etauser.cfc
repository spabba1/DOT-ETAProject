<cfcomponent hint="I am the Etauser controller.">

	<cfset init()>

	<cffunction name="init" output="false">
		<cfset variables.Etauser = new model.services.Etauser().init()>

		<cfreturn this>
	</cffunction>

    <cffunction name="addLoginUser" output="false" returnType="any">
        <cfargument name="etauserBean" required="true" type="query">

		<cfset var Etauser = new model.beans.Etauser().init(
			username = etauserBean.UID,
			ein = etauserBean.EMPLOYEENUMBER,
			didlogin = true
		)>

		<cfset userAdded = variables.Etauser.save(Etauser)>

		<cfif userAdded>
			<cfreturn Etauser>
		</cfif>

		<cfreturn false>

    </cffunction>

    <cffunction name="addUser" output="false" returnType="numeric">
        <cfargument name="user" type="numeric" required="true">
		<cfset var userInfo = new model.controller.Ldap().getUserByEinForTa(user)>
		<cfset userInfo = deserializeJSON(userInfo)>
        <cfset var userId = userInfo[1].employeeNumber>
        <cfset var userName = userInfo[1].uid>
		<cfset var newUserQry = new Query()>
		<cfset var result = {}>
		<cfset var getId = new Query()>

        <cfquery name="newUserQry" result="result">
            insert into etauser (
				username,
			   	didlogin,
			   	ein
			) VALUES (
				<cfqueryparam value="#userName#" cfsqltype="CF_SQL_VARCHAR">,
				0,
                <cfqueryparam value="#userId#" cfsqltype="CF_SQL_FLOAT">
			)
        </cfquery>

        <cfreturn #userId#>
    </cffunction>

	<cffunction name="checkUserExist" output="false" returntype="boolean"
			hint="Check if the user is in ETA already.">
        <cfargument name="userId" type="numeric" required="true" hint="The users employee number.">
		<cfset var checkUser = new Query()>
		<cfset var result = {}>

        <cfquery name="checkUser" result="result">
            select ein
              from Etauser
             where ein = <cfqueryparam value="#userId#" cfsqltype="cf_sql_float">
        </cfquery>

        <!--- recordcount 1 = true, 0 equals false --->
        <cfreturn result.recordcount>
    </cffunction>

<!---
    <cffunction name="getIdFromEin" output="false">
        <cfargument name="ein" type="numeric" required="true">
		<cfset var getId = new Query()>
		<cfset var result = {}>

        <cfquery name="getId" result="result">
            select id
              from Etauser
             where ein = <cfqueryparam value="#ein#" cfsqltype="cf_sql_float">
        </cfquery>

        <cfreturn getId.id>
    </cffunction>

    <cffunction name="getEinById" output="false">
        <cfargument name="id" type="numeric" required="true">
		<cfset var getEin = new Query()>
		<cfset var result = {}>

        <cfquery name="getEin" result="result">
            select ein
              from etauser
             where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_float">
        </cfquery>
        <cfreturn getEin.Ein>
    </cffunction>
--->

	<cffunction name="getEinByUsername" output="false">
		<cfargument name="username" type="string" required="true">
		<cfset var getEin = new Query()>
		<cfquery name="getEin">
			select ein
			from etauser
			where username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn getEin.ein>
	</cffunction>

	<cffunction name="getLoggedInEin" access="remote" output="false" returnType="numeric">
		<cfset var username = getAuthUser()>
		<cfset var ein = getEinByUsername(username)>
		<cfreturn ein>
	</cffunction>

</cfcomponent>
