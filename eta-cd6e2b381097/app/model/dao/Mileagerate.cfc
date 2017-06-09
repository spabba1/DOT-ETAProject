<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the MileagerateDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the MileagerateDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getMileagerate" access="public" output="false" returnType="boolean"
			hint="I return the Mileagerate bean populated with details of a specific Mileagerate.">
		<cfargument name="mileagerate" required="true" type="Mileagerate">

		<cfset var qSearch = new query()>
		<cfset var objMileagerate = {}>
		<cfquery name="qSearch">
			SELECT
				MILEAGERATE,
				EFFECTIVEDATE,
				CHANGEDBY,
				ID
			FROM MILEAGERATE
			WHERE ID = <cfqueryparam value="#arguments.mileagerate.getMileagerateID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the MileagerateId, create an instance of the Mileagerate bean and return it. --->
			<cfset arguments.mileagerate.init(
				mileagerate = qSearch.MILEAGERATE,
				effectivedate = qSearch.EFFECTIVEDATE,
				changedby = qSearch.CHANGEDBY,
				id = qSearch.ID
			)>
		</cfif>
		<cfreturn objMILEAGERATE>
	</cffunction>

	<cffunction name="deleteMileagerateById" access="public" output="false" returnType="boolean" hint="I delete a Mileagerate from the database.">
		<cfargument name="mileagerateId" required="true" type="numeric"
				hint="I am the Id of the Mileagerate you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Mileagerate
				where Id = <cfqueryparam value="#arguments.mileagerateId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveMileagerate" access="public" output="false" returnType="string"
		hint="I handle saving a Mileagerate, either by creating a new entry or updating an existing one.">
	    <cfargument name="Mileagerate" required="true" type="model.beans.Mileagerate" hint="I am the Mileagerate bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.mileagerate)>
	        <cfset success = updateMileagerate(arguments.mileagerate)>
	    <cfelse>
	        <cfset success = createNewMileagerate(arguments.mileagerate)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateMileagerate" access="public" output="false" returnType="boolean"
			hint="I update a Mileagerates details">
			<cfargument name="mileagerate" required="true" type="Mileagerate" hint="I am the Mileagerate bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE MILEAGERATE
						SET
							MILEAGERATE = <cfqueryparam value="#arguments.mileagerate.getMileagerate()#" cfsqltype="cf_sql_decimal" />,
							EFFECTIVEDATE = <cfqueryparam value="#arguments.mileagerate.getEffectivedate()#" cfsqltype="cf_sql_timestamp" />,
							CHANGEDBY = <cfqueryparam value="#arguments.mileagerate.getChangedby()#" cfsqltype="cf_sql_decimal" />,
							ID = <cfqueryparam value="#arguments.mileagerate.getId()#" cfsqltype="cf_sql_float" />
						WHERE ID = <cfqueryparam value="#arguments.mileagerate.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Mileagerate exists within the database, using the ID as a check.">
		<cfargument name="Mileagerate" required="true" type="model.beans.Mileagerate" hint="I am the Mileagerate bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM MILEAGERATE
			WHERE ID = <cfqueryparam value="#arguments.Mileagerate.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewMileagerate" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="mileagerate" required="true" type="model.beans.Mileagerate" hint="I am the Mileagerate bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO MILEAGERATE
					(
							MILEAGERATE,
							EFFECTIVEDATE,
							CHANGEDBY,
							ID
					) VALUES (
						<cfqueryparam value="#arguments.mileagerate.getMileagerate()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.mileagerate.getEffectivedate()#" cfsqltype="cf_sql_timestamp" />,
						<cfqueryparam value="#arguments.mileagerate.getChangedby()#" cfsqltype="cf_sql_decimal" />,
						<cfqueryparam value="#arguments.mileagerate.getId()#" cfsqltype="cf_sql_float" />
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