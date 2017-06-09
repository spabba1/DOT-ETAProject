<cfcomponent>

	<cffunction name="init" returnType="any">

		<cfreturn this>
	</cffunction>

	<cffunction name="send" output="false">
		<cfargument name="ta" required="true" type="model.beans.ta">

		<cfset var getStaff = new model.controller.Staff().getMailingList()>

		<cfset var urlArr = listToArray(#CGI.HTTP_REFERER#, "?", "false")>

		<cfmail
			from = "#request.systemEmail#"
			to = "#arrayToList(getStaff, ',')#"
			bcc = "#request.developerEmail#"
			subject = "Message from ETA: New TA"
			server = "#request.mailServer#"
			type = "html"><html>

			<head></head>

			<body>
			<div>There is a Travel Authorization request ready for estimation.
				<br>
				<br>Please log into #urlArr[1]#
				<br>
				<br>
				<p></p>
				<table border="0">
					<tbody>
					<tr>
						<td>Traveler</td>
						<td>#ta.getTravelerName()#</td>
					</tr>
					<tr>
						<td>Destination</td>
						<td>#ta.getTravelerName()#</td>
					</tr>
					<tr>
						<td>Departure Date</td>
						<td>#ta.getDepartureDate()#</td>
					</tr>
					<tr>
						<td>Return Date</td>
						<td>#ta.getReturnDate()#</td>
					</tr>
					</tbody>
				</table>
				<p>
				<br />Thank you,
				<br />ETA</p>
			</div>
			</body>

			</html>
		</cfmail>

		<cfreturn true>
	</cffunction>

	<cffunction name="rejected" output="false">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="travelerid" required="true" type="numeric">
		<cfargument name="preparerid" required="true" type="numeric">
		<cfargument name="rejectReason" required="true" type="string">

		<cftry>
		<cfset preparerEmail = new model.services.staff().getEmailById(preparerid)>
		<cfset travelerEmail = new model.services.ldap().getEmailById(travelerid)>
		<cfset ta = new model.services.ta().getTaByTaid(taid)>

		<cfset var urlArr = listToArray(#CGI.HTTP_REFERER#, "?", "false")>


		<cfmail
			from = "#request.systemEmail#"
			to = "#preparerEmail#"
			cc = "#travelerEmail#"
			subject = "Message from ETA: TA #ta.getTaNumber()# Rejected"
			server = "#request.mailServer#"
			type = "html"><html>

			<head></head>

			<body>
			<div>.
				<br />
				<br />Please log into #urlArr[1]#
				<br />
				<br />
				<p></p>
				<table border="0">
					<tbody>
					<tr>
						<td>Reject Reason:</td>
						<td>#rejectReason#</td>
					</tr>
					<tr>
						<td>Traveler</td>
						<td>#ta.getTravelerName()#</td>
					</tr>
					<tr>
						<td>Destination</td>
						<td>#ta.getTravelerName()#</td>
					</tr>
					<tr>
						<td>Departure Date</td>
						<td>#ta.getDepartureDate()#</td>
					</tr>
					<tr>
						<td>Return Date</td>
						<td>#ta.getReturnDate()#</td>
					</tr>
					</tbody>
				</table>
				<p>
				<br />Thank you,
				<br />ETA</p>
			</div>
			</body>

			</html>
		</cfmail>

			<cfcatch type="any">
				<cfdump var="#cfcatch#" abort>
			</cfcatch>
		</cftry>

		<cfreturn true>
	</cffunction>

	<cffunction name="internalServerError" access="remote" returnType="void" output="false">
		<cfargument name="response">
		<cfargument name="user" type="string" required="false" default="Unknown">

		<cfmail
			from = "#request.systemEmail#"
			to = "#request.developerEmail#"
			subject = "ETA Internal Server Error"
			server = "#request.mailServer#"
			type = "html">
			<html>
			<head></head>
			<body>
			<div>
				<span class="header">An internal server error has occured:</span></div>
				<br>
				<div>Logged in user: <span class="theUser">#arguments.user#</span></div>
				<br>
				<cfdump var="#response#">
			</div>
			</body>
			</html>
		</cfmail>
	</cffunction>
</cfcomponent>
