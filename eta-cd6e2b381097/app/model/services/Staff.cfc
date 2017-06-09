<cfcomponent displayName="StaffService" output="false"
	hint="I am the StaffService Class used to interact with the Staff package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Staff class.">

		<cfset variables.instance.staffDao = new model.dao.Staff().init()>
		<cfset variables.instance.staffGateway = new model.gateway.Staff().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Staff into the database">
		<cfargument name="staff" required="true" type="model.beans.Staff" hint="I am the Staff bean.">
		<cfreturn variables.instance.staffDao.saveStaff(arguments.staff)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Staff from the database.">
		<cfargument name="staffId" required="true" type="numeric" hint="I am the Id of the staff you wish to search for.">
		<cfreturn variables.instance.staffDao.getStaffById(arguments.staffId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Staff from the database.">
		<cfargument name="staffId" required="true" type="numeric" hint="I am the Id of the staff you wish to delete.">
		<cfreturn variables.instance.staffDao.deleteStaffById(arguments.staffId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllStaff" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table.">
		<cfreturn variables.instance.staffGateway.getAllStaff()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByFirstname" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="firstname" required="true" type="string" hint="I am the firstname to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByFirstname(firstname)>
	</cffunction>

	<cffunction name="filterByLastname" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="lastname" required="true" type="string" hint="I am the lastname to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByLastname(lastname)>
	</cffunction>

	<cffunction name="filterByEmail" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="email" required="true" type="string" hint="I am the email to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByEmail(email)>
	</cffunction>

	<cffunction name="filterByDatejoined" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="datejoined" required="true" type="any" hint="I am the datejoined to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByDatejoined(datejoined)>
	</cffunction>

	<cffunction name="filterByDateleft" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="dateleft" required="true" type="any" hint="I am the dateleft to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByDateleft(dateleft)>
	</cffunction>

	<cffunction name="filterByOtherdetails" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="otherdetails" required="true" type="string" hint="I am the otherdetails to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByOtherdetails(otherdetails)>
	</cffunction>

	<cffunction name="filterByStaffroleid" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="staffroleid" required="true" type="numeric" hint="I am the staffroleid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByStaffroleid(staffroleid)>
	</cffunction>

	<cffunction name="filterByNotify" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="notify" required="true" type="string" hint="I am the notify to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByNotify(notify)>
	</cffunction>

	<cffunction name="filterByUsername" access="remote" output="false"
		hint="I run a query of all the Staffs within the database table based upon a required filter.">
		<cfargument name="username" required="true" type="string" hint="I am the username to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.staffGateway.filterByUsername(username)>
	</cffunction>

</cfcomponent>
