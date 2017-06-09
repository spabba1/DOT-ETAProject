<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the OnecardDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the OnecardDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getOnecard" access="public" output="false" returnType="boolean"
			hint="I return the Onecard bean populated with details of a specific Onecard.">
		<cfargument name="onecard" required="true" type="Onecard">

		<cfset var qSearch = new query()>
		<cfset var objOnecard = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				TYPE,
				AKSASREFID,
				REFINVNUMBER,
				VENDORPVNDESC,
				AMOUNT,
				DATEPAID,
				AKSASACCT,
				AKSASBATCHNUM,
				TAID
			FROM ONECARD
			WHERE ID = <cfqueryparam value="#arguments.onecard.getOnecardID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the OnecardId, create an instance of the Onecard bean and return it. --->
			<cfset arguments.onecard.init(
				id = qSearch.ID,
				type = qSearch.TYPE,
				aksasrefid = qSearch.AKSASREFID,
				refinvnumber = qSearch.REFINVNUMBER,
				vendorpvndesc = qSearch.VENDORPVNDESC,
				amount = qSearch.AMOUNT,
				datepaid = qSearch.DATEPAID,
				aksasacct = qSearch.AKSASACCT,
				aksasbatchnum = qSearch.AKSASBATCHNUM,
				taid = qSearch.TAID
			)>
		</cfif>
		<cfreturn objONECARD>
	</cffunction>

	<cffunction name="deleteOnecardById" access="public" output="false" returnType="boolean" hint="I delete a Onecard from the database.">
		<cfargument name="onecardId" required="true" type="numeric"
				hint="I am the Id of the Onecard you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Onecard
				where Id = <cfqueryparam value="#arguments.onecardId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveOnecard" access="public" output="false" returnType="string"
		hint="I handle saving a Onecard, either by creating a new entry or updating an existing one.">
	    <cfargument name="Onecard" required="true" type="model.beans.Onecard" hint="I am the Onecard bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.onecard)>
	        <cfset success = updateOnecard(arguments.onecard)>
	    <cfelse>
	        <cfset success = createNewOnecard(arguments.onecard)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateOnecard" access="public" output="false" returnType="boolean"
			hint="I update a Onecards details">
			<cfargument name="onecard" required="true" type="Onecard" hint="I am the Onecard bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE ONECARD
						SET
							ID = <cfqueryparam value="#arguments.onecard.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.onecard.getType()#)>
								TYPE = <cfqueryparam value="#arguments.onecard.getType()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TYPE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getAksasrefid()#)>
								AKSASREFID = <cfqueryparam value="#arguments.onecard.getAksasrefid()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								AKSASREFID = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getRefinvnumber()#)>
								REFINVNUMBER = <cfqueryparam value="#arguments.onecard.getRefinvnumber()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								REFINVNUMBER = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getVendorpvndesc()#)>
								VENDORPVNDESC = <cfqueryparam value="#arguments.onecard.getVendorpvndesc()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								VENDORPVNDESC = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.onecard.getAmount()#>
								AMOUNT = <cfqueryparam value="#arguments.onecard.getAmount()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								AMOUNT = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getDatepaid()#)>
								DATEPAID = <cfqueryparam value="#arguments.onecard.getDatepaid()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								DATEPAID = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getAksasacct()#)>
								AKSASACCT = <cfqueryparam value="#arguments.onecard.getAksasacct()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								AKSASACCT = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.onecard.getAksasbatchnum()#)>
								AKSASBATCHNUM = <cfqueryparam value="#arguments.onecard.getAksasbatchnum()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								AKSASBATCHNUM = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.onecard.getTaid()#>
								TAID = <cfqueryparam value="#arguments.onecard.getTaid()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								TAID = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.onecard.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Onecard exists within the database, using the ID as a check.">
		<cfargument name="Onecard" required="true" type="model.beans.Onecard" hint="I am the Onecard bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM ONECARD
			WHERE ID = <cfqueryparam value="#arguments.Onecard.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewOnecard" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="onecard" required="true" type="model.beans.Onecard" hint="I am the Onecard bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO ONECARD
					(
							ID,
							TYPE,
							AKSASREFID,
							REFINVNUMBER,
							VENDORPVNDESC,
							AMOUNT,
							DATEPAID,
							AKSASACCT,
							AKSASBATCHNUM,
							TAID
					) VALUES (
						<cfqueryparam value="#arguments.onecard.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.onecard.getType()#)>
							<cfqueryparam value="#arguments.onecard.getType()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getAksasrefid()#)>
							<cfqueryparam value="#arguments.onecard.getAksasrefid()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getRefinvnumber()#)>
							<cfqueryparam value="#arguments.onecard.getRefinvnumber()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getVendorpvndesc()#)>
							<cfqueryparam value="#arguments.onecard.getVendorpvndesc()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.onecard.getAmount()#>
							<cfqueryparam value="#arguments.onecard.getAmount()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getDatepaid()#)>
							<cfqueryparam value="#arguments.onecard.getDatepaid()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getAksasacct()#)>
							<cfqueryparam value="#arguments.onecard.getAksasacct()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.onecard.getAksasbatchnum()#)>
							<cfqueryparam value="#arguments.onecard.getAksasbatchnum()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.onecard.getTaid()#>
							<cfqueryparam value="#arguments.onecard.getTaid()#" cfsqltype="cf_sql_decimal" />
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