<cfcomponent accessors="true" displayName="TaGateway" output="false" extends="model.services.CoreUtils"
	hint="I am the Ta Gateway Class.">

	<cffunction name="init" access="public" output="false" returnType="any"
		hint="I am the constuctor method for the Ta Gateway Class.">

		<cfreturn this>
	</cffunction>

	<!--- Public Methods --->
	<cffunction name="getAllTa" access="public" output="false" returnType="query"
		hint="I run a query of all TA within the database table.">

		<cfset var qAllTA = "">
		<cfquery name="qAllTa">
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
		</cfquery>
		<cfreturn qAllTa>
	</cffunction>

	<cffunction name="filterById" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Id.">

		<cfargument name="id" required="true" type="string"
			hint="I am the id to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				id = arguments.id
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByFiscalyear" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Fiscalyear.">

		<cfargument name="fiscalyear" required="true" type="string"
			hint="I am the fiscalyear to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				fiscalyear = arguments.fiscalyear
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTanumber" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Tanumber.">

		<cfargument name="tanumber" required="true" type="string"
			hint="I am the tanumber to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				tanumber = arguments.tanumber
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByEe" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Ee.">

		<cfargument name="ee" required="true" type="string"
			hint="I am the ee to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				ee = arguments.ee
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByInstate" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Instate.">

		<cfargument name="instate" required="true" type="string"
			hint="I am the instate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				instate = arguments.instate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPhysaddr" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Physaddr.">

		<cfargument name="physaddr" required="true" type="string"
			hint="I am the physaddr to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				physaddr = arguments.physaddr
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByWarrantaddr" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Warrantaddr.">

		<cfargument name="warrantaddr" required="true" type="string"
			hint="I am the warrantaddr to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				warrantaddr = arguments.warrantaddr
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPvn" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Pvn.">

		<cfargument name="pvn" required="true" type="string"
			hint="I am the pvn to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				pvn = arguments.pvn
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravelername" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travelername.">

		<cfargument name="travelername" required="true" type="string"
			hint="I am the travelername to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travelername = arguments.travelername
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTitle" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Title.">

		<cfargument name="title" required="true" type="string"
			hint="I am the title to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				title = arguments.title
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDept" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Dept.">

		<cfargument name="dept" required="true" type="string"
			hint="I am the dept to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				dept = arguments.dept
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDiv" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Div.">

		<cfargument name="div" required="true" type="string"
			hint="I am the div to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				div = arguments.div
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByBu" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Bu.">

		<cfargument name="bu" required="true" type="string"
			hint="I am the bu to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				bu = arguments.bu
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDutystation" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Dutystation.">

		<cfargument name="dutystation" required="true" type="string"
			hint="I am the dutystation to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				dutystation = arguments.dutystation
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByHomeaddress" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Homeaddress.">

		<cfargument name="homeaddress" required="true" type="string"
			hint="I am the homeaddress to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				homeaddress = arguments.homeaddress
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByHomecity" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Homecity.">

		<cfargument name="homecity" required="true" type="string"
			hint="I am the homecity to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				homecity = arguments.homecity
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByHomestate" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Homestate.">

		<cfargument name="homestate" required="true" type="string"
			hint="I am the homestate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				homestate = arguments.homestate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByHomezip" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Homezip.">

		<cfargument name="homezip" required="true" type="string"
			hint="I am the homezip to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				homezip = arguments.homezip
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByWorkdays" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Workdays.">

		<cfargument name="workdays" required="true" type="string"
			hint="I am the workdays to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				workdays = arguments.workdays
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByWorktime" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Worktime.">

		<cfargument name="worktime" required="true" type="string"
			hint="I am the worktime to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				worktime = arguments.worktime
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDestination" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Destination.">

		<cfargument name="destination" required="true" type="string"
			hint="I am the destination to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				destination = arguments.destination
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravpref" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travpref.">

		<cfargument name="travpref" required="true" type="string"
			hint="I am the travpref to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travpref = arguments.travpref
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDeparturefrom" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Departurefrom.">

		<cfargument name="departurefrom" required="true" type="string"
			hint="I am the departurefrom to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				departurefrom = arguments.departurefrom
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDeparturedate" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Departuredate.">

		<cfargument name="departuredate" required="true" type="string"
			hint="I am the departuredate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				departuredate = arguments.departuredate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByReturndate" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Returndate.">

		<cfargument name="returndate" required="true" type="string"
			hint="I am the returndate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				returndate = arguments.returndate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPurpose" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Purpose.">

		<cfargument name="purpose" required="true" type="string"
			hint="I am the purpose to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				purpose = arguments.purpose
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByEstcost" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Estcost.">

		<cfargument name="estcost" required="true" type="string"
			hint="I am the estcost to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				estcost = arguments.estcost
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByActualsreq" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Actualsreq.">

		<cfargument name="actualsreq" required="true" type="string"
			hint="I am the actualsreq to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				actualsreq = arguments.actualsreq
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravadv" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travadv.">

		<cfargument name="travadv" required="true" type="string"
			hint="I am the travadv to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travadv = arguments.travadv
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPerstrav" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Perstrav.">

		<cfargument name="perstrav" required="true" type="string"
			hint="I am the perstrav to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				perstrav = arguments.perstrav
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPerstravbegin" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Perstravbegin.">

		<cfargument name="perstravbegin" required="true" type="string"
			hint="I am the perstravbegin to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				perstravbegin = arguments.perstravbegin
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPerstravend" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Perstravend.">

		<cfargument name="perstravend" required="true" type="string"
			hint="I am the perstravend to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				perstravend = arguments.perstravend
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPerstravairfare" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Perstravairfare.">

		<cfargument name="perstravairfare" required="true" type="string"
			hint="I am the perstravairfare to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				perstravairfare = arguments.perstravairfare
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByStateauthtrv" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Stateauthtrv.">

		<cfargument name="stateauthtrv" required="true" type="string"
			hint="I am the stateauthtrv to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				stateauthtrv = arguments.stateauthtrv
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByHotelinc" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Hotelinc.">

		<cfargument name="hotelinc" required="true" type="string"
			hint="I am the hotelinc to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				hotelinc = arguments.hotelinc
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByCarinc" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Carinc.">

		<cfargument name="carinc" required="true" type="string"
			hint="I am the carinc to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				carinc = arguments.carinc
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByConfcom" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Confcom.">

		<cfargument name="confcom" required="true" type="string"
			hint="I am the confcom to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				confcom = arguments.confcom
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterBySupervisor" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Supervisor.">

		<cfargument name="supervisor" required="true" type="string"
			hint="I am the supervisor to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				supervisor = arguments.supervisor
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByIssubmitted" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Issubmitted.">

		<cfargument name="issubmitted" required="true" type="string"
			hint="I am the issubmitted to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				issubmitted = arguments.issubmitted
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterBySpecialinst" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Specialinst.">

		<cfargument name="specialinst" required="true" type="string"
			hint="I am the specialinst to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				specialinst = arguments.specialinst
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByCreated" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Created.">

		<cfargument name="created" required="true" type="string"
			hint="I am the created to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				created = arguments.created
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByUpdated" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Updated.">

		<cfargument name="updated" required="true" type="string"
			hint="I am the updated to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				updated = arguments.updated
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterBySubmitted" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Submitted.">

		<cfargument name="submitted" required="true" type="string"
			hint="I am the submitted to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				submitted = arguments.submitted
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDeleted" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Deleted.">

		<cfargument name="deleted" required="true" type="string"
			hint="I am the deleted to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				deleted = arguments.deleted
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravelerid" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travelerid.">

		<cfargument name="travelerid" required="true" type="string"
			hint="I am the travelerid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travelerid = arguments.travelerid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByPreparerid" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Preparerid.">

		<cfargument name="preparerid" required="true" type="string"
			hint="I am the preparerid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				preparerid = arguments.preparerid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravadvwn" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travadvwn.">

		<cfargument name="travadvwn" required="true" type="string"
			hint="I am the travadvwn to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travadvwn = arguments.travadvwn
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTravadvwnamt" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Travadvwnamt.">

		<cfargument name="travadvwnamt" required="true" type="string"
			hint="I am the travadvwnamt to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				travadvwnamt = arguments.travadvwnamt
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByAtmwithdrawal" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Atmwithdrawal.">

		<cfargument name="atmwithdrawal" required="true" type="string"
			hint="I am the atmwithdrawal to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				atmwithdrawal = arguments.atmwithdrawal
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByEdocsid" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Edocsid.">

		<cfargument name="edocsid" required="true" type="string"
			hint="I am the edocsid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				edocsid = arguments.edocsid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByEdocsname" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Edocsname.">

		<cfargument name="edocsname" required="true" type="string"
			hint="I am the edocsname to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				edocsname = arguments.edocsname
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByDestinationto" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Destinationto.">

		<cfargument name="destinationto" required="true" type="string"
			hint="I am the destinationto to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				destinationto = arguments.destinationto
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByEstimatorid" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Estimatorid.">

		<cfargument name="estimatorid" required="true" type="string"
			hint="I am the estimatorid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				estimatorid = arguments.estimatorid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaxtravnontax" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Taxtravnontax.">

		<cfargument name="taxtravnontax" required="true" type="string"
			hint="I am the taxtravnontax to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taxtravnontax = arguments.taxtravnontax
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaxtravtaxable" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Taxtravtaxable.">

		<cfargument name="taxtravtaxable" required="true" type="string"
			hint="I am the taxtravtaxable to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taxtravtaxable = arguments.taxtravtaxable
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTaxtravtotal" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Taxtravtotal.">

		<cfargument name="taxtravtotal" required="true" type="string"
			hint="I am the taxtravtotal to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				taxtravtotal = arguments.taxtravtotal
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByProcessid" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Processid.">

		<cfargument name="processid" required="true" type="string"
			hint="I am the processid to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				processid = arguments.processid
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByMileagerate" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Mileagerate.">

		<cfargument name="mileagerate" required="true" type="string"
			hint="I am the mileagerate to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				mileagerate = arguments.mileagerate
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByOoptotals" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Ooptotals.">

		<cfargument name="ooptotals" required="true" type="string"
			hint="I am the ooptotals to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				ooptotals = arguments.ooptotals
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTotaldue" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Totaldue.">

		<cfargument name="totaldue" required="true" type="string"
			hint="I am the totaldue to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				totaldue = arguments.totaldue
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterByTotaltripexpense" access="public" output="false" returnType="array"
		hint="I query the database to find a Ta with a matching Totaltripexpense.">

		<cfargument name="totaltripexpense" required="true" type="string"
			hint="I am the totaltripexpense to search for.">

			<!--- Create and populate a structure object containing the filter to pass through. --->
			<cfset var stuFilter = {
				totaltripexpense = arguments.totaltripexpense
			}>

		<!--- Send the structure into the query method and return the query object. --->
		<cfreturn filterAllTa(stuFilter)>
	</cffunction>

	<cffunction name="filterAllTa" access="private" output="false"
		hint="I run a query and will return all user records.  If a filter
		has been supplied, I will refine the search using the filter
		information sent to me.">

		<cfargument name="filter" required="false" type="struct"
			default="#structNew()#" hint="I am the structure used to filter the query.">

		<cfset var qSearch = new Query()>

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
			WHERE 1 = 1

			<cfif NOT structIsEmpty(arguments.filter)>
				<!--- A filter has been provided.  Let's find out which filter
				it is, and apply the necessary clause to the SQL. --->
				<!--- Perform a LIKE comparison on the Id --->
				<cfif structKeyExists(arguments.filter, 'Id')>
					AND ID LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.id#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Fiscalyear --->
				<cfif structKeyExists(arguments.filter, 'Fiscalyear')>
					AND FISCALYEAR LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.fiscalyear#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Tanumber --->
				<cfif structKeyExists(arguments.filter, 'Tanumber')>
					AND TANUMBER LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.tanumber#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Ee --->
				<cfif structKeyExists(arguments.filter, 'Ee')>
					AND EE LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.ee#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Instate --->
				<cfif structKeyExists(arguments.filter, 'Instate')>
					AND INSTATE LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.instate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Physaddr --->
				<cfif structKeyExists(arguments.filter, 'Physaddr')>
					AND PHYSADDR LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.physaddr#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Warrantaddr --->
				<cfif structKeyExists(arguments.filter, 'Warrantaddr')>
					AND WARRANTADDR LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.warrantaddr#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Pvn --->
				<cfif structKeyExists(arguments.filter, 'Pvn')>
					AND PVN LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.pvn#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travelername --->
				<cfif structKeyExists(arguments.filter, 'Travelername')>
					AND TRAVELERNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.travelername#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Title --->
				<cfif structKeyExists(arguments.filter, 'Title')>
					AND TITLE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.title#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Dept --->
				<cfif structKeyExists(arguments.filter, 'Dept')>
					AND DEPT LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.dept#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Div --->
				<cfif structKeyExists(arguments.filter, 'Div')>
					AND DIV LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.div#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Bu --->
				<cfif structKeyExists(arguments.filter, 'Bu')>
					AND BU LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.bu#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Dutystation --->
				<cfif structKeyExists(arguments.filter, 'Dutystation')>
					AND DUTYSTATION LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.dutystation#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Homeaddress --->
				<cfif structKeyExists(arguments.filter, 'Homeaddress')>
					AND HOMEADDRESS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.homeaddress#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Homecity --->
				<cfif structKeyExists(arguments.filter, 'Homecity')>
					AND HOMECITY LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.homecity#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Homestate --->
				<cfif structKeyExists(arguments.filter, 'Homestate')>
					AND HOMESTATE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.homestate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Homezip --->
				<cfif structKeyExists(arguments.filter, 'Homezip')>
					AND HOMEZIP LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.homezip#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Workdays --->
				<cfif structKeyExists(arguments.filter, 'Workdays')>
					AND WORKDAYS LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.workdays#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Worktime --->
				<cfif structKeyExists(arguments.filter, 'Worktime')>
					AND WORKTIME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.worktime#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Destination --->
				<cfif structKeyExists(arguments.filter, 'Destination')>
					AND DESTINATION LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.destination#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travpref --->
				<cfif structKeyExists(arguments.filter, 'Travpref')>
					AND TRAVPREF LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.travpref#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Departurefrom --->
				<cfif structKeyExists(arguments.filter, 'Departurefrom')>
					AND DEPARTUREFROM LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.departurefrom#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Departuredate --->
				<cfif structKeyExists(arguments.filter, 'Departuredate')>
					AND DEPARTUREDATE LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.departuredate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Returndate --->
				<cfif structKeyExists(arguments.filter, 'Returndate')>
					AND RETURNDATE LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.returndate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Purpose --->
				<cfif structKeyExists(arguments.filter, 'Purpose')>
					AND PURPOSE LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.purpose#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Estcost --->
				<cfif structKeyExists(arguments.filter, 'Estcost')>
					AND ESTCOST LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.estcost#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Actualsreq --->
				<cfif structKeyExists(arguments.filter, 'Actualsreq')>
					AND ACTUALSREQ LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.actualsreq#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travadv --->
				<cfif structKeyExists(arguments.filter, 'Travadv')>
					AND TRAVADV LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.travadv#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Perstrav --->
				<cfif structKeyExists(arguments.filter, 'Perstrav')>
					AND PERSTRAV LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.perstrav#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Perstravbegin --->
				<cfif structKeyExists(arguments.filter, 'Perstravbegin')>
					AND PERSTRAVBEGIN LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.perstravbegin#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Perstravend --->
				<cfif structKeyExists(arguments.filter, 'Perstravend')>
					AND PERSTRAVEND LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.perstravend#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Perstravairfare --->
				<cfif structKeyExists(arguments.filter, 'Perstravairfare')>
					AND PERSTRAVAIRFARE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.perstravairfare#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Stateauthtrv --->
				<cfif structKeyExists(arguments.filter, 'Stateauthtrv')>
					AND STATEAUTHTRV LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.stateauthtrv#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Hotelinc --->
				<cfif structKeyExists(arguments.filter, 'Hotelinc')>
					AND HOTELINC LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.hotelinc#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Carinc --->
				<cfif structKeyExists(arguments.filter, 'Carinc')>
					AND CARINC LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.carinc#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Confcom --->
				<cfif structKeyExists(arguments.filter, 'Confcom')>
					AND CONFCOM LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.confcom#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Supervisor --->
				<cfif structKeyExists(arguments.filter, 'Supervisor')>
					AND SUPERVISOR LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.supervisor#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Issubmitted --->
				<cfif structKeyExists(arguments.filter, 'Issubmitted')>
					AND ISSUBMITTED LIKE
					<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.filter.issubmitted#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Specialinst --->
				<cfif structKeyExists(arguments.filter, 'Specialinst')>
					AND SPECIALINST LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.specialinst#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Created --->
				<cfif structKeyExists(arguments.filter, 'Created')>
					AND CREATED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.created#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Updated --->
				<cfif structKeyExists(arguments.filter, 'Updated')>
					AND UPDATED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.updated#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Submitted --->
				<cfif structKeyExists(arguments.filter, 'Submitted')>
					AND SUBMITTED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.submitted#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Deleted --->
				<cfif structKeyExists(arguments.filter, 'Deleted')>
					AND DELETED LIKE
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#arguments.filter.deleted#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travelerid --->
				<cfif structKeyExists(arguments.filter, 'Travelerid')>
					AND TRAVELERID LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.travelerid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Preparerid --->
				<cfif structKeyExists(arguments.filter, 'Preparerid')>
					AND PREPARERID LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.preparerid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travadvwn --->
				<cfif structKeyExists(arguments.filter, 'Travadvwn')>
					AND TRAVADVWN LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.travadvwn#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Travadvwnamt --->
				<cfif structKeyExists(arguments.filter, 'Travadvwnamt')>
					AND TRAVADVWNAMT LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.travadvwnamt#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Atmwithdrawal --->
				<cfif structKeyExists(arguments.filter, 'Atmwithdrawal')>
					AND ATMWITHDRAWAL LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.atmwithdrawal#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Edocsid --->
				<cfif structKeyExists(arguments.filter, 'Edocsid')>
					AND EDOCSID LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.edocsid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Edocsname --->
				<cfif structKeyExists(arguments.filter, 'Edocsname')>
					AND EDOCSNAME LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.edocsname#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Destinationto --->
				<cfif structKeyExists(arguments.filter, 'Destinationto')>
					AND DESTINATIONTO LIKE
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.filter.destinationto#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Estimatorid --->
				<cfif structKeyExists(arguments.filter, 'Estimatorid')>
					AND ESTIMATORID LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.estimatorid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Taxtravnontax --->
				<cfif structKeyExists(arguments.filter, 'Taxtravnontax')>
					AND TAXTRAVNONTAX LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.taxtravnontax#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Taxtravtaxable --->
				<cfif structKeyExists(arguments.filter, 'Taxtravtaxable')>
					AND TAXTRAVTAXABLE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.taxtravtaxable#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Taxtravtotal --->
				<cfif structKeyExists(arguments.filter, 'Taxtravtotal')>
					AND TAXTRAVTOTAL LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.taxtravtotal#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Processid --->
				<cfif structKeyExists(arguments.filter, 'Processid')>
					AND PROCESSID LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.processid#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Mileagerate --->
				<cfif structKeyExists(arguments.filter, 'Mileagerate')>
					AND MILEAGERATE LIKE
					<cfqueryparam cfsqltype="cf_sql_float" value="#arguments.filter.mileagerate#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Ooptotals --->
				<cfif structKeyExists(arguments.filter, 'Ooptotals')>
					AND OOPTOTALS LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.ooptotals#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Totaldue --->
				<cfif structKeyExists(arguments.filter, 'Totaldue')>
					AND TOTALDUE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.totaldue#" />
				</cfif>

				<!--- Perform a LIKE comparison on the Totaltripexpense --->
				<cfif structKeyExists(arguments.filter, 'Totaltripexpense')>
					AND TOTALTRIPEXPENSE LIKE
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.filter.totaltripexpense#" />
				</cfif>

			</cfif>
		</cfquery>
		<cfreturn queryToArray(qSearch)>
	</cffunction>

</cfcomponent>
