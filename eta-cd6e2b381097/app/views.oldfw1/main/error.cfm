<h1>An error has occured</h1>
<cfoutput>
<p>We're sorry, but an error has occured and #application.developerName# has been emailed
details of the error.</p>
<p>The type of error was #request.exception.cause.type#<p>
<p>Click <a href="#buildUrl('main.default')#">here</a> to return to the home page.</p>
</cfoutput>




<!---<h1>An Error Occurred</h1>
<p>I am the application error view: home:main.error.</p>
<p>Details of the exception:</p>
<cfoutput>
	<ul>
		<li>Failed action: <cfif structKeyExists( request, 'failedAction' )>#request.failedAction#<cfelse>unknown</cfif></li>
		<li>Error: #request.exception.cause.message#</li>
		<li>Type: #request.exception.cause.type#</li>
		<li>Detail: #request.exception.cause.detail#</li>
		<li>Application event: #request.event#</li>
		<li>Exception type: #request.exception.type#</li>
		<li>Exception message: #request.exception.message#</li>
		<li>Exception detail: #request.exception.detail#</li>
		[><li>CFC: #request.failedCfcName#</li><]
		[><li>Method: #request.failedMethod#</li><]
		<cfif getEnvironment() EQ "dev">
		    <li>Session: <cfdump var="#session#" expand="yes"></li>
		    <li><cfdump var="#request.exception#" expand="yes"></li>
		<cfelse>
		    <li>Session: <cfdump var="#session#" expand="no"></li>
		    <li><cfdump var="#request.exception#" expand="no"></li>
		</cfif>
	</ul>
</cfoutput>--->
