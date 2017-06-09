<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the OutofstateDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the OutofstateDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getOutofstate" access="public" output="false" returnType="boolean"
			hint="I return the Outofstate bean populated with details of a specific Outofstate.">
		<cfargument name="outofstate" required="true" type="Outofstate">

		<cfset var qSearch = new query()>
		<cfset var objOutofstate = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				CONFNAME,
				GOAL,
				LOCALOPTION,
				LOCALOPTIONREASON,
				BENEFICIAL,
				SHARING,
				GROUPABLE,
				DEBRIEF,
				COMMENTS,
				TAID
			FROM OUTOFSTATE
			WHERE ID = <cfqueryparam value="#arguments.outofstate.getOutofstateID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the OutofstateId, create an instance of the Outofstate bean and return it. --->
			<cfset arguments.outofstate.init(
				id = qSearch.ID,
				confname = qSearch.CONFNAME,
				goal = qSearch.GOAL,
				localoption = qSearch.LOCALOPTION,
				localoptionreason = qSearch.LOCALOPTIONREASON,
				beneficial = qSearch.BENEFICIAL,
				sharing = qSearch.SHARING,
				groupable = qSearch.GROUPABLE,
				debrief = qSearch.DEBRIEF,
				comments = qSearch.COMMENTS,
				taid = qSearch.TAID
			)>
		</cfif>
		<cfreturn objOUTOFSTATE>
	</cffunction>

	<cffunction name="deleteOutofstateById" access="public" output="false" returnType="boolean" hint="I delete a Outofstate from the database.">
		<cfargument name="outofstateId" required="true" type="numeric"
				hint="I am the Id of the Outofstate you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Outofstate
				where Id = <cfqueryparam value="#arguments.outofstateId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveOutofstate" access="public" output="false" returnType="string"
		hint="I handle saving a Outofstate, either by creating a new entry or updating an existing one.">
	    <cfargument name="Outofstate" required="true" type="model.beans.Outofstate" hint="I am the Outofstate bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.outofstate)>
	        <cfset success = updateOutofstate(arguments.outofstate)>
	    <cfelse>
	        <cfset success = createNewOutofstate(arguments.outofstate)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateOutofstate" access="public" output="false" returnType="boolean"
			hint="I update a Outofstates details">
			<cfargument name="outofstate" required="true" type="Outofstate" hint="I am the Outofstate bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE OUTOFSTATE
						SET
							ID = <cfqueryparam value="#arguments.outofstate.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.outofstate.getConfname()#)>
								CONFNAME = <cfqueryparam value="#arguments.outofstate.getConfname()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								CONFNAME = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.outofstate.getGoal()#)>
								GOAL = <cfqueryparam value="#arguments.outofstate.getGoal()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								GOAL = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.outofstate.getLocaloption()#>
								LOCALOPTION = <cfqueryparam value="#arguments.outofstate.getLocaloption()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								LOCALOPTION = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.outofstate.getLocaloptionreason()#)>
								LOCALOPTIONREASON = <cfqueryparam value="#arguments.outofstate.getLocaloptionreason()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								LOCALOPTIONREASON = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.outofstate.getBeneficial()#)>
								BENEFICIAL = <cfqueryparam value="#arguments.outofstate.getBeneficial()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								BENEFICIAL = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.outofstate.getSharing()#)>
								SHARING = <cfqueryparam value="#arguments.outofstate.getSharing()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								SHARING = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.outofstate.getGroupable()#>
								GROUPABLE = <cfqueryparam value="#arguments.outofstate.getGroupable()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								GROUPABLE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.outofstate.getDebrief()#>
								DEBRIEF = <cfqueryparam value="#arguments.outofstate.getDebrief()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								DEBRIEF = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.outofstate.getComments()#)>
								COMMENTS = <cfqueryparam value="#arguments.outofstate.getComments()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								COMMENTS = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.outofstate.getTaid()#>
								TAID = <cfqueryparam value="#arguments.outofstate.getTaid()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								TAID = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.outofstate.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Outofstate exists within the database, using the ID as a check.">
		<cfargument name="Outofstate" required="true" type="model.beans.Outofstate" hint="I am the Outofstate bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM OUTOFSTATE
			WHERE ID = <cfqueryparam value="#arguments.Outofstate.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewOutofstate" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="outofstate" required="true" type="model.beans.Outofstate" hint="I am the Outofstate bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO OUTOFSTATE
					(
							ID,
							CONFNAME,
							GOAL,
							LOCALOPTION,
							LOCALOPTIONREASON,
							BENEFICIAL,
							SHARING,
							GROUPABLE,
							DEBRIEF,
							COMMENTS,
							TAID
					) VALUES (
						<cfqueryparam value="#arguments.outofstate.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.outofstate.getConfname()#)>
							<cfqueryparam value="#arguments.outofstate.getConfname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.outofstate.getGoal()#)>
							<cfqueryparam value="#arguments.outofstate.getGoal()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.outofstate.getLocaloption()#>
							<cfqueryparam value="#arguments.outofstate.getLocaloption()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.outofstate.getLocaloptionreason()#)>
							<cfqueryparam value="#arguments.outofstate.getLocaloptionreason()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.outofstate.getBeneficial()#)>
							<cfqueryparam value="#arguments.outofstate.getBeneficial()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.outofstate.getSharing()#)>
							<cfqueryparam value="#arguments.outofstate.getSharing()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.outofstate.getGroupable()#>
							<cfqueryparam value="#arguments.outofstate.getGroupable()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.outofstate.getDebrief()#>
							<cfqueryparam value="#arguments.outofstate.getDebrief()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.outofstate.getComments()#)>
							<cfqueryparam value="#arguments.outofstate.getComments()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.outofstate.getTaid()#>
							<cfqueryparam value="#arguments.outofstate.getTaid()#" cfsqltype="cf_sql_decimal" />
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