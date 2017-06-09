<cfcomponent>

	<cffunction name="create" output="false">
		<cfargument name="bean" type="model.beans.expense" required="true">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>
		<cftry>
			<cfquery name="qInsert" result="result">
				INSERT INTO EXPENSE ( id,
				       expensedate, explanation, meals, facility, miles, surfmileage, othertrans,
				       lodging, mie, other, taid
                ) VALUES (
                    <cfqueryparam value="#bean.getId()#" cfsqltype="CF_SQL_VARCHAR">,
				       <cfqueryparam value="#bean.getExpenseDate()#" cfsqltype="CF_SQL_VARCHAR" maxlength="25">,
				       <cfqueryparam value="#bean.getExplanation()#" cfsqltype="CF_SQL_VARCHAR" maxlength="25">,
				       <cfqueryparam value="#bean.getMeals()#" cfsqltype="CF_SQL_VARCHAR" maxlength="25">,
				       <cfqueryparam value="#bean.getFacility()#" cfsqltype="CF_SQL_VARCHAR" maxlength="25">,
				       <cfqueryparam value="#bean.getMiles()#" cfsqltype="CF_SQL_DECIMAL">,
				       <cfqueryparam value="#bean.getSurfMileage()#" cfsqltype="CF_SQL_DECIMAL">,
				       <cfqueryparam value="#bean.getOtherTrans()#" cfsqltype="CF_SQL_DECIMAL">,
				       <cfqueryparam value="#bean.getLodging()#" cfsqltype="CF_SQL_DECIMAL">,
				       <cfqueryparam value="#bean.getMie()#" cfsqltype="CF_SQL_DECIMAL">,
                       <cfqueryparam value="#bean.getOther()#" cfsqltype="CF_SQL_DECIMAL">,
                       <cfqueryparam value="#bean.getTaid()#" cfsqltype="CF_SQL_FLOAT">)
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

    <cffunction name="deleteAll" output="false">
        <cfargument name="taid" required="true">
        <cfset var delQuery = new Query()>
        <cfset var result = {}>
        <cfset var msg = {}>
        <cftry>
        <cfquery name="delQuery" result="result">
            delete from expense where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfset msg.text = 'Expenses deleted successfully'>
        <cfset msg.type = 'success'>
        <cfcatch type="any" name="e">
            <cfset msg.text = 'Error deleting expenses'>
            <cfset msg.type = 'error'>
            <cfset msg.detail = e>
        </cfcatch>
        </cftry>

        <cfreturn msg>

    </cffunction>

	<cffunction name="delete" output="false">
		<cfargument name="expBean" type="model.beans.expense" required="true">
        <cfset var qDelete = new Query()>
        <cfset var msg = {}>
		<cftry>
			<cfquery name="qDelete">
                delete from expense
                where id = <cfqueryparam value="#expBean.getId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>

            <cfset msg.text = 'Expense deleted successfully.'>
            <cfset msg.type = 'success'>
		<cfcatch type="any" name="e">
            <cfset msg.text = 'An error has occured, Expense:' + expBean.id + ' was not deleted.'>
            <cfset msg.detail = e>
            <cfset msg.type = 'error'>
		</cfcatch>
		</cftry>

        <cfreturn msg>
	</cffunction>

</cfcomponent>
