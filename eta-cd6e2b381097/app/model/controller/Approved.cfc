<cfcomponent hint="I handle the 'Approvals' functions.">

	<cffunction name="getDataTableInfo" access="remote" output="false" returnType="array">
		<cfset var processID = new model.controller.Workflow_processes().getIdFromName("Travel Envelope Preparation")>
		<cfset var qEvent = new Query()>
		<cfset var result = {}>
		<cfset var output = []>

		<cfquery name="qEvent" result="result">
		SELECT ta.id AS taid, ta.tanumber, ta.travelername, ta.bu, ta.destination,
		       ta.submitted, workflow_processes.name, workflow_processes.id AS wpid
		  FROM ta, workflow_processes
		 WHERE workflow_processes.id =  ta.processid
		   AND ta.processid          >= #processID#
		</cfquery>


		<cfloop query="qEvent">
            <cfset var taToGet = #taid#>
            <cfset output[qEvent.CurrentRow]['id'] = #taid#>
            <cfset output[qEvent.CurrentRow]['tanumber'] = #taNumber#>
            <cfset output[qEvent.CurrentRow]['traveler'] = #travelerName#>
            <cfset output[qEvent.CurrentRow]['bu'] = #bu#>
            <cfset output[qEvent.CurrentRow]['destination'] = #destination#>
            <cfset output[qEvent.CurrentRow]['submitted'] = #DateFormat(submitted, "short")#>

            <cfset output[qEvent.CurrentRow]['actions'] = '<span><a style="cursor: pointer" data-ng-click="ApprovedCtrl.open(#taid#)">Approval Path</a></span>'>
		</cfloop>

		<cfreturn output>
	</cffunction>

</cfcomponent>
