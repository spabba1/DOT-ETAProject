<cfcomponent>

	<cffunction name="sendToEdocs" access="remote" returnType="struct" output="false" hint="Send pdf to edocs">
		<cfargument name="taid" type="numeric" required="true">
		<cfargument name="approver" type="string" required="true">
		<cfargument name="authdata" type="string" required="true">

		<cfset var authDataDecoded = new model.services.usefulfunctions().decodeAuthData(authdata)>

		<cfset var pdfObject = new model.services.pdfcreate().create(taid, true)>

		<cfset var isEstimatorEmpty = new model.services.ta().checkIfEstimatorIsEmpty(taid, authDataDecoded[1])>

		<cfset var isRejected = new model.services.workflow_processes().isRejected(taid)>

		<cfset var upload = new model.services.edocs().upload(taid, approver, authDataDecoded, isRejected)>
		<cfset var startWorkflow = new model.services.edocs().startWorkflow(upload, approver, authDataDecoded)>

		<cfset var msg = {}>
		<cfset msg.status = upload.type>
		<cfset msg.message = upload.message>
		<cfif structKeyExists(upload, "detail")>
			<cfset msg.detail = upload.detail>
		</cfif>

		<cfreturn msg>
	</cffunction>

</cfcomponent>
