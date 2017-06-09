<html>
<head>
	<title>RocketUnit unit tests</title>
</head>
<body>
	<cfset test = createObject("component", "src.Test")>
	<cfset test.runTestPackage("etaTests")>
	<cfoutput>#test.HTMLFormatTestResults()#</cfoutput>
</body>
</html>
