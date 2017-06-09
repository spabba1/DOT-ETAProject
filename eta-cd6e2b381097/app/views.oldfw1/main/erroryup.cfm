<h2>We are sorry.  Something went wrong.  We are working on it now.</h2>

<cflog file="travautherrorlog" text="#request.exception.cause.message# - #request.exception.cause.type#">

<cfsavecontent variable="errortext">
<cfoutput>
    An error occured: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br>
    Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br>


    <cfdump var="#request.exception#" label="Error">
    <cfdump var="#form#" label="Form">
    <cfdump var="#url#" label="URL">

</cfoutput>
</cfsavecontent>

<cfmail to="jeremey.hustman@alaska.gov" from="root@travauth.com"
    subject="Error: #request.exception.cause.message#" type="html">
    #errorText#
</cfmail>
