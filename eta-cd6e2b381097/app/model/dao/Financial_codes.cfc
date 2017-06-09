<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the Financial_codesDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the Financial_codesDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getFinancial_codes" access="public" output="false" returnType="boolean"
			hint="I return the Financial_codes bean populated with details of a specific Financial_codes.">
		<cfargument name="financial_codes" required="true" type="Financial_codes">

		<cfset var qSearch = new query()>
		<cfset var objFinancial_codes = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				CODE,
				TAID
			FROM FINANCIAL_CODES
			WHERE ID = <cfqueryparam value="#arguments.financial_codes.getFinancial_codesID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the Financial_codesId, create an instance of the Financial_codes bean and return it. --->
			<cfset arguments.financial_codes.init(
				id = qSearch.ID,
				code = qSearch.CODE,
				taid = qSearch.TAID
			)>
		</cfif>
		<cfreturn objFINANCIAL_CODES>
	</cffunction>

	<cffunction name="deleteFinancial_codesById" access="public" output="false" returnType="boolean" hint="I delete a Financial_codes from the database.">
		<cfargument name="financial_codesId" required="true" type="numeric"
				hint="I am the Id of the Financial_codes you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Financial_codes
				where Id = <cfqueryparam value="#arguments.financial_codesId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveFinancial_codes" access="public" output="false" returnType="string"
		hint="I handle saving a Financial_codes, either by creating a new entry or updating an existing one.">
	    <cfargument name="Financial_codes" required="true" type="model.beans.Financial_codes" hint="I am the Financial_codes bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.financial_codes)>
	        <cfset success = updateFinancial_codes(arguments.financial_codes)>
	    <cfelse>
	        <cfset success = createNewFinancial_codes(arguments.financial_codes)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateFinancial_codes" access="public" output="false" returnType="boolean"
			hint="I update a Financial_codess details">
			<cfargument name="financial_codes" required="true" type="Financial_codes" hint="I am the Financial_codes bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE FINANCIAL_CODES
						SET
							ID = <cfqueryparam value="#arguments.financial_codes.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.financial_codes.getCode()#)>
								CODE = <cfqueryparam value="#arguments.financial_codes.getCode()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								CODE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.financial_codes.getTaid()#>
								TAID = <cfqueryparam value="#arguments.financial_codes.getTaid()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								TAID = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.financial_codes.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Financial_codes exists within the database, using the ID as a check.">
		<cfargument name="Financial_codes" required="true" type="model.beans.Financial_codes" hint="I am the Financial_codes bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM FINANCIAL_CODES
			WHERE ID = <cfqueryparam value="#arguments.Financial_codes.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewFinancial_codes" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="financial_codes" required="true" type="model.beans.Financial_codes" hint="I am the Financial_codes bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO FINANCIAL_CODES
					(
							ID,
							CODE,
							TAID
					) VALUES (
						<cfqueryparam value="#arguments.financial_codes.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.financial_codes.getCode()#)>
							<cfqueryparam value="#arguments.financial_codes.getCode()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.financial_codes.getTaid()#>
							<cfqueryparam value="#arguments.financial_codes.getTaid()#" cfsqltype="cf_sql_decimal" />
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