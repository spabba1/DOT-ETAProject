<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the IrisobjectDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the IrisobjectDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getIrisobject" access="public" output="false" returnType="boolean"
			hint="I return the Irisobject bean populated with details of a specific Irisobject.">
		<cfargument name="irisobject" required="true" type="Irisobject">

		<cfset var qSearch = new query()>
		<cfset var objIrisobject = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				DESCRIPTION,
				INSTATE,
				OUTSTATE
			FROM IRISOBJECT
			WHERE ID = <cfqueryparam value="#arguments.irisobject.getIrisobjectID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the IrisobjectId, create an instance of the Irisobject bean and return it. --->
			<cfset arguments.irisobject.init(
				id = qSearch.ID,
				description = qSearch.DESCRIPTION,
				instate = qSearch.INSTATE,
				outstate = qSearch.OUTSTATE
			)>
		</cfif>
		<cfreturn objIRISOBJECT>
	</cffunction>

	<cffunction name="deleteIrisobjectById" access="public" output="false" returnType="boolean" hint="I delete a Irisobject from the database.">
		<cfargument name="irisobjectId" required="true" type="numeric"
				hint="I am the Id of the Irisobject you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Irisobject
				where Id = <cfqueryparam value="#arguments.irisobjectId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveIrisobject" access="public" output="false" returnType="string"
		hint="I handle saving a Irisobject, either by creating a new entry or updating an existing one.">
	    <cfargument name="Irisobject" required="true" type="model.beans.Irisobject" hint="I am the Irisobject bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.irisobject)>
	        <cfset success = updateIrisobject(arguments.irisobject)>
	    <cfelse>
	        <cfset success = createNewIrisobject(arguments.irisobject)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateIrisobject" access="public" output="false" returnType="boolean"
			hint="I update a Irisobjects details">
			<cfargument name="irisobject" required="true" type="Irisobject" hint="I am the Irisobject bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE IRISOBJECT
						SET
							ID = <cfqueryparam value="#arguments.irisobject.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.irisobject.getDescription()#)>
								DESCRIPTION = <cfqueryparam value="#arguments.irisobject.getDescription()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DESCRIPTION = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.irisobject.getInstate()#>
								INSTATE = <cfqueryparam value="#arguments.irisobject.getInstate()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								INSTATE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.irisobject.getOutstate()#>
								OUTSTATE = <cfqueryparam value="#arguments.irisobject.getOutstate()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								OUTSTATE = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.irisobject.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Irisobject exists within the database, using the ID as a check.">
		<cfargument name="Irisobject" required="true" type="model.beans.Irisobject" hint="I am the Irisobject bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM IRISOBJECT
			WHERE ID = <cfqueryparam value="#arguments.Irisobject.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewIrisobject" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="irisobject" required="true" type="model.beans.Irisobject" hint="I am the Irisobject bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO IRISOBJECT
					(
							ID,
							DESCRIPTION,
							INSTATE,
							OUTSTATE
					) VALUES (
						<cfqueryparam value="#arguments.irisobject.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.irisobject.getDescription()#)>
							<cfqueryparam value="#arguments.irisobject.getDescription()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.irisobject.getInstate()#>
							<cfqueryparam value="#arguments.irisobject.getInstate()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.irisobject.getOutstate()#>
							<cfqueryparam value="#arguments.irisobject.getOutstate()#" cfsqltype="cf_sql_decimal" />
						<cfelse>
							<cfqueryparam null="true">
						</cfif>
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