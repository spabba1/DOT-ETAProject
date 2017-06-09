component extends='framework.one' {

    session.startTime = getTickCount();

	this.mappings["/model"] = GetDirectoryFromPath(
			GetCurrentTemplatePath()) & "model/";
	this.mappings["/controllers"] = GetDirectoryFromPath(
			GetCurrentTemplatePath()) & "controllers/";
	this.mappings["/framework"] = GetDirectoryFromPath(
			GetCurrentTemplatePath()) & "framework/";

    this.name = "ETA";

    this.SessionManagement = true;
	this.loginStorage = "session";
    this.sessiontimeout = createTimeSpan(7,0,0,0);

    public function getEnvironment() {
        if (findNoCase("192.168.161.101", CGI.SERVER_NAME) ||
				findNoCase("localhost", CGI.SERVER_NAME) ||
				findNoCase("eta.local", CGI.SERVER_NAME)) return "dev";
        if (findNoCase("jnudev1", CGI.SERVER_NAME) ) return "test";
        if (findNoCase("web.dot.state.ak.us", CGI.SERVER_NAME) ) return "prod";
    }

	if ( getEnvironment() EQ "dev" ) {
		this.datasource = 'etadev';
		request.environment = "dev";
		variables.framework = {
			diLocation = "/model",
			error = 'main.error',
//			reload = 'reloadApplication',
			trace = true,
			reloadApplicationOnEveryRequest = true
		};
		this.mappings["/selenium"] = "/CFSelenium/";
	} else if ( getEnvironment() EQ "test" ) {
		this.datasource = 'travauth';
		request.environment = "test";
		variables.framework = {
			diLocation = "/model",
			error = 'main.error',
//			reload = 'reloadApplication',
			trace = false,
			reloadApplicationOnEveryRequest = true
		};
	} else if ( getEnvironment() EQ "prod" ) {
		this.datasource = 'travauth';
		request.environment = "prod";
		variables.framework = {
			diLocation = "/model",
			error = 'main.error',
//			reload = 'reloadApplication',
			trace = true,
			reloadApplicationOnEveryRequest = true
		};
	}

	if (structKeyExists( url, "killSession" )) {
		this.sessionTimeout = createTimeSpan( 0, 0, 0, 1 );
		createObject("component", "model.services.login").logout();
	};


	function setupApplication() {
		// for error handling and notifications
		application.developerName = "Jeremey Hustman";
		application.developerEmail = "jeremey.hustman@alaska.gov";
		application.systemEmail = "eta@alaska.gov";
	}

    /*
     * I set the login token in the session for 7 days to prevent logging out.
     */
    function setupSession() {
    	controller('security.session');
    }

    /*
     * I run the authorization script
     */
    function setupRequest() {
		if (NOT isAjaxRequest() && getEnvironment() EQ "dev") {
			application.chromelogger = new model.services.chromelogger(autoWriteHeader = false);
			application.chromelogger.log("Coldfusion Logging Active!");
		}
        request.etaVer = "0.12.0";
        request.nowStamp = CreateODBCDateTime(now());
//		rc.isLoggedIn = session.auth.isLoggedIn;
        controller('security.authorize');
    }

	function onRequestEnd() {
		if (NOT isAjaxRequest() && getEnvironment() EQ "dev") {
			application.chromelogger.writeHeader();
			application.chromelogger.reset();
			/*request.console.writeHeader();*/
		}
	}

    /*
     * I check to see if the request came across with ajax headers
     */
    private function isAjaxRequest() {
        if (structKeyExists(getHTTPRequestData().headers, "X-Requested-With")) {
            return true;
        }
        return false;
    }

	function onError(required any exception, required string eventname) {
		writeLog(file="eta-error.log", text="#arguments.exception.message# - #arguments.exception.detail#");

		savecontent variable="errordump" {
			writeDump(var="#arguments.exception#", label="Error");
		}
		savecontent variable="formdump" {
			writeDump(var="#form#", label="Form");
		}
		savecontent variable="urldump" {
			writeDump(var="#url#", label="URL");
		}

		savecontent variable="errortext" {
			writeOutput('An error occured: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br>
					Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br>
#errordump#<br>
#formdump#<br>
#urldump#<br>
					');
		}




		if ( getEnvironment() EQ "dev" ) {
			writeOutput('An error occured: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br>
					Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br>
#errordump#<br>
#formdump#<br>
#urldump#<br>
					');
		} else {
			var errorEmail = new Mail();
			errorEmail.setServer('webmailj.alaska.gov');
			errorEmail.setTo(application.developerEmail);
			errorEmail.setFrom(application.systemEmail);
			errorEmail.setSubject('Error: #arguments.exception.message#');
			errorEmail.setBody('#errortext#');
			errorEmail.setType('html');
			errorEmail.send();
			writeOutput("An error has occured and #application.developerEmail# has just been emailed containing details about the error.  <a href='http://web.dot.state.ak.us/admsvc/eta'>Click here return to the ETA home page</a><br><br>If you keep having problems, try <a href='http://web.dot.state.ak.us/admsvc/eta/index.cfm?action=login.logout'>logging out</a>.");
		}
	}


    /**
     * I override the FW/1 failure function in framework.cfc
     */
     /*
    function failure(exception = "", event = "") {
        if (StructKeyExists(exception, "rootCause")) {
            exception = exception.rootCause;
        };

        writeOutput("<h1>An error occurred on the server.</h1>");

        if (StructKeyExists(request, "failedAction")) {
            writeOutput("<p>The action #request.failedAction# failed</p>");
        }
        writeOutput("<h2>#exception.message#</h2>");
        writeOutput("<p>#exception.detail# (#exception.type#)</p>");
        writeDump(var="#exception#");
    }
    */

    /*
       <cffunction name = "onRequestEnd" returnType = "void" output="false">

       <cfif isAJAXRequest()>
       <cfsetting showDebugOutput="false" enableCFOutputOnly="true" />
       <cfparam name="request.AJAXResponse"
       default="#getPageContext().getOut().getString()#">
       <cfcontent reset= "true" />

       <cfheader name= "Expires"   value= "#now()#" />
       <cfheader name= "Pragma"    value= "no-cache" />

       <cfoutput>#trim( request.AJAXResponse )#</cfoutput>
       <cfabort />

       </cfif>

       </cffunction>
     */

}
