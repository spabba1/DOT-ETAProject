<cfcomponent displayName="ExpenseService" output="false"
	hint="I am the ExpenseService Class used to interact with the Expense package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Expense class.">

		<cfset variables.instance.expenseDao = new model.dao.Expense().init()>
		<cfset variables.instance.expenseGateway = new model.gateway.Expense().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Expense into the database">
		<cfargument name="expense" required="true" type="model.beans.Expense" hint="I am the Expense bean.">
		<cfreturn variables.instance.expenseDao.saveExpense(arguments.expense)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Expense from the database.">
		<cfargument name="expenseId" required="true" type="numeric" hint="I am the Id of the expense you wish to search for.">
		<cfreturn variables.instance.expenseDao.getExpenseById(arguments.expenseId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Expense from the database.">
		<cfargument name="expenseId" required="true" type="numeric" hint="I am the Id of the expense you wish to delete.">
		<cfreturn variables.instance.expenseDao.deleteExpenseById(arguments.expenseId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllExpense" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table.">
		<cfreturn variables.instance.expenseGateway.getAllExpense()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByExpensedate" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="expensedate" required="true" type="string" hint="I am the expensedate to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByExpensedate(expensedate)>
	</cffunction>

	<cffunction name="filterByExplanation" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="explanation" required="true" type="string" hint="I am the explanation to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByExplanation(explanation)>
	</cffunction>

	<cffunction name="filterByMeals" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="meals" required="true" type="string" hint="I am the meals to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByMeals(meals)>
	</cffunction>

	<cffunction name="filterByFacility" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="facility" required="true" type="string" hint="I am the facility to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByFacility(facility)>
	</cffunction>

	<cffunction name="filterByMiles" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="miles" required="true" type="numeric" hint="I am the miles to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByMiles(miles)>
	</cffunction>

	<cffunction name="filterBySurfmileage" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="surfmileage" required="true" type="numeric" hint="I am the surfmileage to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterBySurfmileage(surfmileage)>
	</cffunction>

	<cffunction name="filterByOthertrans" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="othertrans" required="true" type="numeric" hint="I am the othertrans to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByOthertrans(othertrans)>
	</cffunction>

	<cffunction name="filterByLodging" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="lodging" required="true" type="numeric" hint="I am the lodging to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByLodging(lodging)>
	</cffunction>

	<cffunction name="filterByMie" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="mie" required="true" type="numeric" hint="I am the mie to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByMie(mie)>
	</cffunction>

	<cffunction name="filterByOther" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="other" required="true" type="numeric" hint="I am the other to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByOther(other)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Expenses within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.expenseGateway.filterByTaid(taid)>
	</cffunction>

</cfcomponent>