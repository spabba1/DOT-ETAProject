<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the TaDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the TaDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTa" access="public" output="false" returnType="boolean"
			hint="I return the Ta bean populated with details of a specific Ta.">
		<cfargument name="ta" required="true" type="Ta">

		<cfset var qSearch = new query()>
		<cfset var objTa = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				FISCALYEAR,
				TANUMBER,
				EE,
				INSTATE,
				PHYSADDR,
				WARRANTADDR,
				PVN,
				TRAVELERNAME,
				TITLE,
				DEPT,
				DIV,
				BU,
				DUTYSTATION,
				HOMEADDRESS,
				HOMECITY,
				HOMESTATE,
				HOMEZIP,
				WORKDAYS,
				WORKTIME,
				DESTINATION,
				TRAVPREF,
				DEPARTUREFROM,
				DEPARTUREDATE,
				RETURNDATE,
				PURPOSE,
				ESTCOST,
				ACTUALSREQ,
				TRAVADV,
				PERSTRAV,
				PERSTRAVBEGIN,
				PERSTRAVEND,
				PERSTRAVAIRFARE,
				STATEAUTHTRV,
				HOTELINC,
				CARINC,
				CONFCOM,
				SUPERVISOR,
				ISSUBMITTED,
				SPECIALINST,
				CREATED,
				UPDATED,
				SUBMITTED,
				DELETED,
				TRAVELERID,
				PREPARERID,
				TRAVADVWN,
				TRAVADVWNAMT,
				ATMWITHDRAWAL,
				EDOCSID,
				EDOCSNAME,
				DESTINATIONTO,
				ESTIMATORID,
				TAXTRAVNONTAX,
				TAXTRAVTAXABLE,
				TAXTRAVTOTAL,
				PROCESSID,
				MILEAGERATE,
				OOPTOTALS,
				TOTALDUE,
				TOTALTRIPEXPENSE
			FROM TA
			WHERE ID = <cfqueryparam value="#arguments.ta.getTaID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the TaId, create an instance of the Ta bean and return it. --->
			<cfset arguments.ta.init(
				id = qSearch.ID,
				fiscalyear = qSearch.FISCALYEAR,
				tanumber = qSearch.TANUMBER,
				ee = qSearch.EE,
				instate = qSearch.INSTATE,
				physaddr = qSearch.PHYSADDR,
				warrantaddr = qSearch.WARRANTADDR,
				pvn = qSearch.PVN,
				travelername = qSearch.TRAVELERNAME,
				title = qSearch.TITLE,
				dept = qSearch.DEPT,
				div = qSearch.DIV,
				bu = qSearch.BU,
				dutystation = qSearch.DUTYSTATION,
				homeaddress = qSearch.HOMEADDRESS,
				homecity = qSearch.HOMECITY,
				homestate = qSearch.HOMESTATE,
				homezip = qSearch.HOMEZIP,
				workdays = qSearch.WORKDAYS,
				worktime = qSearch.WORKTIME,
				destination = qSearch.DESTINATION,
				travpref = qSearch.TRAVPREF,
				departurefrom = qSearch.DEPARTUREFROM,
				departuredate = qSearch.DEPARTUREDATE,
				returndate = qSearch.RETURNDATE,
				purpose = qSearch.PURPOSE,
				estcost = qSearch.ESTCOST,
				actualsreq = qSearch.ACTUALSREQ,
				travadv = qSearch.TRAVADV,
				perstrav = qSearch.PERSTRAV,
				perstravbegin = qSearch.PERSTRAVBEGIN,
				perstravend = qSearch.PERSTRAVEND,
				perstravairfare = qSearch.PERSTRAVAIRFARE,
				stateauthtrv = qSearch.STATEAUTHTRV,
				hotelinc = qSearch.HOTELINC,
				carinc = qSearch.CARINC,
				confcom = qSearch.CONFCOM,
				supervisor = qSearch.SUPERVISOR,
				issubmitted = qSearch.ISSUBMITTED,
				specialinst = qSearch.SPECIALINST,
				created = qSearch.CREATED,
				updated = qSearch.UPDATED,
				submitted = qSearch.SUBMITTED,
				deleted = qSearch.DELETED,
				travelerid = qSearch.TRAVELERID,
				preparerid = qSearch.PREPARERID,
				travadvwn = qSearch.TRAVADVWN,
				travadvwnamt = qSearch.TRAVADVWNAMT,
				atmwithdrawal = qSearch.ATMWITHDRAWAL,
				edocsid = qSearch.EDOCSID,
				edocsname = qSearch.EDOCSNAME,
				destinationto = qSearch.DESTINATIONTO,
				estimatorid = qSearch.ESTIMATORID,
				taxtravnontax = qSearch.TAXTRAVNONTAX,
				taxtravtaxable = qSearch.TAXTRAVTAXABLE,
				taxtravtotal = qSearch.TAXTRAVTOTAL,
				processid = qSearch.PROCESSID,
				mileagerate = qSearch.MILEAGERATE,
				ooptotals = qSearch.OOPTOTALS,
				totaldue = qSearch.TOTALDUE,
				totaltripexpense = qSearch.TOTALTRIPEXPENSE
			)>
		</cfif>
		<cfreturn objTA>
	</cffunction>

	<cffunction name="deleteTaById" access="public" output="false" returnType="boolean" hint="I delete a Ta from the database.">
		<cfargument name="taId" required="true" type="numeric"
				hint="I am the Id of the Ta you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Ta
				where Id = <cfqueryparam value="#arguments.taId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveTa" access="public" output="false" returnType="string"
		hint="I handle saving a Ta, either by creating a new entry or updating an existing one.">
	    <cfargument name="Ta" required="true" type="model.beans.Ta" hint="I am the Ta bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.ta)>
	        <cfset success = updateTa(arguments.ta)>
	    <cfelse>
	        <cfset success = createNewTa(arguments.ta)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateTa" access="public" output="false" returnType="boolean"
			hint="I update a Tas details">
			<cfargument name="ta" required="true" type="Ta" hint="I am the Ta bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE TA
						SET
							ID = <cfqueryparam value="#arguments.ta.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif #arguments.ta.getFiscalyear()#>
								FISCALYEAR = <cfqueryparam value="#arguments.ta.getFiscalyear()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								FISCALYEAR = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getTanumber()#)>
								TANUMBER = <cfqueryparam value="#arguments.ta.getTanumber()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TANUMBER = <cfqueryparam null="true">,
							</cfif>
							EE = <cfqueryparam value="#arguments.ta.getEe()#" cfsqltype="cf_sql_char" />,
							INSTATE = <cfqueryparam value="#arguments.ta.getInstate()#" cfsqltype="cf_sql_char" />,
							PHYSADDR = <cfqueryparam value="#arguments.ta.getPhysaddr()#" cfsqltype="cf_sql_char" />,
							WARRANTADDR = <cfqueryparam value="#arguments.ta.getWarrantaddr()#" cfsqltype="cf_sql_char" />,
							<cfif len(#arguments.ta.getPvn()#)>
								PVN = <cfqueryparam value="#arguments.ta.getPvn()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								PVN = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getTravelername()#)>
								TRAVELERNAME = <cfqueryparam value="#arguments.ta.getTravelername()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TRAVELERNAME = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getTitle()#)>
								TITLE = <cfqueryparam value="#arguments.ta.getTitle()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TITLE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDept()#)>
								DEPT = <cfqueryparam value="#arguments.ta.getDept()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DEPT = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDiv()#)>
								DIV = <cfqueryparam value="#arguments.ta.getDiv()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DIV = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getBu()#)>
								BU = <cfqueryparam value="#arguments.ta.getBu()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								BU = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDutystation()#)>
								DUTYSTATION = <cfqueryparam value="#arguments.ta.getDutystation()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DUTYSTATION = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getHomeaddress()#)>
								HOMEADDRESS = <cfqueryparam value="#arguments.ta.getHomeaddress()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								HOMEADDRESS = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getHomecity()#)>
								HOMECITY = <cfqueryparam value="#arguments.ta.getHomecity()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								HOMECITY = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getHomestate()#)>
								HOMESTATE = <cfqueryparam value="#arguments.ta.getHomestate()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								HOMESTATE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getHomezip()#)>
								HOMEZIP = <cfqueryparam value="#arguments.ta.getHomezip()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								HOMEZIP = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getWorkdays()#)>
								WORKDAYS = <cfqueryparam value="#arguments.ta.getWorkdays()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								WORKDAYS = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getWorktime()#)>
								WORKTIME = <cfqueryparam value="#arguments.ta.getWorktime()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								WORKTIME = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDestination()#)>
								DESTINATION = <cfqueryparam value="#arguments.ta.getDestination()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DESTINATION = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getTravpref()#)>
								TRAVPREF = <cfqueryparam value="#arguments.ta.getTravpref()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TRAVPREF = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDeparturefrom()#)>
								DEPARTUREFROM = <cfqueryparam value="#arguments.ta.getDeparturefrom()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DEPARTUREFROM = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDeparturedate()#)>
								DEPARTUREDATE = <cfqueryparam value="#arguments.ta.getDeparturedate()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								DEPARTUREDATE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getReturndate()#)>
								RETURNDATE = <cfqueryparam value="#arguments.ta.getReturndate()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								RETURNDATE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getPurpose()#)>
								PURPOSE = <cfqueryparam value="#arguments.ta.getPurpose()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								PURPOSE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getEstcost()#>
								ESTCOST = <cfqueryparam value="#arguments.ta.getEstcost()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								ESTCOST = <cfqueryparam null="true">,
							</cfif>
							ACTUALSREQ = <cfqueryparam value="#arguments.ta.getActualsreq()#" cfsqltype="cf_sql_char" />,
							TRAVADV = <cfqueryparam value="#arguments.ta.getTravadv()#" cfsqltype="cf_sql_char" />,
							PERSTRAV = <cfqueryparam value="#arguments.ta.getPerstrav()#" cfsqltype="cf_sql_char" />,
							<cfif len(#arguments.ta.getPerstravbegin()#)>
								PERSTRAVBEGIN = <cfqueryparam value="#arguments.ta.getPerstravbegin()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								PERSTRAVBEGIN = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getPerstravend()#)>
								PERSTRAVEND = <cfqueryparam value="#arguments.ta.getPerstravend()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								PERSTRAVEND = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getPerstravairfare()#>
								PERSTRAVAIRFARE = <cfqueryparam value="#arguments.ta.getPerstravairfare()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								PERSTRAVAIRFARE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getStateauthtrv()#)>
								STATEAUTHTRV = <cfqueryparam value="#arguments.ta.getStateauthtrv()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								STATEAUTHTRV = <cfqueryparam null="true">,
							</cfif>
							HOTELINC = <cfqueryparam value="#arguments.ta.getHotelinc()#" cfsqltype="cf_sql_char" />,
							CARINC = <cfqueryparam value="#arguments.ta.getCarinc()#" cfsqltype="cf_sql_char" />,
							<cfif len(#arguments.ta.getConfcom()#)>
								CONFCOM = <cfqueryparam value="#arguments.ta.getConfcom()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								CONFCOM = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getSupervisor()#)>
								SUPERVISOR = <cfqueryparam value="#arguments.ta.getSupervisor()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								SUPERVISOR = <cfqueryparam null="true">,
							</cfif>
							ISSUBMITTED = <cfqueryparam value="#arguments.ta.getIssubmitted()#" cfsqltype="cf_sql_char" />,
							<cfif len(#arguments.ta.getSpecialinst()#)>
								SPECIALINST = <cfqueryparam value="#arguments.ta.getSpecialinst()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								SPECIALINST = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getCreated()#)>
								CREATED = <cfqueryparam value="#arguments.ta.getCreated()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								CREATED = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getUpdated()#)>
								UPDATED = <cfqueryparam value="#arguments.ta.getUpdated()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								UPDATED = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getSubmitted()#)>
								SUBMITTED = <cfqueryparam value="#arguments.ta.getSubmitted()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								SUBMITTED = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDeleted()#)>
								DELETED = <cfqueryparam value="#arguments.ta.getDeleted()#" cfsqltype="cf_sql_timestamp" />,
							<cfelse>
								DELETED = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTravelerid()#>
								TRAVELERID = <cfqueryparam value="#arguments.ta.getTravelerid()#" cfsqltype="cf_sql_float" />,
							<cfelse>
								TRAVELERID = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getPreparerid()#>
								PREPARERID = <cfqueryparam value="#arguments.ta.getPreparerid()#" cfsqltype="cf_sql_float" />,
							<cfelse>
								PREPARERID = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getTravadvwn()#)>
								TRAVADVWN = <cfqueryparam value="#arguments.ta.getTravadvwn()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								TRAVADVWN = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTravadvwnamt()#>
								TRAVADVWNAMT = <cfqueryparam value="#arguments.ta.getTravadvwnamt()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TRAVADVWNAMT = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getAtmwithdrawal()#>
								ATMWITHDRAWAL = <cfqueryparam value="#arguments.ta.getAtmwithdrawal()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								ATMWITHDRAWAL = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getEdocsid()#)>
								EDOCSID = <cfqueryparam value="#arguments.ta.getEdocsid()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								EDOCSID = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getEdocsname()#)>
								EDOCSNAME = <cfqueryparam value="#arguments.ta.getEdocsname()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								EDOCSNAME = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.ta.getDestinationto()#)>
								DESTINATIONTO = <cfqueryparam value="#arguments.ta.getDestinationto()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								DESTINATIONTO = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getEstimatorid()#>
								ESTIMATORID = <cfqueryparam value="#arguments.ta.getEstimatorid()#" cfsqltype="cf_sql_float" />,
							<cfelse>
								ESTIMATORID = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTaxtravnontax()#>
								TAXTRAVNONTAX = <cfqueryparam value="#arguments.ta.getTaxtravnontax()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TAXTRAVNONTAX = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTaxtravtaxable()#>
								TAXTRAVTAXABLE = <cfqueryparam value="#arguments.ta.getTaxtravtaxable()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TAXTRAVTAXABLE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTaxtravtotal()#>
								TAXTRAVTOTAL = <cfqueryparam value="#arguments.ta.getTaxtravtotal()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TAXTRAVTOTAL = <cfqueryparam null="true">,
							</cfif>
							PROCESSID = <cfqueryparam value="#arguments.ta.getProcessid()#" cfsqltype="cf_sql_float" />,
							MILEAGERATE = <cfqueryparam value="#arguments.ta.getMileagerate()#" cfsqltype="cf_sql_float" />,
							<cfif #arguments.ta.getOoptotals()#>
								OOPTOTALS = <cfqueryparam value="#arguments.ta.getOoptotals()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								OOPTOTALS = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTotaldue()#>
								TOTALDUE = <cfqueryparam value="#arguments.ta.getTotaldue()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								TOTALDUE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.ta.getTotaltripexpense()#>
								TOTALTRIPEXPENSE = <cfqueryparam value="#arguments.ta.getTotaltripexpense()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								TOTALTRIPEXPENSE = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.ta.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Ta exists within the database, using the ID as a check.">
		<cfargument name="Ta" required="true" type="model.beans.Ta" hint="I am the Ta bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM TA
			WHERE ID = <cfqueryparam value="#arguments.Ta.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewTa" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="ta" required="true" type="model.beans.Ta" hint="I am the Ta bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO TA
					(
							ID,
							FISCALYEAR,
							TANUMBER,
							EE,
							INSTATE,
							PHYSADDR,
							WARRANTADDR,
							PVN,
							TRAVELERNAME,
							TITLE,
							DEPT,
							DIV,
							BU,
							DUTYSTATION,
							HOMEADDRESS,
							HOMECITY,
							HOMESTATE,
							HOMEZIP,
							WORKDAYS,
							WORKTIME,
							DESTINATION,
							TRAVPREF,
							DEPARTUREFROM,
							DEPARTUREDATE,
							RETURNDATE,
							PURPOSE,
							ESTCOST,
							ACTUALSREQ,
							TRAVADV,
							PERSTRAV,
							PERSTRAVBEGIN,
							PERSTRAVEND,
							PERSTRAVAIRFARE,
							STATEAUTHTRV,
							HOTELINC,
							CARINC,
							CONFCOM,
							SUPERVISOR,
							ISSUBMITTED,
							SPECIALINST,
							CREATED,
							UPDATED,
							SUBMITTED,
							DELETED,
							TRAVELERID,
							PREPARERID,
							TRAVADVWN,
							TRAVADVWNAMT,
							ATMWITHDRAWAL,
							EDOCSID,
							EDOCSNAME,
							DESTINATIONTO,
							ESTIMATORID,
							TAXTRAVNONTAX,
							TAXTRAVTAXABLE,
							TAXTRAVTOTAL,
							PROCESSID,
							MILEAGERATE,
							OOPTOTALS,
							TOTALDUE,
							TOTALTRIPEXPENSE
					) VALUES (
						<cfqueryparam value="#arguments.ta.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(trim(#arguments.ta.getFiscalyear()#))>
							<cfqueryparam value="#arguments.ta.getFiscalyear()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTanumber()#))>
							<cfqueryparam value="#arguments.ta.getTanumber()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.ta.getEe()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getInstate()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getPhysaddr()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getWarrantaddr()#" cfsqltype="cf_sql_char" />,
						<cfif len(trim(#arguments.ta.getPvn()#))>
							<cfqueryparam value="#arguments.ta.getPvn()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTravelername()#))>
							<cfqueryparam value="#arguments.ta.getTravelername()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTitle()#))>
							<cfqueryparam value="#arguments.ta.getTitle()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDept()#))>
							<cfqueryparam value="#arguments.ta.getDept()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDiv()#))>
							<cfqueryparam value="#arguments.ta.getDiv()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getBu()#))>
							<cfqueryparam value="#arguments.ta.getBu()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDutystation()#))>
							<cfqueryparam value="#arguments.ta.getDutystation()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getHomeaddress()#))>
							<cfqueryparam value="#arguments.ta.getHomeaddress()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getHomecity()#))>
							<cfqueryparam value="#arguments.ta.getHomecity()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getHomestate()#))>
							<cfqueryparam value="#arguments.ta.getHomestate()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getHomezip()#))>
							<cfqueryparam value="#arguments.ta.getHomezip()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getWorkdays()#))>
							<cfqueryparam value="#arguments.ta.getWorkdays()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getWorktime()#))>
							<cfqueryparam value="#arguments.ta.getWorktime()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDestination()#))>
							<cfqueryparam value="#arguments.ta.getDestination()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTravpref()#))>
							<cfqueryparam value="#arguments.ta.getTravpref()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDeparturefrom()#))>
							<cfqueryparam value="#arguments.ta.getDeparturefrom()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDeparturedate()#))>
							<cfqueryparam value="#arguments.ta.getDeparturedate()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getReturndate()#))>
							<cfqueryparam value="#arguments.ta.getReturndate()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getPurpose()#))>
							<cfqueryparam value="#arguments.ta.getPurpose()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getEstcost()#))>
							<cfqueryparam value="#arguments.ta.getEstcost()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.ta.getActualsreq()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getTravadv()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getPerstrav()#" cfsqltype="cf_sql_char" />,
						<cfif len(trim(#arguments.ta.getPerstravbegin()#))>
							<cfqueryparam value="#arguments.ta.getPerstravbegin()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getPerstravend()#))>
							<cfqueryparam value="#arguments.ta.getPerstravend()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getPerstravairfare()#))>
							<cfqueryparam value="#arguments.ta.getPerstravairfare()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getStateauthtrv()#))>
							<cfqueryparam value="#arguments.ta.getStateauthtrv()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.ta.getHotelinc()#" cfsqltype="cf_sql_char" />,
						<cfqueryparam value="#arguments.ta.getCarinc()#" cfsqltype="cf_sql_char" />,
						<cfif len(trim(#arguments.ta.getConfcom()#))>
							<cfqueryparam value="#arguments.ta.getConfcom()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getSupervisor()#))>
							<cfqueryparam value="#arguments.ta.getSupervisor()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.ta.getIssubmitted()#" cfsqltype="cf_sql_char" />,
						<cfif len(trim(#arguments.ta.getSpecialinst()#))>
							<cfqueryparam value="#arguments.ta.getSpecialinst()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getCreated()#))>
							<cfqueryparam value="#arguments.ta.getCreated()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getUpdated()#))>
							<cfqueryparam value="#arguments.ta.getUpdated()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getSubmitted()#))>
							<cfqueryparam value="#arguments.ta.getSubmitted()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDeleted()#))>
							<cfqueryparam value="#arguments.ta.getDeleted()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTravelerid()#))>
							<cfqueryparam value="#arguments.ta.getTravelerid()#" cfsqltype="cf_sql_float" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getPreparerid()#))>
							<cfqueryparam value="#arguments.ta.getPreparerid()#" cfsqltype="cf_sql_float" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTravadvwn()#))>
							<cfqueryparam value="#arguments.ta.getTravadvwn()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTravadvwnamt()#))>
							<cfqueryparam value="#arguments.ta.getTravadvwnamt()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getAtmwithdrawal()#))>
							<cfqueryparam value="#arguments.ta.getAtmwithdrawal()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getEdocsid()#))>
							<cfqueryparam value="#arguments.ta.getEdocsid()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getEdocsname()#))>
							<cfqueryparam value="#arguments.ta.getEdocsname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getDestinationto()#))>
							<cfqueryparam value="#arguments.ta.getDestinationto()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getEstimatorid()#))>
							<cfqueryparam value="#arguments.ta.getEstimatorid()#" cfsqltype="cf_sql_float" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTaxtravnontax()#))>
							<cfqueryparam value="#arguments.ta.getTaxtravnontax()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTaxtravtaxable()#))>
							<cfqueryparam value="#arguments.ta.getTaxtravtaxable()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTaxtravtotal()#))>
							<cfqueryparam value="#arguments.ta.getTaxtravtotal()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfqueryparam value="#arguments.ta.getProcessid()#" cfsqltype="cf_sql_float" />,
						<cfqueryparam value="#arguments.ta.getMileagerate()#" cfsqltype="cf_sql_float" />,
						<cfif len(trim(#arguments.ta.getOoptotals()#))>
							<cfqueryparam value="#arguments.ta.getOoptotals()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTotaldue()#))>
							<cfqueryparam value="#arguments.ta.getTotaldue()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.ta.getTotaltripexpense()#))>
							<cfqueryparam value="#arguments.ta.getTotaltripexpense()#" cfsqltype="cf_sql_decimal" />
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
