<cfcomponent>

	<cffunction name="create" output="false" returnType="struct">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="fcode" required="true" type="string">

		<cfset var bean = new model.beans.Financial_code()>
		<cfset bean.setCode(arguments.fcode)>
		<cfset bean.setTaid(arguments.taid)>

		<cfset var result = new model.dao.Financialcode().create(bean)>
		<cfreturn result>
	</cffunction>

	<!---<cffunction name="create" returnType="numeric" output="false">
		<cfargument name="fincode" required="true">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var insertResult = 0>

		<cfquery name="qInsert" result="result">
			insert into financial_codes (
				code, fk_taid
			) VALUES (
				<cfqueryparam value="#arguments.fincode.getCode()#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.fincode.getFk_taid()#" cfsqltype="CF_SQL_FLOAT">
			)
		</cfquery>

		<cfif result.recordCount>
			<cfset var getId = new Query()>
			<cfset var idResult = {}>
			<cfquery name="getId" result="idResult">
				select id
				  from financial_Codes
				 where ROWID = <cfqueryparam value="#result.ROWID#">
			</cfquery>

			<cfset insertResult = getId.id>
		</cfif>

		<cfreturn insertResult>
	</cffunction>--->

	<cffunction name="getemptybean" output="false" access="remote" returnType="model.beans.financial_code">
		<cfreturn new model.beans.Financial_code()>
	</cffunction>

	<cffunction name="getFincodesByTaId" access="remote" output="false" returnType="array">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var qFCodes = new Query()>
		<cfset var result = {}>
		<cfset var finCodeArray = []>

		<cfquery name="qFCodes" result="result">
			select id, code, taid
			from financial_codes
			where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfset var numFincodes = result.recordCount>

		<cfif result.recordCount GTE 1>
			<cfloop query="qFCodes">
				<cfset finCodeArray[CurrentRow] = new model.beans.Financial_code().init(
				id = qFCodes.id,
				code = qFCodes.code,
				taid = qFCodes.taid
				)>
			</cfloop>
			<cfelse>
			<cfset finCodeArray[1] = new model.beans.Financial_code()>
		</cfif>

		<cfreturn finCodeArray>
	</cffunction>

	<cffunction name="update" returntype="boolean" output="false">
		<cfargument name="fincode" required="true" type="string">

		<cfset var qUpdate = new Query()>
		<cfset var result = {}>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qUpdate" result="result">
				update financial_codes
				   set code = <cfqueryparam value="#arguments.fincode.code#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfcatch>
                <cfset boolSuccess = false>
            </cfcatch>
        </cftry>

        <cfreturn boolSuccess>
    </cffunction>

    <cffunction name="delete" returntype="boolean" output="false">
        <cfargument name="id" type="numeric" required="true">

        <cfset var qDelete = new Query()>
        <cfset var result = {}>
        <cfset var boolSuccess = true>

        <cftry>
            <cfquery name="qDelete" result="result">
                delete from financial_Codes where id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_FLOAT">
            </cfquery>
            <cfcatch>
                <cfset boolSuccess = false>
            </cfcatch>
        </cftry>

        <cfreturn boolSuccess>
    </cffunction>

	<cffunction name="deleteAll" output="false" returnType="struct">
		<cfargument name="taid" required="true" type="numeric">
		<cfset var delQuery = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>
		<cftry>
			<cfquery name="delQuery" result="result">
                delete from financial_codes
                 where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
            </cfquery>

            <cfset msg.text = 'Financial Codes deleted successfully.'>
            <cfset msg.type = 'success'>
            <cfcatch type="any" name="e">
                <cfset msg.text = 'Error deleting financial codes.'>
                <cfset msg.type = 'error'>
                <cfset msg.detail = e>
            </cfcatch>
		</cftry>

		<cfreturn msg>

	</cffunction>

</cfcomponent>
