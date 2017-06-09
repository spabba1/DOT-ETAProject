<cfcomponent displayName="OutofstateService" output="false"
	hint="I am the OutofstateService Class used to interact with the Outofstate package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Outofstate class.">

		<cfset variables.instance.outofstateDao = new model.dao.Outofstate().init()>
		<cfset variables.instance.outofstateGateway = new model.gateway.Outofstate().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Outofstate into the database">
		<cfargument name="outofstate" required="true" type="model.beans.Outofstate" hint="I am the Outofstate bean.">
		<cfreturn variables.instance.outofstateDao.saveOutofstate(arguments.outofstate)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Outofstate from the database.">
		<cfargument name="outofstateId" required="true" type="numeric" hint="I am the Id of the outofstate you wish to search for.">
		<cfreturn variables.instance.outofstateDao.getOutofstateById(arguments.outofstateId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Outofstate from the database.">
		<cfargument name="outofstateId" required="true" type="numeric" hint="I am the Id of the outofstate you wish to delete.">
		<cfreturn variables.instance.outofstateDao.deleteOutofstateById(arguments.outofstateId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllOutofstate" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table.">
		<cfreturn variables.instance.outofstateGateway.getAllOutofstate()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByConfname" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="confname" required="true" type="string" hint="I am the confname to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByConfname(confname)>
	</cffunction>

	<cffunction name="filterByGoal" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="goal" required="true" type="string" hint="I am the goal to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByGoal(goal)>
	</cffunction>

	<cffunction name="filterByLocaloption" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="localoption" required="true" type="numeric" hint="I am the localoption to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByLocaloption(localoption)>
	</cffunction>

	<cffunction name="filterByLocaloptionreason" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="localoptionreason" required="true" type="string" hint="I am the localoptionreason to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByLocaloptionreason(localoptionreason)>
	</cffunction>

	<cffunction name="filterByBeneficial" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="beneficial" required="true" type="string" hint="I am the beneficial to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByBeneficial(beneficial)>
	</cffunction>

	<cffunction name="filterBySharing" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="sharing" required="true" type="string" hint="I am the sharing to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterBySharing(sharing)>
	</cffunction>

	<cffunction name="filterByGroupable" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="groupable" required="true" type="numeric" hint="I am the groupable to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByGroupable(groupable)>
	</cffunction>

	<cffunction name="filterByDebrief" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="debrief" required="true" type="numeric" hint="I am the debrief to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByDebrief(debrief)>
	</cffunction>

	<cffunction name="filterByComments" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="comments" required="true" type="string" hint="I am the comments to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByComments(comments)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Outofstates within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.outofstateGateway.filterByTaid(taid)>
	</cffunction>

</cfcomponent>