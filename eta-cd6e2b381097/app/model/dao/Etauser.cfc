<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the EtauserDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="model.dao.Etauser"
		hint="I am the constructor method of the EtauserDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="read" access="public" output="false" returnType="boolean"
			hint="I return the Etauser bean populated with details of a specific Etauser.">
		<cfargument name="etauser" required="true" type="model.beans.Etauser">

		<cfset var qSearch = new query()>
		<cfset var objEtauser = {}>
		<cfquery name="qSearch">
			SELECT
				USERNAME,
				DIDLOGIN,
				EIN
			FROM ETAUSER
			WHERE EIN = <cfqueryparam value="#arguments.etauser.getEIN()#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount eq 1>
			<!--- If a record has been returned for the EtauserId, create an instance of the Etauser bean and return it. --->
			<cfset arguments.etauser.init(
				username = qSearch.USERNAME,
				didlogin = qSearch.DIDLOGIN,
				ein = qSearch.EIN
			)>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="delete" access="public" output="false" returnType="boolean" hint="I delete a Etauser from the database.">
		<cfargument name="etauserId" required="true" type="numeric"
				hint="I am the Id of the Etauser you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Etauser
				where Id = <cfqueryparam value="#arguments.etauserId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="save" access="public" output="false" returnType="string"
		hint="I handle saving a Etauser, either by creating a new entry or updating an existing one.">
	    <cfargument name="Etauser" required="true" type="model.beans.Etauser" hint="I am the Etauser bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.etauser)>
	        <cfset success = updateEtauser(arguments.etauser)>
	    <cfelse>
	        <cfset success = createNewEtauser(arguments.etauser)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="update" access="public" output="false" returnType="boolean"
			hint="I update a Etausers details">
		<cfargument name="etauser" required="true" type="Etauser" hint="I am the Etauser bean.">

		<cfset var qUpdate = new Query()>
		<cftransaction action="begin">

			<cftry>

				<cfquery name="qUpdate">
					UPDATE ETAUSER
					SET
						<cfif len(#arguments.etauser.getUsername()#)>
								USERNAME = <cfqueryparam value="#arguments.etauser.getUsername()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							USERNAME = <cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.etauser.getDidlogin()#>
								DIDLOGIN = <cfqueryparam value="#arguments.etauser.getDidlogin()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							DIDLOGIN = <cfqueryparam null="true">,
						</cfif>
						EIN = <cfqueryparam value="#arguments.etauser.getEin()#" cfsqltype="cf_sql_decimal" />
					WHERE ID = <cfqueryparam value="#arguments.etauser.getId()#" cfsqltype="cf_sql_float" />
				</cfquery>
				<cfcatch type="database">
					<cftransaction action="rollback" />
					<cfreturn false />
				</cfcatch>
			</cftry>
		</cftransaction>
		<cfreturn true>
	</cffunction>

	<cffunction name="exists" access="public" output="false" returnType="boolean"
			hint="I check to see if a specific Etauser exists within the database, using the ID as a check.">
		<cfargument name="Etauser" required="true" type="model.beans.Etauser" hint="I am the Etauser bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM ETAUSER
			WHERE false = <cfqueryparam value="#arguments.Etauser.getfalse()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="create" access="private" output="false" returnType="boolean"
			hint="I insert a new record into the database.">
		<cfargument name="etauser" required="true" type="model.beans.Etauser"
				hint="I am the Etauser bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO ETAUSER
					(
							USERNAME,
							DIDLOGIN,
							EIN
					) VALUES (
						<cfif len(trim(#arguments.etauser.getUsername()#))>
							<cfqueryparam value="#arguments.etauser.getUsername()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.etauser.getDidlogin()#))>
							<cfqueryparam value="#arguments.etauser.getDidlogin()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.etauser.getEin()#" cfsqltype="cf_sql_decimal" />
					)
				</cfquery>

				<cfcatch type="database">
					<cftransaction action="rollback" />
					<cfreturn false />
				</cfcatch>
			</cftry>
		</cftransaction>

		<cfreturn true>
	</cffunction>

</cfcomponent>
