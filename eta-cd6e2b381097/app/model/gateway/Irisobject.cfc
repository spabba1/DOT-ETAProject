<cfcomponent accessors="true" displayName="IrisobjectGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Irisobject Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Irisobject Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllIrisobject" access="public" output="false" returnType="query"
		hint="I run a query of all IRISOBJECT within the database table.">

		<cfset var qAllIRISOBJECT = "">
		<cfquery name="qAllIrisobject">
			SELECT
				ID,
				DESCRIPTION,
				INSTATE,
				OUTSTATE
			FROM IRISOBJECT
		</cfquery>
		<cfreturn qAllIrisobject>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Irisobject with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllIrisobject(stuFilter)>
	</cffunction>

	<cffunction name="filterByDescription" access="public" output="false" returnType="array"
		hint="I query the database to find a Irisobject with a matching Description.">

		<cfargument name="description" required="true" type="string"
			hint="I am the description to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				description = arguments.description
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllIrisobject(stuFilter)>
	</cffunction>

	<cffunction name="filterByInstate" access="public" output="false" returnType="array"
		hint="I query the database to find a Irisobject with a matching Instate.">

		<cfargument name="instate" required="true" type="string"
			hint="I am the instate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				instate = arguments.instate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllIrisobject(stuFilter)>
	</cffunction>

	<cffunction name="filterByOutstate" access="public" output="false" returnType="array"
		hint="I query the database to find a Irisobject with a matching Outstate.">

		<cfargument name="outstate" required="true" type="string"
			hint="I am the outstate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				outstate = arguments.outstate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllIrisobject(stuFilter)>
	</cffunction>

	<cffunction name="filterAllIrisobject" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				DESCRIPTION,
				INSTATE,
				OUTSTATE
			FROM IRISOBJECT
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Description --->
				<cfif structKeyExists(arguments.filter, 'Description')>
					AND DESCRIPTION LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.description#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Instate --->
				<cfif structKeyExists(arguments.filter, 'Instate')>
					AND INSTATE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.instate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Outstate --->
				<cfif structKeyExists(arguments.filter, 'Outstate')>
					AND OUTSTATE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.outstate#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
