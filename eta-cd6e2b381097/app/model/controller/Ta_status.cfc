<cfcomponent>

    <cffunction name="getIdFromDesc" returntype="numeric" output="false">
        <cfargument name="eventDesc" type="string" required="true">
		<cfset var idDescQuery = new Query()>
		<cfset var idResult = {}>

        <cfquery name="idDescQuery" result="idResult">
            select id
              from ta_status
             where description = <cfqueryparam value="#arguments.eventDesc#">
        </cfquery>

        <cfreturn idDescQuery.id>
    </cffunction>

</cfcomponent>
