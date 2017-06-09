<cfcomponent displayName="AksasrefidsService" output="false"
	hint="I am the AksasrefidsService Class used to interact with the Aksasrefids package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Aksasrefids class.">

		<cfset variables.instance.aksasrefidsDao = new model.dao.Aksasrefids().init()>
		<cfset variables.instance.aksasrefidsGateway = new model.gateway.Aksasrefids().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Aksasrefids into the database">
		<cfargument name="aksasrefids" required="true" type="model.beans.Aksasrefids" hint="I am the Aksasrefids bean.">
		<cfreturn variables.instance.aksasrefidsDao.saveAksasrefids(arguments.aksasrefids)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Aksasrefids from the database.">
		<cfargument name="aksasrefidsId" required="true" type="numeric" hint="I am the Id of the aksasrefids you wish to search for.">
		<cfreturn variables.instance.aksasrefidsDao.getAksasrefidsById(arguments.aksasrefidsId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Aksasrefids from the database.">
		<cfargument name="aksasrefidsId" required="true" type="numeric" hint="I am the Id of the aksasrefids you wish to delete.">
		<cfreturn variables.instance.aksasrefidsDao.deleteAksasrefidsById(arguments.aksasrefidsId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllAksasrefids" access="remote" output="false"
		hint="I run a query of all the Aksasrefidss within the database table.">
		<cfreturn variables.instance.aksasrefidsGateway.getAllAksasrefids()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Aksasrefidss within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.aksasrefidsGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Aksasrefidss within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.aksasrefidsGateway.filterByName(name)>
	</cffunction>

</cfcomponent>