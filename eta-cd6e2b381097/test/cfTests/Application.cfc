/**
* Copyright Since 2005 Ortus Solutions, Corp
* www.coldbox.org | www.luismajano.com | www.ortussolutions.com | www.gocontentbox.org
**************************************************************************************
*/
component{
	this.name = "ETA_Test_Browser_" & hash(getCurrentTemplatePath());
	this.datasource = "etadev";

	// any other application.cfc stuff goes below:
	this.sessionManagement = true;

	// any mappings go here, we create one that points to the root called test.
	variables.here = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings['/test'] = getDirectoryFromPath( getCurrentTemplatePath() );
	this.mappings['/model'] = variables.here & "./../../app/model";
	/*this.mappings['/views'] = variables.here & "../../../app/views";*/
	this.mappings['/testbox'] = variables.here & "../../../TestBox";

	// any orm definitions go here.

	// request start
	public boolean function onRequestStart( String targetPage ){
		request.developerName = "Jeremey Hustman";
		request.developerEmail = "jeremey.hustman@alaska.gov";
		request.systemEmail = "noreply@alaska.gov";
		request.mailServer = "webmailj.alaska.gov";
		return true;
	}
}
