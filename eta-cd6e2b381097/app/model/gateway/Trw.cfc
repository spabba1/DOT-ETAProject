<cfcomponent accessors="true" displayName="TrwGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Trw Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Trw Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllTrw" access="public" output="false" returnType="query"
		hint="I run a query of all TRW within the database table.">

		<cfset var qAllTRW = "">
		<cfquery name="qAllTrw">
			SELECT
				ID,
				FIN,
				TYPEID,
				AMOUNT,
				IRISOBJECTID,
				TAID
			FROM TRW
		</cfquery>
		<cfreturn qAllTrw>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterByFin" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Fin.">

		<cfargument name="fin" required="true" type="string"
			hint="I am the fin to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				fin = arguments.fin
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterByTypeid" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Typeid.">

		<cfargument name="typeid" required="true" type="string"
			hint="I am the typeid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				typeid = arguments.typeid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterByAmount" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Amount.">

		<cfargument name="amount" required="true" type="string"
			hint="I am the amount to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				amount = arguments.amount
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterByIrisobjectid" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Irisobjectid.">

		<cfargument name="irisobjectid" required="true" type="string"
			hint="I am the irisobjectid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				irisobjectid = arguments.irisobjectid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Trw with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTrw(stuFilter)>
	</cffunction>

	<cffunction name="filterAllTrw" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				FIN,
				TYPEID,
				AMOUNT,
				IRISOBJECTID,
				TAID
			FROM TRW
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Fin --->
				<cfif structKeyExists(arguments.filter, 'Fin')>
					AND FIN LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.fin#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Typeid --->
				<cfif structKeyExists(arguments.filter, 'Typeid')>
					AND TYPEID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.typeid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Amount --->
				<cfif structKeyExists(arguments.filter, 'Amount')>
					AND AMOUNT LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.amount#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Irisobjectid --->
				<cfif structKeyExists(arguments.filter, 'Irisobjectid')>
					AND IRISOBJECTID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.irisobjectid#" />
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
