<cfcomponent displayName="Financial_codesService" output="false"
	hint="I am the Financial_codesService Class used to interact with the Financial_codes package.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor for the Financial_codes class.">

		<cfset variables.instance.financial_codesDao = new model.dao.Financial_codes().init()>
		<cfset variables.instance.financial_codesGateway = new model.gateway.Financial_codes().init()>

		<cfreturn this>
	</cffunction>

	<!--- Crud Methods --->

	<cffunction name="save" access="public" output="false"
		hint="I save or update a Financial_codes into the database">
		<cfargument name="financial_codes" required="true" type="model.beans.Financial_codes" hint="I am the Financial_codes bean.">
		<cfreturn variables.instance.financial_codesDao.saveFinancial_codes(arguments.financial_codes)>
	</cffunction>

	<cffunction name="read" access="public" output="false"
		hint="I obtain details for a specific Financial_codes from the database.">
		<cfargument name="financial_codesId" required="true" type="numeric" hint="I am the Id of the financial_codes you wish to search for.">
		<cfreturn variables.instance.financial_codesDao.getFinancial_codesById(arguments.financial_codesId)>
	</cffunction>

	<cffunction name="delete" access="public" output="false"
		hint="I delete a specific Financial_codes from the database.">
		<cfargument name="financial_codesId" required="true" type="numeric" hint="I am the Id of the financial_codes you wish to delete.">
		<cfreturn variables.instance.financial_codesDao.deleteFinancial_codesById(arguments.financial_codesId)>
	</cffunction>

	<!--- Gateway Methods --->
	<cffunction name="getAllFinancial_codes" access="remote" output="false"
		hint="I run a query of all the Financial_codess within the database table.">
		<cfreturn variables.instance.financial_codesGateway.getAllFinancial_codes()>
	</cffunction>

	<cffunction name="filterById" access="remote" output="false"
		hint="I run a query of all the Financial_codess within the database table based upon a required filter.">
		<cfargument name="id" required="true" type="numeric" hint="I am the id to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.financial_codesGateway.filterById(id)>
	</cffunction>

	<cffunction name="filterByCode" access="remote" output="false"
		hint="I run a query of all the Financial_codess within the database table based upon a required filter.">
		<cfargument name="code" required="true" type="string" hint="I am the code to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.financial_codesGateway.filterByCode(code)>
	</cffunction>

	<cffunction name="filterByTaid" access="remote" output="false"
		hint="I run a query of all the Financial_codess within the database table based upon a required filter.">
		<cfargument name="taid" required="true" type="numeric" hint="I am the taid to filter.">

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn variables.instance.financial_codesGateway.filterByTaid(taid)>
	</cffunction>

</cfcomponent>