<cfcomponent displayName="Workflow_processesService" output="false"
	hint="I am the Workflow_processesService Class used to interact with the Workflow_processes package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Workflow_processes class.">

		<cfset variables.instance.workflow_processesDao = new model.dao.Workflow_processes().init()>
		<cfset variables.instance.workflow_processesGateway = new model.gateway.Workflow_processes().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Workflow_processes into the database">
		<cfargument name="workflow_processes" required="true" type="model.beans.Workflow_processes" hint="I am the Workflow_processes bean.">
		<cfreturn variables.instance.workflow_processesDao.saveWorkflow_processes(arguments.workflow_processes)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Workflow_processes from the database.">
		<cfargument name="workflow_processesId" required="true" type="numeric" hint="I am the Id of the workflow_processes you wish to search for.">
		<cfreturn variables.instance.workflow_processesDao.getWorkflow_processesById(arguments.workflow_processesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Workflow_processes from the database.">
		<cfargument name="workflow_processesId" required="true" type="numeric" hint="I am the Id of the workflow_processes you wish to delete.">
		<cfreturn variables.instance.workflow_processesDao.deleteWorkflow_processesById(arguments.workflow_processesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllWorkflow_processes" access="remote" output="false"
		hint="I run a query of all the Workflow_processess within the database table.">
		<cfreturn variables.instance.workflow_processesGateway.getAllWorkflow_processes()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Workflow_processess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.workflow_processesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByName" access="remote" output="false"
		hint="I run a query of all the Workflow_processess within the database table based upon a required filter.">
		<cfargument name="name" required="true" type="string" hint="I am the name to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.workflow_processesGateway.filterByName(name)>
	</cffunction>

</cfcomponent>