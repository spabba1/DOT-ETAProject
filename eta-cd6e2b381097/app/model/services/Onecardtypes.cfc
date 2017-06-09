<cfcomponent displayName="OnecardtypesService" output="false"
	hint="I am the OnecardtypesService Class used to interact with the Onecardtypes package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Onecardtypes class.">

		<cfset variables.instance.onecardtypesDao = new model.dao.Onecardtypes().init()>
		<cfset variables.instance.onecardtypesGateway = new model.gateway.Onecardtypes().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Onecardtypes into the database">
		<cfargument name="onecardtypes" required="true" type="model.beans.Onecardtypes" hint="I am the Onecardtypes bean.">
		<cfreturn variables.instance.onecardtypesDao.saveOnecardtypes(arguments.onecardtypes)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Onecardtypes from the database.">
		<cfargument name="onecardtypesId" required="true" type="numeric" hint="I am the Id of the onecardtypes you wish to search for.">
		<cfreturn variables.instance.onecardtypesDao.getOnecardtypesById(arguments.onecardtypesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Onecardtypes from the database.">
		<cfargument name="onecardtypesId" required="true" type="numeric" hint="I am the Id of the onecardtypes you wish to delete.">
		<cfreturn variables.instance.onecardtypesDao.deleteOnecardtypesById(arguments.onecardtypesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllOnecardtypes" access="remote" output="false"
		hint="I run a query of all the Onecardtypess within the database table.">
		<cfreturn variables.instance.onecardtypesGateway.getAllOnecardtypes()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Onecardtypess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardtypesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Onecardtypess within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardtypesGateway.filterByName(name)>
	</cffunction>

</cfcomponent>