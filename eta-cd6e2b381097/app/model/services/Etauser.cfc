<cfcomponent displayName="EtauserService" output="false"
	hint="I am the EtauserService Class used to interact with the Etauser package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Etauser class.">

		<cfset variables.instance.etauserDao = new model.dao.Etauser().init()>
		<cfset variables.instance.etauserGateway = new model.gateway.Etauser().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
			hint="I save or update a Etauser into the database">
		<cfargument name="etauser" required="true" type="model.beans.Etauser" hint="I am the Etauser bean.">
		<cfreturn variables.instance.etauserDao.save(arguments.etauser)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
			hint="I obtain details for a specific Etauser from the database.">
		<cfargument name="etauser" required="true" type="model.beans.Etauser" hint="I am the Etauser bean.">
		<cfreturn variables.instance.etauserDao.read(arguments.etauser)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
			hint="I delete a specific Etauser from the database.">
		<cfargument name="etauser" required="true" type="model.beans.Etauser" hint="I am the Etauser bean.">
		<cfreturn variables.instance.etauserDao.delete(arguments.etauser)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllEtauser" access="remote" output="false"
			hint="I run a query of all the Etausers within the database table.">
		<cfreturn variables.instance.etauserGateway.getAllEtauser()>
	</cffunction>

	<cffunction name="filterByUsername" access="remote" output="false"
		hint="I run a query of all the Etausers within the database table based upon a required filter.">
		<cfargument name="username" required="true" type="string" hint="I am the username to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.etauserGateway.filterByUsername(username)>
	</cffunction>

	<cffunction name="filterByDidlogin" access="remote" output="false"
		hint="I run a query of all the Etausers within the database table based upon a required filter.">
		<cfargument name="didlogin" required="true" type="numeric" hint="I am the didlogin to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.etauserGateway.filterByDidlogin(didlogin)>
	</cffunction>

	<cffunction name="filterByEin" access="remote" output="false"
		hint="I run a query of all the Etausers within the database table based upon a required filter.">
		<cfargument name="ein" required="true" type="numeric" hint="I am the ein to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.etauserGateway.filterByEin(ein)>
	</cffunction>

</cfcomponent>
