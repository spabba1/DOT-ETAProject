<cfcomponent displayName="Staff_roleService" output="false"
	hint="I am the Staff_roleService Class used to interact with the Staff_role package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Staff_role class.">

		<cfset variables.instance.staff_roleDao = new model.dao.Staff_role().init()>
		<cfset variables.instance.staff_roleGateway = new model.gateway.Staff_role().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Staff_role into the database">
		<cfargument name="staff_role" required="true" type="model.beans.Staff_role" hint="I am the Staff_role bean.">
		<cfreturn variables.instance.staff_roleDao.saveStaff_role(arguments.staff_role)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Staff_role from the database.">
		<cfargument name="staff_roleId" required="true" type="numeric" hint="I am the Id of the staff_role you wish to search for.">
		<cfreturn variables.instance.staff_roleDao.getStaff_roleById(arguments.staff_roleId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Staff_role from the database.">
		<cfargument name="staff_roleId" required="true" type="numeric" hint="I am the Id of the staff_role you wish to delete.">
		<cfreturn variables.instance.staff_roleDao.deleteStaff_roleById(arguments.staff_roleId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllStaff_role" access="remote" output="false"
		hint="I run a query of all the Staff_roles within the database table.">
		<cfreturn variables.instance.staff_roleGateway.getAllStaff_role()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Staff_roles within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staff_roleGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByDescription" access="remote" output="false"
		hint="I run a query of all the Staff_roles within the database table based upon a required filter.">
		<cfargument name="description" required="true" type="string" hint="I am the description to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staff_roleGateway.filterByDescription(description)>
	</cffunction>

</cfcomponent>