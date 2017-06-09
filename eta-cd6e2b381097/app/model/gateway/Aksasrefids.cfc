<cfcomponent accessors="true" displayName="AksasrefidsGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Aksasrefids Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Aksasrefids Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllAksasrefids" access="public" output="false" returnType="query"
		hint="I run a query of all AKSASREFIDS within the database table.">

		<cfset var qAllAKSASREFIDS = "">
		<cfquery name="qAllAksasrefids">
			SELECT
				ID,
				NAME
			FROM AKSASREFIDS
		</cfquery>
		<cfreturn qAllAksasrefids>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Aksasrefids with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllAksasrefids(stuFilter)>
	</cffunction>

	<cffunction name="filterByName" access="public" output="false" returnType="array"
		hint="I query the database to find a Aksasrefids with a matching Name.">

		<cfargument name="name" required="true" type="string"
			hint="I am the name to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				name = arguments.name
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllAksasrefids(stuFilter)>
	</cffunction>

	<cffunction name="filterAllAksasrefids" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM AKSASREFIDS
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Name --->
				<cfif structKeyExists(arguments.filter, 'Name')>
					AND NAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.name#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
