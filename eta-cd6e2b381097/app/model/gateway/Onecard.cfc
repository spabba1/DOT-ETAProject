<cfcomponent accessors="true" displayName="OnecardGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Onecard Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Onecard Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllOnecard" access="public" output="false" returnType="query"
		hint="I run a query of all ONECARD within the database table.">

		<cfset var qAllONECARD = "">
		<cfquery name="qAllOnecard">
			SELECT
				ID,
				TYPE,
				AKSASREFID,
				REFINVNUMBER,
				VENDORPVNDESC,
				AMOUNT,
				DATEPAID,
				AKSASACCT,
				AKSASBATCHNUM,
				TAID
			FROM ONECARD
		</cfquery>
		<cfreturn qAllOnecard>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByType" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Type.">

		<cfargument name="type" required="true" type="string"
			hint="I am the type to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				type = arguments.type
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByAksasrefid" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Aksasrefid.">

		<cfargument name="aksasrefid" required="true" type="string"
			hint="I am the aksasrefid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				aksasrefid = arguments.aksasrefid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByRefinvnumber" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Refinvnumber.">

		<cfargument name="refinvnumber" required="true" type="string"
			hint="I am the refinvnumber to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				refinvnumber = arguments.refinvnumber
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByVendorpvndesc" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Vendorpvndesc.">

		<cfargument name="vendorpvndesc" required="true" type="string"
			hint="I am the vendorpvndesc to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				vendorpvndesc = arguments.vendorpvndesc
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByAmount" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Amount.">

		<cfargument name="amount" required="true" type="string"
			hint="I am the amount to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				amount = arguments.amount
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByDatepaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Datepaid.">

		<cfargument name="datepaid" required="true" type="string"
			hint="I am the datepaid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				datepaid = arguments.datepaid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByAksasacct" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Aksasacct.">

		<cfargument name="aksasacct" required="true" type="string"
			hint="I am the aksasacct to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				aksasacct = arguments.aksasacct
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByAksasbatchnum" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Aksasbatchnum.">

		<cfargument name="aksasbatchnum" required="true" type="string"
			hint="I am the aksasbatchnum to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				aksasbatchnum = arguments.aksasbatchnum
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaid" access="public" output="false" returnType="array"
		hint="I query the database to find a Onecard with a matching Taid.">

		<cfargument name="taid" required="true" type="string"
			hint="I am the taid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taid = arguments.taid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllOnecard(stuFilter)>
	</cffunction>

	<cffunction name="filterAllOnecard" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				TYPE,
				AKSASREFID,
				REFINVNUMBER,
				VENDORPVNDESC,
				AMOUNT,
				DATEPAID,
				AKSASACCT,
				AKSASBATCHNUM,
				TAID
			FROM ONECARD
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Type --->
				<cfif structKeyExists(arguments.filter, 'Type')>
					AND TYPE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.type#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Aksasrefid --->
				<cfif structKeyExists(arguments.filter, 'Aksasrefid')>
					AND AKSASREFID LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.aksasrefid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Refinvnumber --->
				<cfif structKeyExists(arguments.filter, 'Refinvnumber')>
					AND REFINVNUMBER LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.refinvnumber#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Vendorpvndesc --->
				<cfif structKeyExists(arguments.filter, 'Vendorpvndesc')>
					AND VENDORPVNDESC LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.vendorpvndesc#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Amount --->
				<cfif structKeyExists(arguments.filter, 'Amount')>
					AND AMOUNT LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.amount#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Datepaid --->
				<cfif structKeyExists(arguments.filter, 'Datepaid')>
					AND DATEPAID LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.datepaid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Aksasacct --->
				<cfif structKeyExists(arguments.filter, 'Aksasacct')>
					AND AKSASACCT LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.aksasacct#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Aksasbatchnum --->
				<cfif structKeyExists(arguments.filter, 'Aksasbatchnum')>
					AND AKSASBATCHNUM LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.aksasbatchnum#" />
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
