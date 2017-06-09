<cfcomponent accessors="true" displayName="EtauserGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Etauser Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Etauser Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllEtauser" access="public" output="false" returnType="query"
		hint="I run a query of all ETAUSER within the database table.">

		<cfset var qAllETAUSER = "">
		<cfquery name="qAllEtauser">
			SELECT
				USERNAME,
				DIDLOGIN,
				EIN
			FROM ETAUSER
		</cfquery>
		<cfreturn qAllEtauser>
	</cffunction>

	<cffunction name="filterByUsername" access="public" output="false" returnType="array"
		hint="I query the database to find a Etauser with a matching Username.">

		<cfargument name="username" required="true" type="string"
			hint="I am the username to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				username = arguments.username
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEtauser(stuFilter)>
	</cffunction>

	<cffunction name="filterByDidlogin" access="public" output="false" returnType="array"
		hint="I query the database to find a Etauser with a matching Didlogin.">

		<cfargument name="didlogin" required="true" type="string"
			hint="I am the didlogin to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				didlogin = arguments.didlogin
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEtauser(stuFilter)>
	</cffunction>

	<cffunction name="filterByEin" access="public" output="false" returnType="array"
		hint="I query the database to find a Etauser with a matching Ein.">

		<cfargument name="ein" required="true" type="string"
			hint="I am the ein to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				ein = arguments.ein
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEtauser(stuFilter)>
	</cffunction>

	<cffunction name="filterAllEtauser" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				USERNAME,
				DIDLOGIN,
				EIN
			FROM ETAUSER
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Username --->
				<cfif structKeyExists(arguments.filter, 'Username')>
					AND USERNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.username#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Didlogin --->
				<cfif structKeyExists(arguments.filter, 'Didlogin')>
					AND DIDLOGIN LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.didlogin#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Ein --->
				<cfif structKeyExists(arguments.filter, 'Ein')>
					AND EIN LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.ein#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
