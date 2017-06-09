<cfcomponent>

	<cffunction name="init" output="false">
		<cfargument name="fw" required="true" type="struct">
		<cfset variables.fw = fw>
	</cffunction>


	<cffunction name="default" output="false">
		<cfset rc.pagetitle = "Workflow Items | ">
		<cfset rc.breadcrumb.3 = '<a href="#fw.buildUrl("workflow.default")#">Workflow Items</a>'>
	</cffunction>

	<cffunction name="approvals" output="false">
		<cfset rc.pagetitle = "Approved TA's | ">
		<cfset rc.breadcrumb.3 = "Approved TA's">
	</cffunction>

</cfcomponent>
