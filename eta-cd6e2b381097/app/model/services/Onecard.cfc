<cfcomponent displayName="OnecardService" output="false"
	hint="I am the OnecardService Class used to interact with the Onecard package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Onecard class.">

		<cfset variables.instance.onecardDao = new model.dao.Onecard().init()>
		<cfset variables.instance.onecardGateway = new model.gateway.Onecard().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Onecard into the database">
		<cfargument name="onecard" required="true" type="model.beans.Onecard" hint="I am the Onecard bean.">
		<cfreturn variables.instance.onecardDao.saveOnecard(arguments.onecard)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Onecard from the database.">
		<cfargument name="onecardId" required="true" type="numeric" hint="I am the Id of the onecard you wish to search for.">
		<cfreturn variables.instance.onecardDao.getOnecardById(arguments.onecardId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Onecard from the database.">
		<cfargument name="onecardId" required="true" type="numeric" hint="I am the Id of the onecard you wish to delete.">
		<cfreturn variables.instance.onecardDao.deleteOnecardById(arguments.onecardId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllOnecard" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table.">
		<cfreturn variables.instance.onecardGateway.getAllOnecard()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByType" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="type" required="true" type="string" hint="I am the type to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByType(type)>
	</cffunction>

	<cffunction name="filterByAksasrefid" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="aksasrefid" required="true" type="string" hint="I am the aksasrefid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByAksasrefid(aksasrefid)>
	</cffunction>

	<cffunction name="filterByRefinvnumber" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="refinvnumber" required="true" type="string" hint="I am the refinvnumber to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByRefinvnumber(refinvnumber)>
	</cffunction>

	<cffunction name="filterByVendorpvndesc" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="vendorpvndesc" required="true" type="string" hint="I am the vendorpvndesc to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByVendorpvndesc(vendorpvndesc)>
	</cffunction>

	<cffunction name="filterByAmount" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="amount" required="true" type="numeric" hint="I am the amount to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByAmount(amount)>
	</cffunction>

	<cffunction name="filterByDatepaid" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="datepaid" required="true" type="any" hint="I am the datepaid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByDatepaid(datepaid)>
	</cffunction>

	<cffunction name="filterByAksasacct" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="aksasacct" required="true" type="string" hint="I am the aksasacct to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByAksasacct(aksasacct)>
	</cffunction>

	<cffunction name="filterByAksasbatchnum" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="aksasbatchnum" required="true" type="string" hint="I am the aksasbatchnum to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByAksasbatchnum(aksasbatchnum)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Onecards within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.onecardGateway.filterByTaid(taid)>
	</cffunction>

</cfcomponent>