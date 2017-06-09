<cfcomponent displayName="MealtypesService" output="false"
	hint="I am the MealtypesService Class used to interact with the Mealtypes package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Mealtypes class.">

		<cfset variables.instance.mealtypesDao = new model.dao.Mealtypes().init()>
		<cfset variables.instance.mealtypesGateway = new model.gateway.Mealtypes().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Mealtypes into the database">
		<cfargument name="mealtypes" required="true" type="model.beans.Mealtypes" hint="I am the Mealtypes bean.">
		<cfreturn variables.instance.mealtypesDao.saveMealtypes(arguments.mealtypes)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Mealtypes from the database.">
		<cfargument name="mealtypesId" required="true" type="numeric" hint="I am the Id of the mealtypes you wish to search for.">
		<cfreturn variables.instance.mealtypesDao.getMealtypesById(arguments.mealtypesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Mealtypes from the database.">
		<cfargument name="mealtypesId" required="true" type="numeric" hint="I am the Id of the mealtypes you wish to delete.">
		<cfreturn variables.instance.mealtypesDao.deleteMealtypesById(arguments.mealtypesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllMealtypes" access="remote" output="false"
		hint="I run a query of all the Mealtypess within the database table.">
		<cfreturn variables.instance.mealtypesGateway.getAllMealtypes()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Mealtypess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mealtypesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Mealtypess within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mealtypesGateway.filterByName(name)>
	</cffunction>

</cfcomponent>