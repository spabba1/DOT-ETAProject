<cfcomponent>

	<cffunction name="create" returnType="numeric" output="false">
		<cfargument name="trw" required="true" type="model.beans.Trw">

		<cfset var trwId = 0>
		<cfset var qCreate = new query()>
		<cfset var result = {}>

		<cfquery name="qCreate" result="result">
			insert into trw (
				fin, type, amount, aksasacct, taid
			) values (
				<cfqueryparam value="#arguments.trw.getFin()#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.trw.getType()#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.trw.getAmount()#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.trw.getAksasacct()#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.trw.gettaid()#" cfsqltype="CF_SQL_FLOAT">
			)
		</cfquery>

		<cfif result.recordCount>
			<cfset var insertId = new Query()>
			<cfset var idResult = {}>
			<cfquery name="insertId" result="idResult">
				select id from trw where ROWID = <cfqueryparam value="#result.ROWID#">
			</cfquery>
			<cfset trwId = insertId.id>
		</cfif>
		<cfreturn trwId>
	</cffunction>

	<cffunction name="getTrwsByTaid" access="remote" returnType="array" output="false">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var trw = new model.services.Trw().filterByTaid(arguments.taid)>

		<cfreturn trw>
	</cffunction>

	<cffunction name="getEmptyBean" output="false" access="remote" returnType="model.beans.Trw">
		<cfreturn new model.beans.Trw()>
	</cffunction>

	<cffunction name="update" returntype="boolean" output="false">
		<cfargument name="trw" required="true" type="model.beans.Trw">
		<cfset var qUpdate = new query()>
		<cfset var result = {}>
		<cfset var boolSuccess = true>

		<cfquery name="qUpdate" result="result">
			update trw
			   set fin = <cfqueryparam value="#arguments.trw.getFin()#" cfsqltype="CF_SQL_VARCHAR">,
			       type = <cfqueryparam value="#arguments.trw.getType()#" cfsqltype="CF_SQL_VARCHAR">,
			       amount = <cfqueryparam value="#arguments.trw.getAmount()#" cfsqltype="CF_SQL_VARCHAR">,
			       aksasacct = <cfqueryparam value="#arguments.trw.getAksasacct()#" cfsqltype="CF_SQL_VARCHAR">
			 where id = <cfqueryparam value="#arguments.trw.getId()#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfreturn boolSuccess>
	</cffunction>

	<cffunction name="deleteById" returnType="boolean" output="false">
		<cfargument name="id" type="numeric" required="true">
		<cfset var qDelete = new Query()>
		<cfset var result = {}>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete" result="result">
				delete from trw
				where id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_FLOAT">
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
            delete from trw where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfset msg.text = 'Traveler Reimbursement Warrants deleted successfully.'>
        <cfset msg.type = 'success'>
        <cfcatch type="any" name="e">
            <cfset msg.text = 'Error deleting Traveler Reimbursement Warrants.'>
            <cfset msg.type = 'error'>
            <cfset msg.detail = e>
        </cfcatch>
        </cftry>

        <cfreturn msg>

    </cffunction>
</cfcomponent>
