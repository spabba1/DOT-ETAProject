<cfcomponent displayName="Ta_statusService" output="false"
	hint="I am the Ta_statusService Class used to interact with the Ta_status package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Ta_status class.">

		<cfset variables.instance.ta_statusDao = new model.dao.Ta_status().init()>
		<cfset variables.instance.ta_statusGateway = new model.gateway.Ta_status().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Ta_status into the database">
		<cfargument name="ta_status" required="true" type="model.beans.Ta_status" hint="I am the Ta_status bean.">
		<cfreturn variables.instance.ta_statusDao.saveTa_status(arguments.ta_status)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Ta_status from the database.">
		<cfargument name="ta_statusId" required="true" type="numeric" hint="I am the Id of the ta_status you wish to search for.">
		<cfreturn variables.instance.ta_statusDao.getTa_statusById(arguments.ta_statusId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Ta_status from the database.">
		<cfargument name="ta_statusId" required="true" type="numeric" hint="I am the Id of the ta_status you wish to delete.">
		<cfreturn variables.instance.ta_statusDao.deleteTa_statusById(arguments.ta_statusId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllTa_status" access="remote" output="false"
		hint="I run a query of all the Ta_statuss within the database table.">
		<cfreturn variables.instance.ta_statusGateway.getAllTa_status()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Ta_statuss within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.ta_statusGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByDescription" access="remote" output="false"
		hint="I run a query of all the Ta_statuss within the database table based upon a required filter.">
		<cfargument name="description" required="true" type="string" hint="I am the description to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.ta_statusGateway.filterByDescription(description)>
	</cffunction>

</cfcomponent>