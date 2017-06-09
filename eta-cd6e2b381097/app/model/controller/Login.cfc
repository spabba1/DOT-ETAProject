<cfcomponent accessors="true" hint="I am the Login service">

	<cfset init()>

	<cffunction name="init" output="false" returnType="struct">
		<cfset staffService = new model.services.Staff()>
		<cfset etauserService = new model.services.Etauser()>
		<cfset etauserDao = new model.dao.Etauser()>

		<cfreturn this>
	</cffunction>

<!---
    <cffunction name="authUser" access="public" output="false" returntype="struct" hint="Deprecated for cfauthuser">
        <cfargument name="uid" type="string" required="yes">
        <cfargument name="password" type="string" required="yes">
        <cfset var authenticateUser = "">
		<cfset var userDetails = {}>
		<cfset var i = 1>

		<cfset var userInfo = getUserInfo(uid)>

        <cfif userInfo.exists>

			<cftry>
				<cfldap
					action="query"
					name="authenticateUser"
					attributes="*"
					start="ou=People,o=state.ak.us"
					maxrows="1"
					scope="subtree"
					filter="uid=#arguments.uid#"
					server="jnuldap.state.ak.us"
					port="389"
					username="#userInfo.userInfo.dn#"
					password="#arguments.password#">

					<cfloop query="authenticateUser">
						<cfset userDetails[authenticateUser.name[#currentrow#]] = authenticateUser.value[#currentrow#]>
					</cfloop>
				[><cfscript>
				for (i = 1; i LTE authenticateUser.RecordCount; i = i + 1) {
					var userDetails[authenticateUser.name[i]] = authenticateUser.value[i];
				}
				</cfscript><]
			<cfcatch>
				<cfset userDetails.errorMsg = #cfcatch.message#>
			</cfcatch>
			</cftry>

        </cfif>

        <cfreturn userDetails>
    </cffunction>
--->

	<cffunction name="login" access="remote" output="false" returnType="struct"
			hint="I log in the user.">
		<cfargument name="username" type="string" required="yes">
		<cfargument name="password" type="string" required="yes">

		<cfset var returnStruct = {}>

		<cfset var auth = new Query()>
		<cfset var LDAP_root = "o=state.ak.us">
		<cfset var LDAP_server = "jnuldap.state.ak.us">
		<cfset var LDAP_port = "389">

		<cfset var userPrefix="uid=">
		<cfset var userSuffix=",ou=People,o=state.ak.us">

		<cfset var LDAP_username = userPrefix&#username#&userSuffix>

		<cfset var userFilter = "(&(objectClass=groupOfUniqueNames)(uniqueMember=#LDAP_username#))">


		<cftry>
			<cfldap action="query"
				name="auth"
				attributes="cn"
				referral="yes"
				start="#LDAP_root#"
				scope="subtree"
				server="#LDAP_server#"
				port="#LDAP_port#"
				filter="#userFilter#"
				username="#LDAP_username#"
				password="#password#"
				>

			<cfif auth.recordcount>
				<cfset var userInfo = getUserInfo(username)>

				<cfset var Etauser = new model.beans.Etauser().init(ein=userInfo.EMPLOYEENUMBER)>

				<cfset var checkInSystem = EtauserService.read(Etauser)>

				<cfif NOT checkInSystem>
					<cfset Etauser.setDidlogin(true)>
					<cfset Etauser.setUsername(userInfo.UID)>
					<cfset var addUser = EtauserService.save(Etauser)>
				</cfif>

				<cfset var isAdmin = new model.controller.Staff().isAdmin(userInfo.employeeNumber)>

				<!---<cfset returnStruct.uid = userInfo.uid>--->
				<!---<cfset returnStruct.employeeNumber = userInfo.employeeNumber>--->
				<cfset returnStruct.success = true>
				<cfset returnStruct.isAdmin = isAdmin>
			</cfif>

		<cfcatch type="any">
			<cfset returnStruct.success = false>
			<cfset returnStruct.message = cfcatch>
		</cfcatch>
		</cftry>

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="cfauthuser" output="false" returnType="struct">
		<cfargument name="username" type="string" required="yes">
		<cfargument name="password" type="string" required="yes">

		<cfset var etaUserStruct = {}>

		<cfset var auth = new Query()>
		<cfset var LDAP_root = "o=state.ak.us">
		<cfset var LDAP_server = "jnuldap.state.ak.us">
		<cfset var LDAP_port = "389">

		<cfset var userPrefix="uid=">
		<cfset var userSuffix=",ou=People,o=state.ak.us">

		<cfset var LDAP_username = userPrefix&#username#&userSuffix>

		<cfset var userFilter = "(&(objectClass=groupOfUniqueNames)(uniqueMember=#LDAP_username#))">


		<cftry>
			<cfldap action="query"
				name="auth"
				attributes="cn"
				referral="yes"
				start="#LDAP_root#"
				scope="subtree"
				server="#LDAP_server#"
				port="#LDAP_port#"
				filter="#userFilter#"
				username="#LDAP_username#"
				password="#password#"
				>

			<cfif auth.recordcount>
				<cfset var userInfo = getUserInfo(username)>
				<cfset var getRole = new model.controller.Staff().isAdmin(userInfo.employeeNumber)>
				<cflogin>
					<cfloginuser name="#username#" password="#password#" roles="#getRole.staffRole#">
				</cflogin>
			</cfif>

		<cfcatch type="any">
			<cfset etaUserStruct.error = true>
			<cfset etaUserStruct.errorMsg = cfcatch.message>
		</cfcatch>
		</cftry>

		 <cfif IsUserLoggedIn()>
			<cfset etaUserStruct.uid = userInfo.uid>
			<cfset etaUserStruct.employeeNumber = userInfo.employeeNumber>
		</cfif>

		<cfreturn etaUserStruct>

	</cffunction>

	<cffunction name="getUserInfo" output="false" returnType="query">
		<cfargument name="uid" type="string" required="yes" hint="Username">
		<cfset var getUserInfo = {}>

		<cfldap
			action="query"
			attributes="uid,dn,employeeNumber"
			filter="uid=#arguments.uid#"
			name="getUserInfo"
			port="389"
			scope="subtree"
			server="jnuldap.state.ak.us"
			start="ou=People,o=state.ak.us"
			timeout="5000">

		<cfif #getUserInfo.recordCount# EQ 0>
			<cfset getUserInfo = false>
		</cfif>

		<cfif #getUserInfo.uid# EQ "issdtest1">
			<cfset getUserInfo.employeeNumber = 999999>
		</cfif>

		<cfreturn getUserInfo>
	</cffunction>

    <cffunction name="isActive" output="false" returnType="boolean">
        <cfargument name="userId" required="true" type="string">
		<cfset var query = new Query()>
		<cfset var result = {}>

        <cfquery name="query" result="result">
            select didlogin
              from etauser
             where ein = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.userId#">
        </cfquery>

        <cfreturn #query.didlogin#>
    </cffunction>

    <cffunction name="genSessionKeys" returnType="struct" output="false">
        <cfargument name="userKey" required="true" type="string">

        <cfset var sessionStruct = {}>
        <cfset sessionStruct.sessionKey = generateSecretKey("AES")>
        <cfset sessionStruct.sessionID = encrypt(userkey, sessionStruct.sessionKey, "AES", "Base64")>

        <cfreturn sessionStruct>
    </cffunction>

    <cffunction name="getSessionKeys" returnType="string" output="false">
        <cfargument name="sessionKey" required="true" type="string">
        <cfargument name="sessionID" required="true" type="string">

        <cfset var idKey = decrypt(sessionID, sessionKey, "AES", "Base64")>

        <cfreturn idKey>
    </cffunction>

	<cffunction name="logout" output="false" returnType="void">
		<cflogout>
	</cffunction>

</cfcomponent>
