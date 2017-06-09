<cfcomponent displayName="MileagerateService" output="false"
	hint="I am the MileagerateService Class used to interact with the Mileagerate package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Mileagerate class.">

		<cfset variables.instance.mileagerateDao = new model.dao.Mileagerate().init()>
		<cfset variables.instance.mileagerateGateway = new model.gateway.Mileagerate().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Mileagerate into the database">
		<cfargument name="mileagerate" required="true" type="model.beans.Mileagerate" hint="I am the Mileagerate bean.">
		<cfreturn variables.instance.mileagerateDao.saveMileagerate(arguments.mileagerate)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Mileagerate from the database.">
		<cfargument name="mileagerateId" required="true" type="numeric" hint="I am the Id of the mileagerate you wish to search for.">
		<cfreturn variables.instance.mileagerateDao.getMileagerateById(arguments.mileagerateId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Mileagerate from the database.">
		<cfargument name="mileagerateId" required="true" type="numeric" hint="I am the Id of the mileagerate you wish to delete.">
		<cfreturn variables.instance.mileagerateDao.deleteMileagerateById(arguments.mileagerateId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllMileagerate" access="remote" output="false"
		hint="I run a query of all the Mileagerates within the database table.">
		<cfreturn variables.instance.mileagerateGateway.getAllMileagerate()>
	</cffunction>

	<cffunction name="filterByMileagerate" access="remote" output="false"
		hint="I run a query of all the Mileagerates within the database table based upon a required filter.">
		<cfargument name="mileagerate" required="true" type="numeric" hint="I am the mileagerate to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mileagerateGateway.filterByMileagerate(mileagerate)>
	</cffunction>

	<cffunction name="filterByEffectivedate" access="remote" output="false"
		hint="I run a query of all the Mileagerates within the database table based upon a required filter.">
		<cfargument name="effectivedate" required="true" type="any" hint="I am the effectivedate to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mileagerateGateway.filterByEffectivedate(effectivedate)>
	</cffunction>

	<cffunction name="filterByChangedby" access="remote" output="false"
		hint="I run a query of all the Mileagerates within the database table based upon a required filter.">
		<cfargument name="changedby" required="true" type="numeric" hint="I am the changedby to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mileagerateGateway.filterByChangedby(changedby)>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Mileagerates within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.mileagerateGateway.filterById(id)>
	</cffunction>

</cfcomponent>