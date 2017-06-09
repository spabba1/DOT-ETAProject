<cfcomponent accessors="true" displayName="ExpenseGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Expense Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Expense Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllExpense" access="public" output="false" returnType="query"
		hint="I run a query of all EXPENSE within the database table.">

		<cfset var qAllEXPENSE = "">
		<cfquery name="qAllExpense">
			SELECT
				ID,
				EXPENSEDATE,
				EXPLANATION,
				MEALS,
				FACILITY,
				MILES,
				SURFMILEAGE,
				OTHERTRANS,
				LODGING,
				MIE,
				OTHER,
				TAID
			FROM EXPENSE
		</cfquery>
		<cfreturn qAllExpense>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByExpensedate" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Expensedate.">

		<cfargument name="expensedate" required="true" type="string"
			hint="I am the expensedate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				expensedate = arguments.expensedate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByExplanation" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Explanation.">

		<cfargument name="explanation" required="true" type="string"
			hint="I am the explanation to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				explanation = arguments.explanation
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByMeals" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Meals.">

		<cfargument name="meals" required="true" type="string"
			hint="I am the meals to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				meals = arguments.meals
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByFacility" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Facility.">

		<cfargument name="facility" required="true" type="string"
			hint="I am the facility to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				facility = arguments.facility
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByMiles" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Miles.">

		<cfargument name="miles" required="true" type="string"
			hint="I am the miles to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				miles = arguments.miles
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterBySurfmileage" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Surfmileage.">

		<cfargument name="surfmileage" required="true" type="string"
			hint="I am the surfmileage to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				surfmileage = arguments.surfmileage
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByOthertrans" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Othertrans.">

		<cfargument name="othertrans" required="true" type="string"
			hint="I am the othertrans to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				othertrans = arguments.othertrans
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByLodging" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Lodging.">

		<cfargument name="lodging" required="true" type="string"
			hint="I am the lodging to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				lodging = arguments.lodging
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByMie" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Mie.">

		<cfargument name="mie" required="true" type="string"
			hint="I am the mie to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				mie = arguments.mie
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByOther" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Other.">

		<cfargument name="other" required="true" type="string"
			hint="I am the other to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				other = arguments.other
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Expense with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllExpense(stuFilter)>
	</cffunction>

	<cffunction name="filterAllExpense" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				EXPENSEDATE,
				EXPLANATION,
				MEALS,
				FACILITY,
				MILES,
				SURFMILEAGE,
				OTHERTRANS,
				LODGING,
				MIE,
				OTHER,
				TAID
			FROM EXPENSE
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Expensedate --->
				<cfif structKeyExists(arguments.filter, 'Expensedate')>
					AND EXPENSEDATE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.expensedate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Explanation --->
				<cfif structKeyExists(arguments.filter, 'Explanation')>
					AND EXPLANATION LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.explanation#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Meals --->
				<cfif structKeyExists(arguments.filter, 'Meals')>
					AND MEALS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.meals#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Facility --->
				<cfif structKeyExists(arguments.filter, 'Facility')>
					AND FACILITY LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.facility#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Miles --->
				<cfif structKeyExists(arguments.filter, 'Miles')>
					AND MILES LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.miles#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Surfmileage --->
				<cfif structKeyExists(arguments.filter, 'Surfmileage')>
					AND SURFMILEAGE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.surfmileage#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Othertrans --->
				<cfif structKeyExists(arguments.filter, 'Othertrans')>
					AND OTHERTRANS LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.othertrans#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Lodging --->
				<cfif structKeyExists(arguments.filter, 'Lodging')>
					AND LODGING LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.lodging#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Mie --->
				<cfif structKeyExists(arguments.filter, 'Mie')>
					AND MIE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.mie#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Other --->
				<cfif structKeyExists(arguments.filter, 'Other')>
					AND OTHER LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.other#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Taid --->
				<cfif structKeyExists(arguments.filter, 'Taid')>
					AND TAID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.taid#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
