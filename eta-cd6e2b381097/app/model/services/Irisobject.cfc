<cfcomponent displayName="IrisobjectService" output="false"
	hint="I am the IrisobjectService Class used to interact with the Irisobject package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Irisobject class.">

		<cfset variables.instance.irisobjectDao = new model.dao.Irisobject().init()>
		<cfset variables.instance.irisobjectGateway = new model.gateway.Irisobject().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Irisobject into the database">
		<cfargument name="irisobject" required="true" type="model.beans.Irisobject" hint="I am the Irisobject bean.">
		<cfreturn variables.instance.irisobjectDao.saveIrisobject(arguments.irisobject)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Irisobject from the database.">
		<cfargument name="irisobjectId" required="true" type="numeric" hint="I am the Id of the irisobject you wish to search for.">
		<cfreturn variables.instance.irisobjectDao.getIrisobjectById(arguments.irisobjectId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Irisobject from the database.">
		<cfargument name="irisobjectId" required="true" type="numeric" hint="I am the Id of the irisobject you wish to delete.">
		<cfreturn variables.instance.irisobjectDao.deleteIrisobjectById(arguments.irisobjectId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllIrisobject" access="remote" output="false"
		hint="I run a query of all the Irisobjects within the database table.">
		<cfreturn variables.instance.irisobjectGateway.getAllIrisobject()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Irisobjects within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.irisobjectGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByDescription" access="remote" output="false"
		hint="I run a query of all the Irisobjects within the database table based upon a required filter.">
		<cfargument name="description" required="true" type="string" hint="I am the description to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.irisobjectGateway.filterByDescription(description)>
	</cffunction>

	<cffunction name="filterByInstate" access="remote" output="false"
		hint="I run a query of all the Irisobjects within the database table based upon a required filter.">
		<cfargument name="instate" required="true" type="numeric" hint="I am the instate to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.irisobjectGateway.filterByInstate(instate)>
	</cffunction>

	<cffunction name="filterByOutstate" access="remote" output="false"
		hint="I run a query of all the Irisobjects within the database table based upon a required filter.">
		<cfargument name="outstate" required="true" type="numeric" hint="I am the outstate to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.irisobjectGateway.filterByOutstate(outstate)>
	</cffunction>

</cfcomponent>