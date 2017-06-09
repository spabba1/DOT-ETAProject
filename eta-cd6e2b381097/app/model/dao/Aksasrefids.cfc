<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the AksasrefidsDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the AksasrefidsDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getAksasrefids" access="public" output="false" returnType="boolean"
			hint="I return the Aksasrefids bean populated with details of a specific Aksasrefids.">
		<cfargument name="aksasrefids" required="true" type="Aksasrefids">

		<cfset var qSearch = new query()>
		<cfset var objAksasrefids = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				NAME
			FROM AKSASREFIDS
			WHERE ID = <cfqueryparam value="#arguments.aksasrefids.getAksasrefidsID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the AksasrefidsId, create an instance of the Aksasrefids bean and return it. --->
			<cfset arguments.aksasrefids.init(
				id = qSearch.ID,
				name = qSearch.NAME
			)>
		</cfif>
		<cfreturn objAKSASREFIDS>
	</cffunction>

	<cffunction name="deleteAksasrefidsById" access="public" output="false" returnType="boolean" hint="I delete a Aksasrefids from the database.">
		<cfargument name="aksasrefidsId" required="true" type="numeric"
				hint="I am the Id of the Aksasrefids you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Aksasrefids
				where Id = <cfqueryparam value="#arguments.aksasrefidsId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveAksasrefids" access="public" output="false" returnType="string"
		hint="I handle saving a Aksasrefids, either by creating a new entry or updating an existing one.">
	    <cfargument name="Aksasrefids" required="true" type="model.beans.Aksasrefids" hint="I am the Aksasrefids bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.aksasrefids)>
	        <cfset success = updateAksasrefids(arguments.aksasrefids)>
	    <cfelse>
	        <cfset success = createNewAksasrefids(arguments.aksasrefids)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateAksasrefids" access="public" output="false" returnType="boolean"
			hint="I update a Aksasrefidss details">
			<cfargument name="aksasrefids" required="true" type="Aksasrefids" hint="I am the Aksasrefids bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE AKSASREFIDS
						SET
							ID = <cfqueryparam value="#arguments.aksasrefids.getId()#" cfsqltype="cf_sql_decimal" />,
							NAME = <cfqueryparam value="#arguments.aksasrefids.getName()#" cfsqltype="cf_sql_varchar" />
						WHERE ID = <cfqueryparam value="#arguments.aksasrefids.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Aksasrefids exists within the database, using the ID as a check.">
		<cfargument name="Aksasrefids" required="true" type="model.beans.Aksasrefids" hint="I am the Aksasrefids bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM AKSASREFIDS
			WHERE ID = <cfqueryparam value="#arguments.Aksasrefids.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewAksasrefids" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="aksasrefids" required="true" type="model.beans.Aksasrefids" hint="I am the Aksasrefids bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO AKSASREFIDS
					(
							ID,
							NAME
					) VALUES (
						<cfqueryparam value="#arguments.aksasrefids.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.aksasrefids.getName()#" cfsqltype="cf_sql_varchar" />
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