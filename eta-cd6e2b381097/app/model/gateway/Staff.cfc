<cfcomponent accessors="true" displayName="StaffGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Staff Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Staff Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllStaff" access="public" output="false" returnType="query"
		hint="I run a query of all STAFF within the database table.">

		<cfset var qAllSTAFF = "">
		<cfquery name="qAllStaff">
			SELECT
				ID,
				FIRSTNAME,
				LASTNAME,
				EMAIL,
				DATEJOINED,
				DATELEFT,
				OTHERDETAILS,
				STAFFROLEID,
				NOTIFY,
				USERNAME
			FROM STAFF
		</cfquery>
		<cfreturn qAllStaff>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByFirstname" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Firstname.">

		<cfargument name="firstname" required="true" type="string"
			hint="I am the firstname to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				firstname = arguments.firstname
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByLastname" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Lastname.">

		<cfargument name="lastname" required="true" type="string"
			hint="I am the lastname to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				lastname = arguments.lastname
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByEmail" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Email.">

		<cfargument name="email" required="true" type="string"
			hint="I am the email to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				email = arguments.email
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByDatejoined" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Datejoined.">

		<cfargument name="datejoined" required="true" type="string"
			hint="I am the datejoined to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				datejoined = arguments.datejoined
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByDateleft" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Dateleft.">

		<cfargument name="dateleft" required="true" type="string"
			hint="I am the dateleft to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				dateleft = arguments.dateleft
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByOtherdetails" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Otherdetails.">

		<cfargument name="otherdetails" required="true" type="string"
			hint="I am the otherdetails to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				otherdetails = arguments.otherdetails
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByStaffroleid" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Staffroleid.">

		<cfargument name="staffroleid" required="true" type="string"
			hint="I am the staffroleid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				staffroleid = arguments.staffroleid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByNotify" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Notify.">

		<cfargument name="notify" required="true" type="string"
			hint="I am the notify to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				notify = arguments.notify
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterByUsername" access="public" output="false" returnType="array"
		hint="I query the database to find a Staff with a matching Username.">

		<cfargument name="username" required="true" type="string"
			hint="I am the username to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				username = arguments.username
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllStaff(stuFilter)>
	</cffunction>

	<cffunction name="filterAllStaff" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

		<cfquery name="qSearch">
			SELECT
				ID,
				FIRSTNAME,
				LASTNAME,
				EMAIL,
				DATEJOINED,
				DATELEFT,
				OTHERDETAILS,
				STAFFROLEID,
				NOTIFY,
				USERNAME
			FROM STAFF
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Firstname --->
				<cfif structKeyExists(arguments.filter, 'Firstname')>
					AND FIRSTNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.firstname#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Lastname --->
				<cfif structKeyExists(arguments.filter, 'Lastname')>
					AND LASTNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.lastname#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Email --->
				<cfif structKeyExists(arguments.filter, 'Email')>
					AND EMAIL LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.email#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Datejoined --->
				<cfif structKeyExists(arguments.filter, 'Datejoined')>
					AND DATEJOINED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.datejoined#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Dateleft --->
				<cfif structKeyExists(arguments.filter, 'Dateleft')>
					AND DATELEFT LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.dateleft#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Otherdetails --->
				<cfif structKeyExists(arguments.filter, 'Otherdetails')>
					AND OTHERDETAILS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.otherdetails#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Staffroleid --->
				<cfif structKeyExists(arguments.filter, 'Staffroleid')>
					AND STAFFROLEID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.staffroleid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Notify --->
				<cfif structKeyExists(arguments.filter, 'Notify')>
					AND NOTIFY LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.notify#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Username --->
				<cfif structKeyExists(arguments.filter, 'Username')>
					AND USERNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.username#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
