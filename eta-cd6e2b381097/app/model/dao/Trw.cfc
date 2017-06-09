<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the TrwDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the TrwDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTrw" access="public" output="false" returnType="boolean"
			hint="I return the Trw bean populated with details of a specific Trw.">
		<cfargument name="trw" required="true" type="Trw">

		<cfset var qSearch = new query()>
		<cfset var objTrw = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				FIN,
				TYPEID,
				AMOUNT,
				IRISOBJECTID,
				TAID
			FROM TRW
			WHERE ID = <cfqueryparam value="#arguments.trw.getTrwID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the TrwId, create an instance of the Trw bean and return it. --->
			<cfset arguments.trw.init(
				id = qSearch.ID,
				fin = qSearch.FIN,
				typeid = qSearch.TYPEID,
				amount = qSearch.AMOUNT,
				irisobjectid = qSearch.IRISOBJECTID,
				taid = qSearch.TAID
			)>
		</cfif>
		<cfreturn objTRW>
	</cffunction>

	<cffunction name="deleteTrwById" access="public" output="false" returnType="boolean" hint="I delete a Trw from the database.">
		<cfargument name="trwId" required="true" type="numeric"
				hint="I am the Id of the Trw you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Trw
				where Id = <cfqueryparam value="#arguments.trwId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveTrw" access="public" output="false" returnType="string"
		hint="I handle saving a Trw, either by creating a new entry or updating an existing one.">
	    <cfargument name="Trw" required="true" type="model.beans.Trw" hint="I am the Trw bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.trw)>
	        <cfset success = updateTrw(arguments.trw)>
	    <cfelse>
	        <cfset success = createNewTrw(arguments.trw)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateTrw" access="public" output="false" returnType="boolean"
			hint="I update a Trws details">
			<cfargument name="trw" required="true" type="Trw" hint="I am the Trw bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE TRW
						SET
							ID = <cfqueryparam value="#arguments.trw.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif #arguments.trw.getFin()#>
								FIN = <cfqueryparam value="#arguments.trw.getFin()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								FIN = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.trw.getTypeid()#>
								TYPEID = <cfqueryparam value="#arguments.trw.getTypeid()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TYPEID = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.trw.getAmount()#>
								AMOUNT = <cfqueryparam value="#arguments.trw.getAmount()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								AMOUNT = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.trw.getIrisobjectid()#>
								IRISOBJECTID = <cfqueryparam value="#arguments.trw.getIrisobjectid()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								IRISOBJECTID = <cfqueryparam null="true">,
							</cfif>
							TAID = <cfqueryparam value="#arguments.trw.getTaid()#" cfsqltype="cf_sql_decimal" />
						WHERE ID = <cfqueryparam value="#arguments.trw.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Trw exists within the database, using the ID as a check.">
		<cfargument name="Trw" required="true" type="model.beans.Trw" hint="I am the Trw bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM TRW
			WHERE ID = <cfqueryparam value="#arguments.Trw.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewTrw" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="trw" required="true" type="model.beans.Trw" hint="I am the Trw bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO TRW
					(
							ID,
							FIN,
							TYPEID,
							AMOUNT,
							IRISOBJECTID,
							TAID
					) VALUES (
						<cfqueryparam value="#arguments.trw.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif #arguments.trw.getFin()#>
							<cfqueryparam value="#arguments.trw.getFin()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.trw.getTypeid()#>
							<cfqueryparam value="#arguments.trw.getTypeid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.trw.getAmount()#>
							<cfqueryparam value="#arguments.trw.getAmount()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.trw.getIrisobjectid()#>
							<cfqueryparam value="#arguments.trw.getIrisobjectid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.trw.getTaid()#" cfsqltype="cf_sql_decimal" />
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