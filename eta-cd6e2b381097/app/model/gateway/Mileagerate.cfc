<cfcomponent accessors="true" displayName="MileagerateGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Mileagerate Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Mileagerate Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllMileagerate" access="public" output="false" returnType="query"
		hint="I run a query of all MILEAGERATE within the database table.">

		<cfset var qAllMILEAGERATE = "">
		<cfquery name="qAllMileagerate">
			SELECT
				MILEAGERATE,
				EFFECTIVEDATE,
				CHANGEDBY,
				ID
			FROM MILEAGERATE
		</cfquery>
		<cfreturn qAllMileagerate>
	</cffunction>

	<cffunction name="filterByMileagerate" access="public" output="false" returnType="array"
		hint="I query the database to find a Mileagerate with a matching Mileagerate.">

		<cfargument name="mileagerate" required="true" type="string"
			hint="I am the mileagerate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				mileagerate = arguments.mileagerate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllMileagerate(stuFilter)>
	</cffunction>

	<cffunction name="filterByEffectivedate" access="public" output="false" returnType="array"
		hint="I query the database to find a Mileagerate with a matching Effectivedate.">

		<cfargument name="effectivedate" required="true" type="string"
			hint="I am the effectivedate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				effectivedate = arguments.effectivedate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllMileagerate(stuFilter)>
	</cffunction>

	<cffunction name="filterByChangedby" access="public" output="false" returnType="array"
		hint="I query the database to find a Mileagerate with a matching Changedby.">

		<cfargument name="changedby" required="true" type="string"
			hint="I am the changedby to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				changedby = arguments.changedby
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllMileagerate(stuFilter)>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Mileagerate with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllMileagerate(stuFilter)>
	</cffunction>

	<cffunction name="filterAllMileagerate" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				MILEAGERATE,
				EFFECTIVEDATE,
				CHANGEDBY,
				ID
			FROM MILEAGERATE
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Mileagerate --->
				<cfif structKeyExists(arguments.filter, 'Mileagerate')>
					AND MILEAGERATE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.mileagerate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Effectivedate --->
				<cfif structKeyExists(arguments.filter, 'Effectivedate')>
					AND EFFECTIVEDATE LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.effectivedate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Changedby --->
				<cfif structKeyExists(arguments.filter, 'Changedby')>
					AND CHANGEDBY LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.changedby#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.id#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
