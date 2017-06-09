<cfcomponent displayName="TrwtypesService" output="false"
	hint="I am the TrwtypesService Class used to interact with the Trwtypes package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Trwtypes class.">

		<cfset variables.instance.trwtypesDao = new model.dao.Trwtypes().init()>
		<cfset variables.instance.trwtypesGateway = new model.gateway.Trwtypes().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Trwtypes into the database">
		<cfargument name="trwtypes" required="true" type="model.beans.Trwtypes" hint="I am the Trwtypes bean.">
		<cfreturn variables.instance.trwtypesDao.saveTrwtypes(arguments.trwtypes)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Trwtypes from the database.">
		<cfargument name="trwtypesId" required="true" type="numeric" hint="I am the Id of the trwtypes you wish to search for.">
		<cfreturn variables.instance.trwtypesDao.getTrwtypesById(arguments.trwtypesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Trwtypes from the database.">
		<cfargument name="trwtypesId" required="true" type="numeric" hint="I am the Id of the trwtypes you wish to delete.">
		<cfreturn variables.instance.trwtypesDao.deleteTrwtypesById(arguments.trwtypesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllTrwtypes" access="remote" output="false"
		hint="I run a query of all the Trwtypess within the database table.">
		<cfreturn variables.instance.trwtypesGateway.getAllTrwtypes()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Trwtypess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwtypesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Trwtypess within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwtypesGateway.filterByName(name)>
	</cffunction>

</cfcomponent>