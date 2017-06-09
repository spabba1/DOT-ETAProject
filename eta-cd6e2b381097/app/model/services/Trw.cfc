<cfcomponent displayName="TrwService" output="false"
	hint="I am the TrwService Class used to interact with the Trw package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Trw class.">

		<cfset variables.instance.trwDao = new model.dao.Trw().init()>
		<cfset variables.instance.trwGateway = new model.gateway.Trw().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Trw into the database">
		<cfargument name="trw" required="true" type="model.beans.Trw" hint="I am the Trw bean.">
		<cfreturn variables.instance.trwDao.saveTrw(arguments.trw)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Trw from the database.">
		<cfargument name="trwId" required="true" type="numeric" hint="I am the Id of the trw you wish to search for.">
		<cfreturn variables.instance.trwDao.getTrwById(arguments.trwId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Trw from the database.">
		<cfargument name="trwId" required="true" type="numeric" hint="I am the Id of the trw you wish to delete.">
		<cfreturn variables.instance.trwDao.deleteTrwById(arguments.trwId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllTrw" access="remote" output="false"
		hint="I run a query of all the Trws within the database table.">
		<cfreturn variables.instance.trwGateway.getAllTrw()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByFin" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="fin" required="true" type="numeric" hint="I am the fin to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterByFin(fin)>
	</cffunction>

	<cffunction name="filterByTypeid" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="typeid" required="true" type="numeric" hint="I am the typeid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterByTypeid(typeid)>
	</cffunction>

	<cffunction name="filterByAmount" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="amount" required="true" type="numeric" hint="I am the amount to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterByAmount(amount)>
	</cffunction>

	<cffunction name="filterByIrisobjectid" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="irisobjectid" required="true" type="numeric" hint="I am the irisobjectid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterByIrisobjectid(irisobjectid)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Trws within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.trwGateway.filterByTaid(taid)>
	</cffunction>

</cfcomponent>