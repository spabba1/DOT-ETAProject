<cfcomponent accessors="true" displayName="OutofstateGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Outofstate Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Outofstate Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllOutofstate" access="public" output="false" returnType="query"
		hint="I run a query of all OUTOFSTATE within the database table.">

		<cfset var qAllOUTOFSTATE = "">
		<cfquery name="qAllOutofstate">
			SELECT
				ID,
				CONFNAME,
				GOAL,
				LOCALOPTION,
				LOCALOPTIONREASON,
				BENEFICIAL,
				SHARING,
				GROUPABLE,
				DEBRIEF,
				COMMENTS,
				TAID
			FROM OUTOFSTATE
		</cfquery>
		<cfreturn qAllOutofstate>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByConfname" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Confname.">

		<cfargument name="confname" required="true" type="string"
			hint="I am the confname to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				confname = arguments.confname
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByGoal" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Goal.">

		<cfargument name="goal" required="true" type="string"
			hint="I am the goal to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				goal = arguments.goal
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByLocaloption" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Localoption.">

		<cfargument name="localoption" required="true" type="string"
			hint="I am the localoption to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				localoption = arguments.localoption
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByLocaloptionreason" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Localoptionreason.">

		<cfargument name="localoptionreason" required="true" type="string"
			hint="I am the localoptionreason to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				localoptionreason = arguments.localoptionreason
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByBeneficial" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Beneficial.">

		<cfargument name="beneficial" required="true" type="string"
			hint="I am the beneficial to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				beneficial = arguments.beneficial
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterBySharing" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Sharing.">

		<cfargument name="sharing" required="true" type="string"
			hint="I am the sharing to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				sharing = arguments.sharing
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByGroupable" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Groupable.">

		<cfargument name="groupable" required="true" type="string"
			hint="I am the groupable to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				groupable = arguments.groupable
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByDebrief" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Debrief.">

		<cfargument name="debrief" required="true" type="string"
			hint="I am the debrief to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				debrief = arguments.debrief
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByComments" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Comments.">

		<cfargument name="comments" required="true" type="string"
			hint="I am the comments to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				comments = arguments.comments
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Outofstate with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOutofstate(stuFilter)>
	</cffunction>

	<cffunction name="filterAllOutofstate" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				CONFNAME,
				GOAL,
				LOCALOPTION,
				LOCALOPTIONREASON,
				BENEFICIAL,
				SHARING,
				GROUPABLE,
				DEBRIEF,
				COMMENTS,
				TAID
			FROM OUTOFSTATE
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Confname --->
				<cfif structKeyExists(arguments.filter, 'Confname')>
					AND CONFNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.confname#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Goal --->
				<cfif structKeyExists(arguments.filter, 'Goal')>
					AND GOAL LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.goal#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Localoption --->
				<cfif structKeyExists(arguments.filter, 'Localoption')>
					AND LOCALOPTION LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.localoption#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Localoptionreason --->
				<cfif structKeyExists(arguments.filter, 'Localoptionreason')>
					AND LOCALOPTIONREASON LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.localoptionreason#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Beneficial --->
				<cfif structKeyExists(arguments.filter, 'Beneficial')>
					AND BENEFICIAL LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.beneficial#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Sharing --->
				<cfif structKeyExists(arguments.filter, 'Sharing')>
					AND SHARING LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.sharing#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Groupable --->
				<cfif structKeyExists(arguments.filter, 'Groupable')>
					AND GROUPABLE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.groupable#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Debrief --->
				<cfif structKeyExists(arguments.filter, 'Debrief')>
					AND DEBRIEF LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.debrief#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Comments --->
				<cfif structKeyExists(arguments.filter, 'Comments')>
					AND COMMENTS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.comments#" />
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
