<cfcomponent displayName="FacilitiesService" output="false"
	hint="I am the FacilitiesService Class used to interact with the Facilities package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Facilities class.">

		<cfset variables.instance.facilitiesDao = new model.dao.Facilities().init()>
		<cfset variables.instance.facilitiesGateway = new model.gateway.Facilities().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Facilities into the database">
		<cfargument name="facilities" required="true" type="model.beans.Facilities" hint="I am the Facilities bean.">
		<cfreturn variables.instance.facilitiesDao.saveFacilities(arguments.facilities)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Facilities from the database.">
		<cfargument name="facilitiesId" required="true" type="numeric" hint="I am the Id of the facilities you wish to search for.">
		<cfreturn variables.instance.facilitiesDao.getFacilitiesById(arguments.facilitiesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Facilities from the database.">
		<cfargument name="facilitiesId" required="true" type="numeric" hint="I am the Id of the facilities you wish to delete.">
		<cfreturn variables.instance.facilitiesDao.deleteFacilitiesById(arguments.facilitiesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllFacilities" access="remote" output="false"
		hint="I run a query of all the Facilitiess within the database table.">
		<cfreturn variables.instance.facilitiesGateway.getAllFacilities()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Facilitiess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.facilitiesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Facilitiess within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.facilitiesGateway.filterByName(name)>
	</cffunction>

</cfcomponent>