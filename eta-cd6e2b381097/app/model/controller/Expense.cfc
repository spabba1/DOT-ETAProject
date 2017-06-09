<cfcomponent output="false">

    <cffunction name="create" returnType="numeric" output="false">
        <cfargument name="expense" required="true" type="model.beans.Expense">

		<cfset var qCreate = new Query()>
		<cfset var result = {}>

        <cfquery name="qCreate" result="result">
            insert into expense (
                expensedate,
			   	explanation,
			   	meals,
			   	facility,
			   	miles,
			   	surfmileage,
                othertrans,
			   	lodging,
			   	mie,
			   	other,
			   	taid
            ) VALUES (
                <cfqueryparam value="#arguments.expense.getExpensedate()#"      cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
                <cfqueryparam value="#arguments.expense.getExplanation()#"      cfsqltype = "CF_SQL_VARCHAR" maxlength="512">,
                <cfqueryparam value="#arguments.expense.getMeals()#"            cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
                <cfqueryparam value="#arguments.expense.getFacility()#"         cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
                <cfqueryparam value="#val(arguments.expense.getMiles())#"       cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#val(arguments.expense.getSurfmileage())#" cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#val(arguments.expense.getOthertrans())#"  cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#val(arguments.expense.getLodging())#"		cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#val(arguments.expense.getMie())#"         cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#val(arguments.expense.getOther())#"       cfsqltype = "CF_SQL_DECIMAL">,
                <cfqueryparam value="#arguments.expense.getTaid()#"          cfsqltype = "CF_SQL_FLOAT">
            )
        </cfquery>

        <cfif result.recordCount>
			<cfset var getId = new Query()>
			<cfset var idResult = {}>

            <cfquery name="getId" result="idResult">
                select id
                  from expense
				  where ROWID = <cfqueryparam value="#result.ROWID#">
            </cfquery>

            <cfset var thisId = getId.id>
        </cfif>

        <cfreturn thisId>
    </cffunction>

    <cffunction name="getExpenseById" returnType="struct" output="false">
        <cfargument name="expenseId" type="numeric" required="true">
		<cfset var getExpense = new Query()>
		<cfset var result = {}>

        <cfquery name="getExpense" result="result">
            select id, expensedate, explanation, meals, facility, miles, surfmileage,
                   othertrans, lodging, mie, other, taid
              from expense
             where id = <cfqueryparam value="#arguments.expenseId#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfif result.recordCount>
            <cfset var objExpense = new model.beans.Expense().init(
                id=getExpense.id,
                expensedate=getExpense.expensedate,
                explanation=getExpense.explanation,
                meals=getExpense.meals,
                facility=getExpense.facility,
                miles=getExpense.miles,
                surfmileage=getExpense.surfmileage,
                othertrans=getExpense.othertrans,
                lodging=getExpense.lodging,
                mie=getExpense.mie,
                other=getExpense.other,
                taid=getExpense.taid)>
        </cfif>

        <cfreturn objExpense>
    </cffunction>

    <cffunction name="getExpensesByTaId" access="remote" returnType="array" output="false">
        <cfargument name="taId" type="numeric" required="true">
		<cfset var qExpenses = new Query()>
		<cfset var result = {}>
        <cfset var expenseArray = []>

        <cfquery name="qExpenses" result="result">
            select id,
				expensedate,
			   	explanation,
			   	meals,
			   	facility,
			   	miles,
			   	surfmileage,
				othertrans,
			   	lodging,
			   	mie,
			   	other,
			   	taid
              from expense
             where taid = <cfqueryparam value="#arguments.taId#" cfsqltype="CF_SQL_FLOAT">
             order by id
        </cfquery>

        <cfif result.recordCount GTE 1>
            <cfloop query="qExpenses">
                <cfset expenseArray[currentRow] = new model.beans.Expense().init(
                    id=qExpenses.id,
                    expensedate=qExpenses.expensedate,
                    explanation=qExpenses.explanation,
                    meals=qExpenses.meals,
                    facility=qExpenses.facility,
                    miles=qExpenses.miles,
                    surfmileage=qExpenses.surfmileage,
                    othertrans=qExpenses.othertrans,
                    lodging=qExpenses.lodging,
                    mie=qExpenses.mie,
                    other=qExpenses.other,
                    taid=qExpenses.taid)>
            </cfloop>
        <cfelse>
            <cfset expenseArray[1] = new model.beans.Expense().init()>
        </cfif>

        <cfreturn expenseArray>
    </cffunction>

	<cffunction name="getEmptyBean" output="false" access="remote" returnType="model.beans.Expense">
		<cfreturn new model.beans.Expense()>
	</cffunction>

    <cffunction name="update" returntype="boolean" output="false">
        <cfargument name="expense" required="true" type="model.beans.Expense" hint="Expense bean.">
		<cfset var qUpdate = new Query()>
		<cfset var result = {}>

        <cfset var boolSuccess = "true">
        <cftry>
            <cfquery name="qUpdate" result="result">
				update expense
				set expensedate = <cfqueryparam value = "#arguments.expense.getExpensedate()#" cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
				explanation     = <cfqueryparam value = "#arguments.expense.getExplanation()#" cfsqltype = "CF_SQL_VARCHAR" maxlength="512">,
				meals           = <cfqueryparam value = "#arguments.expense.getMeals()#"       cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
				facility        = <cfqueryparam value = "#arguments.expense.getFacility()#"    cfsqltype = "CF_SQL_VARCHAR" maxlength="25">,
				miles           = <cfqueryparam value = "#arguments.expense.getMiles()#"       cfsqltype = "CF_SQL_DECIMAL">,
				surfmileage     = <cfqueryparam value = "#arguments.expense.getSurfmileage()#" cfsqltype = "CF_SQL_DECIMAL">,
				othertrans      = <cfqueryparam value = "#arguments.expense.getOthertrans()#"  cfsqltype = "CF_SQL_DECIMAL">,
				lodging         = <cfqueryparam value = "#arguments.expense.getLodging()#"     cfsqltype = "CF_SQL_DECIMAL">,
				mie             = <cfqueryparam value = "#arguments.expense.getMie()#"         cfsqltype = "CF_SQL_DECIMAL">,
				other           = <cfqueryparam value = "#arguments.expense.getOther()#"       cfsqltype = "CF_SQL_DECIMAL">
				where id        = <cfqueryparam value = "#arguments.expense.getId()#"          cfsqltype = "CF_SQL_FLOAT">
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
                delete from expense
                 where id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_FLOAT">
            </cfquery>
        <cfcatch>
            <cfset boolSuccess = false>
        </cfcatch>
        </cftry>

        <cfreturn boolSuccess>
    </cffunction>

	<cffunction name="deleteAll" returntype="boolean" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var qDeleteAll = new Query()>
		<cfset var result = {}>

		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDeleteAll" result="result">
				delete from expense
				where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch>
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>

		<cfreturn boolSuccess>
	</cffunction>

</cfcomponent>
<!--- vim: set foldlevel=1: --->
