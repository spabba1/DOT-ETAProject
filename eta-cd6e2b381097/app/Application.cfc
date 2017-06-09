component {

	request.nowstamp = CreateODBCDateTime(now());

	request.appVersion = "0.11.0";

	this.mappings["/model"] = GetDirectoryFromPath(GetCurrentTemplatePath()) & "model/";
	this.mappings["/logbox"] = GetDirectoryFromPath(GetCurrentTemplatePath()) & "logbox/";

    public string function getEnvironment() {
        if (findNoCase("192.168.161.101", CGI.SERVER_NAME) ||
				findNoCase("localhost", CGI.SERVER_NAME) ||
				findNoCase("eta.local", CGI.SERVER_NAME)) return "dev";
        if (findNoCase("jnudev1", CGI.SERVER_NAME) ) return "test";
        if (findNoCase("web.dot.state.ak.us", CGI.SERVER_NAME) ) return "prod";
    }

	if ( getEnvironment() EQ "dev" ) {
		this.datasource = 'etadev';
		request.environment = "dev";
		request.thisWorkflowName = "eta_dev_workflow";
		this.mappings["/selenium"] = "/CFSelenium/";
	} else if ( getEnvironment() EQ "test" ) {
		this.datasource = 'travauth';
		request.environment = "test";
		request.thisWorkflowName = "eta_test_workflow";
	} else if ( getEnvironment() EQ "prod" ) {
		this.datasource = 'travauth';
		request.environment = "prod";
		request.thisWorkflowName = "eta_workflow";
	}

	// for error handling and notifications

	public boolean function onRequestStart() {
		request.developerName = "Jeremey Hustman";
		request.developerEmail = "jeremey.hustman@alaska.gov";
		request.systemEmail = "noreply@alaska.gov";
		request.mailServer = "webmailj.alaska.gov";

		return true;
	}

	public boolean function onApplicationStart() {
		var i = 1;

		// LogBox Configuration

		// LogBoxConfig = new logbox.system.logging.config.LogBoxConfig(CFCConfigPath="model.LogBox");
		// application.logBox = new logbox.system.logging.LogBox(LogBoxConfig);

		var services = directoryList('#this.mappings["/model"]#/services', false, "query");
		for (i; i <= services.recordCount; i += 1) {
			var list = listfirst(services.name[i], ".");
			"application.#LCase(list)#Service" = evaluate("new model.services.#list#().init()");
		}

		return true;
	}
}
