<cfcomponent accessors="true" displayName="Eta_logGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Eta_log Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Eta_log Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllEta_log" access="public" output="false" returnType="query"
		hint="I run a query of all ETA_LOG within the database table.">

		<cfset var qAllETA_LOG = "">
		<cfquery name="qAllEta_log">
			SELECT
				CREATED,
				STATUSID,
				PROCESSID,
				TAID,
				TRAVELERID,
				ID,
				STAFFID,
				APPROVED,
				DETAILS,
				APPROVERID,
				PREPARERID
			FROM ETA_LOG
		</cfquery>
		<cfreturn qAllEta_log>
	</cffunction>

	<cffunction name="filterByCreated" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Created.">

		<cfargument name="created" required="true" type="string"
			hint="I am the created to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				created = arguments.created
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByStatusid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Statusid.">

		<cfargument name="statusid" required="true" type="string"
			hint="I am the statusid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				statusid = arguments.statusid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByProcessid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Processid.">

		<cfargument name="processid" required="true" type="string"
			hint="I am the processid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				processid = arguments.processid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravelerid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Travelerid.">

		<cfargument name="travelerid" required="true" type="string"
			hint="I am the travelerid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travelerid = arguments.travelerid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByStaffid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Staffid.">

		<cfargument name="staffid" required="true" type="string"
			hint="I am the staffid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				staffid = arguments.staffid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByApproved" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Approved.">

		<cfargument name="approved" required="true" type="string"
			hint="I am the approved to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				approved = arguments.approved
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByDetails" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Details.">

		<cfargument name="details" required="true" type="string"
			hint="I am the details to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				details = arguments.details
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByApproverid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Approverid.">

		<cfargument name="approverid" required="true" type="string"
			hint="I am the approverid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				approverid = arguments.approverid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterByPreparerid" access="public" output="false" returnType="array"
		hint="I query the database to find a Eta_log with a matching Preparerid.">

		<cfargument name="preparerid" required="true" type="string"
			hint="I am the preparerid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				preparerid = arguments.preparerid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllEta_log(stuFilter)>
	</cffunction>

	<cffunction name="filterAllEta_log" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				CREATED,
				STATUSID,
				PROCESSID,
				TAID,
				TRAVELERID,
				ID,
				STAFFID,
				APPROVED,
				DETAILS,
				APPROVERID,
				PREPARERID
			FROM ETA_LOG
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Created --->
				<cfif structKeyExists(arguments.filter, 'Created')>
					AND CREATED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.created#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Statusid --->
				<cfif structKeyExists(arguments.filter, 'Statusid')>
					AND STATUSID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.statusid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Processid --->
				<cfif structKeyExists(arguments.filter, 'Processid')>
					AND PROCESSID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.processid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Taid --->
				<cfif structKeyExists(arguments.filter, 'Taid')>
					AND TAID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.taid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travelerid --->
				<cfif structKeyExists(arguments.filter, 'Travelerid')>
					AND TRAVELERID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.travelerid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Staffid --->
				<cfif structKeyExists(arguments.filter, 'Staffid')>
					AND STAFFID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.staffid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Approved --->
				<cfif structKeyExists(arguments.filter, 'Approved')>
					AND APPROVED LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.approved#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Details --->
				<cfif structKeyExists(arguments.filter, 'Details')>
					AND DETAILS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.details#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Approverid --->
				<cfif structKeyExists(arguments.filter, 'Approverid')>
					AND APPROVERID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.approverid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Preparerid --->
				<cfif structKeyExists(arguments.filter, 'Preparerid')>
					AND PREPARERID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.preparerid#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
