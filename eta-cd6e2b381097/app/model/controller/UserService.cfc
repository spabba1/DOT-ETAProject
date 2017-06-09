<cfcomponent displayName="UserService" output="false"
		hint="This is an example of a User Service that MockBox uses for testing.  Not any use in ETA.">

	<cffunction name="init" returnType="UserService" output="false" hint="Initialization">
		<cfargument name="transfer" hint="variable transfer" type="any" required="true">
		<cfargument name="sessionStorage" hint="variable sessionStorage" type="any" required="true">
		<cfargument name="userDAO" hint="variable userDAO" type="any" required="true">

		<cfscript>
			var instance = {};
			instance.transfer = arguments.transfer;
			instance.sessionStorage = arguments.sessionStorage;
			instance.userDAO = arguments.userDAO;

			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getData" returnType="query" output="false" hint="Gets data.">
		<cfreturn instance.userDAO.getData()>
	</cffunction>

</cfcomponent>
