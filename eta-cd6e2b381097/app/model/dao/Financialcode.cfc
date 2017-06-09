<cfcomponent>

	<cffunction name="create" output="false" returnType="struct">
		<cfargument name="fcbean" type="model.beans.financial_code" required="true">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>
		<cftry>
			<cfquery name="qInsert" result="result">
				insert into financial_codes (
					code,
				   	taid
				) values (
					<cfqueryparam value="#fcbean.getCode()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
					<cfqueryparam value="#int(fcbean.getTaid())#" cfsqltype="CF_FLOAT">
				)
			</cfquery>

			<cfset msg.id = result.ROWID>
			<cfset msg.text = 'Record inserted successfully'>
			<cfset msg.type = 'success'>
			<cfcatch type="any" name="e">
				<cfset msg.text = 'An error has occured.  The record was not inserted'>
				<cfset msg.type = 'error'>
				<cfset msg.result = e>
			</cfcatch>
		</cftry>

		<cfreturn msg>

	</cffunction>

</cfcomponent>
