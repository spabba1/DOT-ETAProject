<cfcomponent displayName="Eta_logService" output="false"
	hint="I am the Eta_logService Class used to interact with the Eta_log package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Eta_log class.">

		<cfset variables.instance.eta_logDao = new model.dao.Eta_log().init()>
		<cfset variables.instance.eta_logGateway = new model.gateway.Eta_log().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
			hint="I save or update a Eta_log into the database">
		<cfargument name="eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">
		<cfreturn variables.instance.eta_logDao.save(arguments.eta_log)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
			hint="I obtain details for a specific Eta_log from the database.">
		<cfargument name="eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">
		<cfreturn variables.instance.eta_logDao.read(arguments.eta_log)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
			hint="I delete a specific Eta_log from the database.">
		<cfargument name="eta_log" required="true" type="model.beans.Eta_log" hint="I am the Eta_log bean.">
		<cfreturn variables.instance.eta_logDao.delete(arguments.eta_log)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllEta_log" access="remote" output="false"
			hint="I run a query of all the Eta_logs within the database table.">
		<cfreturn variables.instance.eta_logGateway.getAllEta_log()>
	</cffunction>

	<cffunction name="filterByCreated" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="created" required="true" type="any" hint="I am the created to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByCreated(created)>
	</cffunction>

	<cffunction name="filterByStatusid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="statusid" required="true" type="numeric" hint="I am the statusid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByStatusid(statusid)>
	</cffunction>

	<cffunction name="filterByProcessid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="processid" required="true" type="numeric" hint="I am the processid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByProcessid(processid)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByTaid(taid)>
	</cffunction>

	<cffunction name="filterByTravelerid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="travelerid" required="true" type="numeric" hint="I am the travelerid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByTravelerid(travelerid)>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByStaffid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="staffid" required="true" type="numeric" hint="I am the staffid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByStaffid(staffid)>
	</cffunction>

	<cffunction name="filterByApproved" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="approved" required="true" type="numeric" hint="I am the approved to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByApproved(approved)>
	</cffunction>

	<cffunction name="filterByDetails" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="details" required="true" type="string" hint="I am the details to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByDetails(details)>
	</cffunction>

	<cffunction name="filterByApproverid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="approverid" required="true" type="numeric" hint="I am the approverid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByApproverid(approverid)>
	</cffunction>

	<cffunction name="filterByPreparerid" access="remote" output="false"
		hint="I run a query of all the Eta_logs within the database table based upon a required filter.">
		<cfargument name="preparerid" required="true" type="numeric" hint="I am the preparerid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.eta_logGateway.filterByPreparerid(preparerid)>
	</cffunction>

</cfcomponent>
