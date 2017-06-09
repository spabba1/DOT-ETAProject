component accessors="true" {

	property personService;
	property staffService;

	function init(required fw) {
		variables.fw = arguments.fw;
		return this;
	}

	/**
	 * Check if the user is in the staff list index.cfm?action=staff.list
	 * returns struct
	 * ======================================================
	 * | workflowStaff.isAdmin = true or false             |
	 * | workflowStaff.staffRole = staff role description  |
	 * ======================================================
	 */
	public void function default(required rc) {
		// writeDump(rc);
		rc.staffDetails = {};
		rc.pagetitle = "ETA Home | ";
		if (isUserLoggedIn()) {
			rc.userId = personService.getEinByUsername(getAuthUser());
		}
		/*if (structKeyExists(session.auth, 'user')) {
			rc.userId = session.auth.user.employeeNumber;
		}*/
		var workflowStaff = variables.staffService.isAdmin(rc.userId);
		rc.isAdmin = workflowStaff.isAdmin;
		rc.staffRole = workflowStaff.staffRole;
	}


/*
	<cffunction name="default" output="false">
		<cfargument name="rc" required="true">
		<!---<cfset request.console.log(#getPageContext().getCFScopes()#)>--->
		<cfset rc.staffDetails = {}>
		<cfset rc.pagetitle = "ETA Home | ">

		<cfif structKeyExists(session.auth, 'user')>
			<cfset rc.userId = session.auth.user.employeeNumber>
		</cfif>
		<cfset var workflowStaff = variables.staffservice.isAdmin(rc.userId)>

		<cfset rc.isAdmin = workflowStaff.isAdmin>
		<cfset rc.staffRole = workflowStaff.staffRole>
	</cffunction>
*/
		public void function makedocs() {

			var cdoc = new colddoc.ColdDoc().init();
			var strategy = new colddoc.strategy.api.HTMLAPIStrategy(expandPath("docs/cf"), "eTA #request.etaVer#");

			cdoc.setStrategy(strategy);

			var paths = [
				{
					inputDir = expandPath("controllers"),inputmapping = "controllers"
				},
				{
					inputDir = expandPath("model/beans"),inputmapping = "model.beans"
				},
				{
					inputDir = expandPath("model/services"),inputmapping = "model.services"
				},
				{
					inputDir = expandPath("framework"),inputmapping = "framework"
				}
			];

			cdoc.generate(paths);

			/*coldDoc.generate(expandPath("/eta"), "eta");*/

		}

		public void function java() output="false" {



		}
}
