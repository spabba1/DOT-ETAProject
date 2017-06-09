<cfcomponent accessors="true" displayName="Financial_codesGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Financial_codes Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Financial_codes Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllFinancial_codes" access="public" output="false" returnType="query"
		hint="I run a query of all FINANCIAL_CODES within the database table.">

		<cfset var qAllFINANCIAL_CODES = "">
		<cfquery name="qAllFinancial_codes">
			SELECT
				ID,
				CODE,
				TAID
			FROM FINANCIAL_CODES
		</cfquery>
		<cfreturn qAllFinancial_codes>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Financial_codes with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllFinancial_codes(stuFilter)>
	</cffunction>

	<cffunction name="filterByCode" access="public" output="false" returnType="array"
		hint="I query the database to find a Financial_codes with a matching Code.">

		<cfargument name="code" required="true" type="string"
			hint="I am the code to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				code = arguments.code
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllFinancial_codes(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Financial_codes with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllFinancial_codes(stuFilter)>
	</cffunction>

	<cffunction name="filterAllFinancial_codes" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				CODE,
				TAID
			FROM FINANCIAL_CODES
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Code --->
				<cfif structKeyExists(arguments.filter, 'Code')>
					AND CODE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.code#" />
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
