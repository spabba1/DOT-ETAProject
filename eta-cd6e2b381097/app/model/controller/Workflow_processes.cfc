<cfcomponent>

	<cffunction name="getIdFromName" returntype="numeric" output="false">
        <cfargument name="eventName" type="string" required="true">

		<cfset var idNameQuery = new Query()>
		<cfset var idResult = {}>

        <cfquery name="idNameQuery" result="idResult">
            SELECT id
            FROM workflow_processes
			WHERE name = <cfqueryparam value="#arguments.eventName#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfreturn idNameQuery.id>
	</cffunction>

	<cffunction name="getNameFromId" output="false">
        <cfargument name="processId" type="numeric" required="true">
			<cfset var nameIdQuery = new Query()>
			<cfset var nameResult = {}>

        <cfquery name="nameIdQuery" result="nameResult">
            SELECT name
            FROM workflow_processes
			WHERE id = <cfqueryparam value="#processid#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn nameIdQuery.name>
	</cffunction>

	<cffunction name="isRejected" returnType="boolean" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var qRejected = new Query()>
		<cfset var result = {}>
		<cfset var rejected = false>

		<cfquery name="qRejected" result="result">
			   SELECT *
			     FROM (
					SELECT el.taid, wp.name, Row_number ()
						over (
						PARTITION BY el.taid
						ORDER BY el.created DESC nulls last ) r
						FROM eta_log el
						inner join workflow_processes wp
						ON el.processid = wp.id
						WHERE el.taid = <cfqueryparam value="#arguments.taid#" cfsqltype="cf_sql_integer">)
			    WHERE r          = 1
		</cfquery>

		<cfif qRejected.name EQ "Rejected">
			<cfset rejected = true>
		</cfif>

		<cfreturn rejected>
	</cffunction>

	<cffunction name="getPDF" access="remote" returnFormat="plain" output="false">
		<cfargument name="dDocName" required="true">
		<cfargument name="dID" required="true">

		<cfset var edocs_user = session.auth.user.uid>
		<cfset var edocs_password = new model.services.login()
				.getSessionKeys(session.auth.sessionkey, session.auth.sessionid)>


		<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="POST" username="#edocs_user#" password="#edocs_password#"
			timeout="1000" getAsBinary="never">

			<cfhttpparam type="formfield" name="IdcService" value="GET_FILE">
			<cfhttpparam type="formfield" name="dDocName" value="#dDocName#">
			<cfhttpparam type="formfield" name="dID" value="#dID#">
			<cfhttpparam type="formfield" name="IsSoap" value="true">

		</cfhttp>

		<cfset var toArray = new model.services.usefulfunctions()
				.soapToArrayNodes(cfhttp.filecontent, "document")>

		<cfset var pdfDocument = toArray[1].xmlChildren[4].XmlText>

		<cfreturn pdfDocument>
	</cffunction>

</cfcomponent>
