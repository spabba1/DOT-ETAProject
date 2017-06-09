<cfcomponent output="false">

	<cffunction name="sendError" output="false">
		<cfargument name="exception" required="true">
		<!---<cfargument name="eventname" type="string" required="true">--->
		<cfset var errortext = "">

		<cflog file="etaerrorlog" text="#arguments.exception.message#" />

		<cfsavecontent variable="errortext">
			<cfoutput>
				An error occured: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br>
				Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br>

				<cfdump var="#arguments.exception#" label="Error" />
				<cfdump var="#form#" label="Form" />
				<cfdump var="#url#" label="URL" />

			</cfoutput>
		</cfsavecontent>

		<cfmail to="#request.developerEmail#"
			from="#request.systemEmail#"
			subject="Error: #arguments.exception.message#"
			server="#request.mailServer#"
			type="html">
			#errortext#
		</cfmail>

	</cffunction>

</cfcomponent>
