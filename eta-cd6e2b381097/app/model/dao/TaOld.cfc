<cfcomponent accessors="true" extends="model.services.CoreUtils">

	<cffunction name="getBeanById" output="false" returnType="model.beans.Ta">
		<cfargument name="id" required="true" type="numeric">

		<cfset var qRead = new query()>
		<cfset var result = {}>
		<cfquery name="qRead" result="result">
			SELECT TA.*, MILEAGERATE.MILEAGERATE as MILEAGERATEAMOUNT
			  FROM TA
			 INNER JOIN MILEAGERATE
			    ON MILEAGERATE.ID = TA.MILEAGERATE
			 WHERE TA.ID       = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfset var TABean = new model.beans.Ta()>
		<cfset TABean.setID( qRead.ID )>
		<cfset TABean.setFISCALYEAR( qRead.FISCALYEAR )>
		<cfset TABean.setTANUMBER( qRead.TANUMBER )>
		<cfset TABean.setEE( qRead.EE )>
		<cfset TABean.setINSTATE( qRead.INSTATE )>
		<cfset TABean.setPHYSADDR( qRead.PHYSADDR )>
		<cfset TABean.setWARRANTADDR( qRead.WARRANTADDR )>
		<cfset TABean.setPVN( qRead.PVN )>
		<cfset TABean.setTRAVELERNAME( qRead.TRAVELERNAME )>
		<cfset TABean.setTITLE( qRead.TITLE )>
		<cfset TABean.setDEPT( qRead.DEPT )>
		<cfset TABean.setDIV( qRead.DIV )>
		<cfset TABean.setBU( qRead.BU )>
		<cfset TABean.setDUTYSTATION( qRead.DUTYSTATION )>
		<cfset TABean.setHOMEADDRESS( qRead.HOMEADDRESS )>
		<cfset TABean.setHOMECITY( qRead.HOMECITY )>
		<cfset TABean.setHOMESTATE( qRead.HOMESTATE )>
		<cfset TABean.setHOMEZIP( qRead.HOMEZIP )>
		<cfset TABean.setWORKDAYS( qRead.WORKDAYS )>
		<cfset TABean.setWORKTIME( qRead.WORKTIME )>
		<cfset TABean.setDESTINATION( qRead.DESTINATION )>
		<cfset TABean.setTRAVPREF( qRead.TRAVPREF )>
		<cfset TABean.setDEPARTUREFROM( qRead.DEPARTUREFROM )>
		<cfset TABean.setDEPARTUREDATE( qRead.DEPARTUREDATE )>
		<cfset TABean.setRETURNDATE( qRead.RETURNDATE )>
		<cfset TABean.setPURPOSE( qRead.PURPOSE )>
		<cfset TABean.setESTCOST( qRead.ESTCOST )>
		<cfset TABean.setACTUALSREQ( qRead.ACTUALSREQ )>
		<cfset TABean.setTRAVADV( qRead.TRAVADV )>
		<cfset TABean.setPERSTRAV( qRead.PERSTRAV )>
		<cfset TABean.setPERSTRAVBEGIN( qRead.PERSTRAVBEGIN )>
		<cfset TABean.setPERSTRAVEND( qRead.PERSTRAVEND )>
		<cfset TABean.setPERSTRAVAIRFARE( qRead.PERSTRAVAIRFARE )>
		<cfset TABean.setSTATEAUTHTRV( qRead.STATEAUTHTRV )>
		<cfset TABean.setHOTELINC( qRead.HOTELINC )>
		<cfset TABean.setCARINC( qRead.CARINC )>
		<cfset TABean.setCONFCOM( qRead.CONFCOM )>
		<cfset TABean.setSUPERVISOR( qRead.SUPERVISOR )>
		<cfset TABean.setISSUBMITTED( qRead.ISSUBMITTED )>
		<cfset TABean.setSPECIALINST( qRead.SPECIALINST )>
		<cfset TABean.setCREATED( qRead.CREATED )>
		<cfset TABean.setUPDATED( qRead.UPDATED )>
		<cfset TABean.setSUBMITTED( qRead.SUBMITTED )>
		<cfset TABean.setDELETED( qRead.DELETED )>
		<cfset TABean.setTRAVELERID( qRead.TRAVELERID )>
		<cfset TABean.setPREPARERID( qRead.PREPARERID )>
		<cfset TABean.setTRAVADVWN( qRead.TRAVADVWN )>
		<cfset TABean.setTRAVADVWNAMT( qRead.TRAVADVWNAMT )>
		<cfset TABean.setATMWITHDRAWAL( qRead.ATMWITHDRAWAL )>
		<cfset TABean.setEDOCSID( qRead.EDOCSID )>
		<cfset TABean.setEDOCSNAME( qRead.EDOCSNAME )>
		<cfset TABean.setDESTINATIONTO( qRead.DESTINATIONTO )>
		<cfset TABean.setESTIMATORID( qRead.ESTIMATORID )>
		<cfset TABean.setTAXTRAVNONTAX( qRead.TAXTRAVNONTAX )>
		<cfset TABean.setTAXTRAVTAXABLE( qRead.TAXTRAVTAXABLE )>
		<cfset TABean.setTAXTRAVTOTAL( qRead.TAXTRAVTOTAL )>
		<cfset TABean.setPROCESSID( qRead.PROCESSID )>
		<cfset TABean.setMILEAGERATE( qRead.MILEAGERATEAMOUNT )>
		<cfset TABean.setOOPTOTALS( qRead.OOPTOTALS )>
		<cfset TABean.setTOTALDUE( qRead.TOTALDUE )>
		<cfset TABean.setTOTALTRIPEXPENSE( qRead.TOTALTRIPEXPENSE )>
		<cfreturn TABean>
	</cffunction>

	<cffunction name="create" output="false">
		<cfargument name="TABean" required="true" type="model.beans.Ta">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>
			<cfquery name="qInsert" result="result">
				INSERT INTO TA (
				FISCALYEAR,TANUMBER,EE,INSTATE,PHYSADDR,WARRANTADDR,PVN,TRAVELERNAME,TITLE,DEPT,DIV,BU,DUTYSTATION,HOMEADDRESS,HOMECITY,HOMESTATE,HOMEZIP,WORKDAYS,WORKTIME,DESTINATION,TRAVPREF,DEPARTUREFROM,DEPARTUREDATE,RETURNDATE,PURPOSE,ESTCOST,ACTUALSREQ,TRAVADV,PERSTRAV,PERSTRAVBEGIN,PERSTRAVEND,PERSTRAVAIRFARE,STATEAUTHTRV,HOTELINC,CARINC,CONFCOM,SUPERVISOR,ISSUBMITTED,SPECIALINST,CREATED,UPDATED,SUBMITTED,DELETED,TRAVELERID,PREPARERID,TRAVADVWN,TRAVADVWNAMT,ATMWITHDRAWAL,EDOCSID,EDOCSNAME,DESTINATIONTO,ESTIMATORID,TAXTRAVNONTAX,TAXTRAVTAXABLE,TAXTRAVTOTAL,PROCESSID,MILEAGERATE, OOPTOTALS, TOTALDUE, TOTALTRIPEXPENSE
				) VALUES (
			<cfif NOT len(arguments.TABean.getFISCALYEAR())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getFISCALYEAR())#" cfsqltype="CF_SQL_FLOAT" maxlength="4">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getTANUMBER()#" cfsqltype="CF_SQL_VARCHAR" maxlength="30">,
			<cfqueryparam value="#arguments.TABean.getEE()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getINSTATE()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getPHYSADDR()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getWARRANTADDR()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getPVN()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfqueryparam value="#arguments.TABean.getTRAVELERNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getTITLE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getDEPT()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getDIV()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getBU()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getDUTYSTATION()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getHOMEADDRESS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
			<cfqueryparam value="#arguments.TABean.getHOMECITY()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfqueryparam value="#arguments.TABean.getHOMESTATE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfqueryparam value="#arguments.TABean.getHOMEZIP()#" cfsqltype="CF_SQL_VARCHAR" maxlength="10">,
			<cfqueryparam value="#arguments.TABean.getWORKDAYS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfqueryparam value="#arguments.TABean.getWORKTIME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfqueryparam value="#arguments.TABean.getDESTINATION()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
			<cfqueryparam value="#arguments.TABean.getTRAVPREF()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
			<cfqueryparam value="#arguments.TABean.getDEPARTUREFROM()#" cfsqltype="CF_SQL_VARCHAR" maxlength="60">,
			<cfif NOT len(arguments.TABean.getDEPARTUREDATE())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getDEPARTUREDATE()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getRETURNDATE())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getRETURNDATE()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getPURPOSE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.TABean.getESTCOST())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getESTCOST())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getACTUALSREQ()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getTRAVADV()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getPERSTRAV()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfif NOT len(arguments.TABean.getPERSTRAVBEGIN())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getPERSTRAVBEGIN()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPERSTRAVEND())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getPERSTRAVEND()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPERSTRAVAIRFARE())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getPERSTRAVAIRFARE())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getSTATEAUTHTRV()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
			<cfqueryparam value="#arguments.TABean.getHOTELINC()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getCARINC()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getCONFCOM()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
			<cfqueryparam value="#arguments.TABean.getSUPERVISOR()#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">,
			<cfqueryparam value="#arguments.TABean.getISSUBMITTED()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.TABean.getSPECIALINST()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
			<cfif NOT len(arguments.TABean.getCREATED())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getCREATED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getUPDATED())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getUPDATED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getSUBMITTED())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getSUBMITTED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getDELETED())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.TABean.getDELETED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTRAVELERID())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getTRAVELERID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPREPARERID())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getPREPARERID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getTRAVADVWN()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfif NOT len(arguments.TABean.getTRAVADVWNAMT())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getTRAVADVWNAMT())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getATMWITHDRAWAL())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getATMWITHDRAWAL())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfqueryparam value="#arguments.TABean.getEDOCSID()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfqueryparam value="#arguments.TABean.getEDOCSNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfqueryparam value="#arguments.TABean.getDESTINATIONTO()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
			<cfif NOT len(arguments.TABean.getESTIMATORID())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getESTIMATORID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVNONTAX())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getTAXTRAVNONTAX())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVTAXABLE())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getTAXTRAVTAXABLE())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVTOTAL())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.TABean.getTAXTRAVTOTAL())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfqueryparam value="#int(arguments.TABean.getPROCESSID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			<cfqueryparam value="#int(arguments.TABean.getMILEAGERATE())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			<cfqueryparam value="#int(arguments.TABean.getOOPTOTALS())#" cfsqltype="CF_SQL_DECIMAL">,
			<cfqueryparam value="#int(arguments.TABean.getTOTALDUE())#" cfsqltype="CF_SQL_DECIMAL">,
			<cfqueryparam value="#int(arguments.TABean.getTOTALTRIPEXPENSE())#" cfsqltype="CF_SQL_DECIMAL">
				)
			</cfquery>

			<cfset msg.id = taidFromRowid(result.rowid)>
			<cfset msg.text = "Record inserted successfully.">
			<cfset msg.type = "success">
		<cfcatch type="any" name="e">
			<cfset msg.text = "An error has occured. The record was not inserted">
			<cfset msg.type = "error">
			<cfset msg.result = e>
		</cfcatch>

		</cftry>

		<cfreturn msg>
	</cffunction>

	<cffunction name="update" output="false">
		<cfargument name="TABean" required="true" type="model.beans.Ta">

		<cfset var qUpdate = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>

			<cfquery>

			UPDATE TA
			SET
			<cfif NOT len(arguments.TABean.getFISCALYEAR())>
				FISCALYEAR = <cfqueryparam null="true">,
			<cfelse>
				FISCALYEAR = <cfqueryparam value="#int(arguments.TABean.getFISCALYEAR())#" cfsqltype="CF_SQL_FLOAT" maxlength="4">,
			</cfif>
				TANUMBER = <cfqueryparam value="#arguments.TABean.getTANUMBER()#" cfsqltype="CF_SQL_VARCHAR" maxlength="30">,
				EE = <cfqueryparam value="#arguments.TABean.getEE()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				INSTATE = <cfqueryparam value="#arguments.TABean.getINSTATE()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				PHYSADDR = <cfqueryparam value="#arguments.TABean.getPHYSADDR()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				WARRANTADDR = <cfqueryparam value="#arguments.TABean.getWARRANTADDR()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				PVN = <cfqueryparam value="#arguments.TABean.getPVN()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
				TRAVELERNAME = <cfqueryparam value="#arguments.TABean.getTRAVELERNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				TITLE = <cfqueryparam value="#arguments.TABean.getTITLE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				DEPT = <cfqueryparam value="#arguments.TABean.getDEPT()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				DIV = <cfqueryparam value="#arguments.TABean.getDIV()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				BU = <cfqueryparam value="#arguments.TABean.getBU()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				DUTYSTATION = <cfqueryparam value="#arguments.TABean.getDUTYSTATION()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				HOMEADDRESS = <cfqueryparam value="#arguments.TABean.getHOMEADDRESS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="100">,
				HOMECITY = <cfqueryparam value="#arguments.TABean.getHOMECITY()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
				HOMESTATE = <cfqueryparam value="#arguments.TABean.getHOMESTATE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
				HOMEZIP = <cfqueryparam value="#arguments.TABean.getHOMEZIP()#" cfsqltype="CF_SQL_VARCHAR" maxlength="10">,
				WORKDAYS = <cfqueryparam value="#arguments.TABean.getWORKDAYS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
				WORKTIME = <cfqueryparam value="#arguments.TABean.getWORKTIME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
				DESTINATION = <cfqueryparam value="#arguments.TABean.getDESTINATION()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
				TRAVPREF = <cfqueryparam value="#arguments.TABean.getTRAVPREF()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
				DEPARTUREFROM = <cfqueryparam value="#arguments.TABean.getDEPARTUREFROM()#" cfsqltype="CF_SQL_VARCHAR" maxlength="60">,
			<cfif NOT len(arguments.TABean.getDEPARTUREDATE())>
				DEPARTUREDATE = <cfqueryparam null="true">,
			<cfelse>
				DEPARTUREDATE = <cfqueryparam value="#arguments.TABean.getDEPARTUREDATE()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getRETURNDATE())>
				RETURNDATE = <cfqueryparam null="true">,
			<cfelse>
				RETURNDATE = <cfqueryparam value="#arguments.TABean.getRETURNDATE()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
				PURPOSE = <cfqueryparam value="#arguments.TABean.getPURPOSE()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.TABean.getESTCOST())>
				ESTCOST = <cfqueryparam null="true">,
			<cfelse>
				ESTCOST = <cfqueryparam value="#int(arguments.TABean.getESTCOST())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
				ACTUALSREQ = <cfqueryparam value="#arguments.TABean.getACTUALSREQ()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				TRAVADV = <cfqueryparam value="#arguments.TABean.getTRAVADV()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				PERSTRAV = <cfqueryparam value="#arguments.TABean.getPERSTRAV()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfif NOT len(arguments.TABean.getPERSTRAVBEGIN())>
				PERSTRAVBEGIN = <cfqueryparam null="true">,
			<cfelse>
				PERSTRAVBEGIN = <cfqueryparam value="#arguments.TABean.getPERSTRAVBEGIN()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPERSTRAVEND())>
				PERSTRAVEND = <cfqueryparam null="true">,
			<cfelse>
				PERSTRAVEND = <cfqueryparam value="#arguments.TABean.getPERSTRAVEND()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPERSTRAVAIRFARE())>
				PERSTRAVAIRFARE = <cfqueryparam null="true">,
			<cfelse>
				PERSTRAVAIRFARE = <cfqueryparam value="#int(arguments.TABean.getPERSTRAVAIRFARE())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
				STATEAUTHTRV = <cfqueryparam value="#arguments.TABean.getSTATEAUTHTRV()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
				HOTELINC = <cfqueryparam value="#arguments.TABean.getHOTELINC()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				CARINC = <cfqueryparam value="#arguments.TABean.getCARINC()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				CONFCOM = <cfqueryparam value="#arguments.TABean.getCONFCOM()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
				SUPERVISOR = <cfqueryparam value="#arguments.TABean.getSUPERVISOR()#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">,
				ISSUBMITTED = <cfqueryparam value="#arguments.TABean.getISSUBMITTED()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				SPECIALINST = <cfqueryparam value="#arguments.TABean.getSPECIALINST()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1000">,
			<cfif NOT len(arguments.TABean.getCREATED())>
				CREATED = <cfqueryparam null="true">,
			<cfelse>
				CREATED = <cfqueryparam value="#arguments.TABean.getCREATED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getUPDATED())>
				UPDATED = <cfqueryparam null="true">,
			<cfelse>
				UPDATED = <cfqueryparam value="#arguments.TABean.getUPDATED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getSUBMITTED())>
				SUBMITTED = <cfqueryparam null="true">,
			<cfelse>
				SUBMITTED = <cfqueryparam value="#arguments.TABean.getSUBMITTED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getDELETED())>
				DELETED = <cfqueryparam null="true">,
			<cfelse>
				DELETED = <cfqueryparam value="#arguments.TABean.getDELETED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTRAVELERID())>
				TRAVELERID = <cfqueryparam null="true">,
			<cfelse>
				TRAVELERID = <cfqueryparam value="#int(arguments.TABean.getTRAVELERID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
			<cfif NOT len(arguments.TABean.getPREPARERID())>
				PREPARERID = <cfqueryparam null="true">,
			<cfelse>
				PREPARERID = <cfqueryparam value="#int(arguments.TABean.getPREPARERID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
				TRAVADVWN = <cfqueryparam value="#arguments.TABean.getTRAVADVWN()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
			<cfif NOT len(arguments.TABean.getTRAVADVWNAMT())>
				TRAVADVWNAMT = <cfqueryparam null="true">,
			<cfelse>
				TRAVADVWNAMT = <cfqueryparam value="#int(arguments.TABean.getTRAVADVWNAMT())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getATMWITHDRAWAL())>
				ATMWITHDRAWAL = <cfqueryparam null="true">,
			<cfelse>
				ATMWITHDRAWAL = <cfqueryparam value="#int(arguments.TABean.getATMWITHDRAWAL())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
				EDOCSID = <cfqueryparam value="#arguments.TABean.getEDOCSID()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
				EDOCSNAME = <cfqueryparam value="#arguments.TABean.getEDOCSNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">,
				DESTINATIONTO = <cfqueryparam value="#arguments.TABean.getDESTINATIONTO()#" cfsqltype="CF_SQL_VARCHAR" maxlength="512">,
			<cfif NOT len(arguments.TABean.getESTIMATORID())>
				ESTIMATORID = <cfqueryparam null="true">,
			<cfelse>
				ESTIMATORID = <cfqueryparam value="#int(arguments.TABean.getESTIMATORID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVNONTAX())>
				TAXTRAVNONTAX = <cfqueryparam null="true">,
			<cfelse>
				TAXTRAVNONTAX = <cfqueryparam value="#int(arguments.TABean.getTAXTRAVNONTAX())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVTAXABLE())>
				TAXTRAVTAXABLE = <cfqueryparam null="true">,
			<cfelse>
				TAXTRAVTAXABLE = <cfqueryparam value="#int(arguments.TABean.getTAXTRAVTAXABLE())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
			<cfif NOT len(arguments.TABean.getTAXTRAVTOTAL())>
				TAXTRAVTOTAL = <cfqueryparam null="true">,
			<cfelse>
				TAXTRAVTOTAL = <cfqueryparam value="#int(arguments.TABean.getTAXTRAVTOTAL())#" cfsqltype="CF_SQL_FLOAT" maxlength="38">,
			</cfif>
				PROCESSID = <cfqueryparam value="#int(arguments.TABean.getPROCESSID())#" cfsqltype="CF_SQL_FLOAT" maxlength="15">,
				MILEAGERATE = (
                            Select id
                              from mileagerate
                             where mileagerate = <cfqueryparam value="#arguments.TABean.getMILEAGERATE()#" cfsqltype="CF_SQL_FLOAT" maxlength="15">
                ),

			<!---<cfif NOT len(arguments.TABean.getOOPTOTALS())>--->
				<!---OOPTOTALS = <cfqueryparam null="true">,--->
			<!---<cfelse>--->
				OOPTOTALS = <cfqueryparam value="#int(arguments.TABean.getOOPTOTALS())#" cfsqltype="CF_SQL_FLOAT">,
			<!---</cfif>--->
			<!---<cfif NOT len(arguments.TABean.getTOTALDUE())>
				TOTALDUE = <cfqueryparam null="true">,
			<cfelse>--->
				TOTALDUE = <cfqueryparam value="#int(arguments.TABean.getTOTALDUE())#" cfsqltype="CF_SQL_FLOAT">,
			<!---</cfif>--->
				TOTALTRIPEXPENSE = <cfqueryparam value="#int(arguments.TABean.getTOTALTRIPEXPENSE())#" cfsqltype="CF_SQL_FLOAT">
				 where ID = <cfqueryparam value="#int(arguments.TABean.getID())#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>

			<cfset msg.id = #arguments.TABean.getID()#>
			<cfset msg.text = "Record updated successfully.">
			<cfset msg.type = "success">
			<cfcatch type="any" name="e">
				<cfset msg.text = "An error has occured. The record was not updated.">
				<cfset msg.type = "error">
				<cfset msg.result = e>
			</cfcatch>
		</cftry>
		<cfreturn msg>
	</cffunction>

	<cffunction name="getRejectReason" output="false" returnType="string">
		<cfargument name="taid" required="true" type="numeric">

		<cfset var rejQuery	= new Query()>
		<cfquery name="rejQuery">
			select details
			  from eta_log
			 where taid = <cfqueryparam value="#taid#" cfsqltype="CF_SQL_FLOAT">
			 order by id desc
         </cfquery>

		<cfreturn rejQuery.details>
	</cffunction>

	<cfscript>

	public any function getAll() {
		var qRead = new query();

		var sqlString = 'Select * from TA';
		qRead.setSQL(sqlString);

		return qRead.execute().getResult();
	}

	/*public any function getBeanById( required any id ) {
		var qRead = new query();

		var sqlString = '
			SELECT TA.ID, TA.FISCALYEAR, TA.TANUMBER, TA.EE, TA.INSTATE,
			       TA.WARRANTADDR, TA.PVN, TA.PHYSADDR, TA.TRAVELERNAME, TA.TITLE, TA.DEPT,
			       TA.DIV, TA.BU, TA.DUTYSTATION, TA.HOMEADDRESS, TA.HOMECITY, TA.HOMESTATE,
			       TA.HOMEZIP, TA.WORKDAYS, TA.WORKTIME, TA.DESTINATION, TA.TRAVPREF,
			       TA.DEPARTUREFROM, TA.DEPARTUREDATE, TA.RETURNDATE, TA.PURPOSE, TA.ESTCOST,
			       TA.ACTUALSREQ, TA.TRAVADV, TA.PERSTRAV, TA.PERSTRAVBEGIN, TA.PERSTRAVEND,
			       TA.PERSTRAVAIRFARE, TA.STATEAUTHTRV, TA.HOTELINC, TA.CARINC, TA.CONFCOM,
			       TA.SUPERVISOR, TA.ISSUBMITTED, TA.SPECIALINST, TA.CREATED, TA.UPDATED,
			       TA.SUBMITTED, TA.DELETED, TA.TRAVELERID, TA.PREPARERID, TA.TRAVADVWN,
			       TA.TRAVADVWNAMT, TA.ATMWITHDRAWAL, TA.EDOCSID, TA.EDOCSNAME,
			       TA.DESTINATIONTO, TA.ESTIMATORID, TA.TAXTRAVNONTAX, TA.TAXTRAVTAXABLE,
			       TA.TAXTRAVTOTAL, TA.PROCESSID, MILEAGERATE.MILEAGERATE
			  FROM TA
			 INNER JOIN MILEAGERATE
			    ON MILEAGERATE.ID = TA.MILEAGERATE
			 WHERE TA.ID          = :ID
			 ';


		if(isValid('integer',id)) {
			qRead.addParam(name='ID',value='#arguments.id#',CFSQLTYPE='CF_SQL_INTEGER');
		} else {
			qRead.addParam(name='ID',value='#arguments.id#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		qRead.setSQL(sqlString);
		var result = qRead.execute().getResult();

		var bean = new model.beans.ta().init();
		bean.setID( result.ID );
		bean.setFISCALYEAR( result.FISCALYEAR );
		bean.setTANUMBER( result.TANUMBER );
		bean.setEE( result.EE );
		bean.setINSTATE( result.INSTATE );
		bean.setPHYSADDR( result.PHYSADDR );
		bean.setWARRANTADDR( result.WARRANTADDR );
		bean.setPVN( result.PVN );
		bean.setTRAVELERNAME( result.TRAVELERNAME );
		bean.setTITLE( result.TITLE );
		bean.setDEPT( result.DEPT );
		bean.setDIV( result.DIV );
		bean.setBU( result.BU );
		bean.setDUTYSTATION( result.DUTYSTATION );
		bean.setHOMEADDRESS( result.HOMEADDRESS );
		bean.setHOMECITY( result.HOMECITY );
		bean.setHOMESTATE( result.HOMESTATE );
		bean.setHOMEZIP( result.HOMEZIP );
		bean.setWORKDAYS( result.WORKDAYS );
		bean.setWORKTIME( result.WORKTIME );
		bean.setDESTINATION( result.DESTINATION );
		bean.setTRAVPREF( result.TRAVPREF );
		bean.setDEPARTUREFROM( result.DEPARTUREFROM );
		bean.setDEPARTUREDATE( result.DEPARTUREDATE );
		bean.setRETURNDATE( result.RETURNDATE );
		bean.setPURPOSE( result.PURPOSE );
		bean.setESTCOST( result.ESTCOST );
		bean.setACTUALSREQ( result.ACTUALSREQ );
		bean.setTRAVADV( result.TRAVADV );
		bean.setPERSTRAV( result.PERSTRAV );
		bean.setPERSTRAVBEGIN( result.PERSTRAVBEGIN );
		bean.setPERSTRAVEND( result.PERSTRAVEND );
		bean.setPERSTRAVAIRFARE( result.PERSTRAVAIRFARE );
		bean.setSTATEAUTHTRV( result.STATEAUTHTRV );
		bean.setHOTELINC( result.HOTELINC );
		bean.setCARINC( result.CARINC );
		bean.setCONFCOM( result.CONFCOM );
		bean.setSUPERVISOR( result.SUPERVISOR );
		bean.setISSUBMITTED( result.ISSUBMITTED );
		bean.setSPECIALINST( result.SPECIALINST );
		bean.setCREATED( result.CREATED );
		bean.setUPDATED( result.UPDATED );
		bean.setSUBMITTED( result.SUBMITTED );
		bean.setDELETED( result.DELETED );
		bean.setTRAVELERID( result.TRAVELERID );
		bean.setPREPARERID( result.PREPARERID );
		bean.setTRAVADVWN( result.TRAVADVWN );
		bean.setTRAVADVWNAMT( result.TRAVADVWNAMT );
		bean.setATMWITHDRAWAL( result.ATMWITHDRAWAL );
		bean.setEDOCSID( result.EDOCSID );
		bean.setEDOCSNAME( result.EDOCSNAME );
		bean.setDESTINATIONTO( result.DESTINATIONTO );
		bean.setESTIMATORID( result.ESTIMATORID );
		bean.setTAXTRAVNONTAX( result.TAXTRAVNONTAX );
		bean.setTAXTRAVTAXABLE( result.TAXTRAVTAXABLE );
		bean.setTAXTRAVTOTAL( result.TAXTRAVTOTAL );
		bean.setPROCESSID( result.PROCESSID );
		bean.setMILEAGERATE( result.MILEAGERATE );

		return bean;
	}*/

	public any function getQueryBy() {
		var qRead = new query();

		var sqlString = 'select * from TA where 1=1 and ';

		if(structkeyexists(arguments, 'ID')){
			sqlString &= 'ID = :param1';
			qRead.addParam(name='param1', value='#arguments.ID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'FISCALYEAR')){
			sqlString &= 'FISCALYEAR = :param2';
			qRead.addParam(name='param2', value='#arguments.FISCALYEAR#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TANUMBER')){
			sqlString &= 'TANUMBER = :param3';
			qRead.addParam(name='param3', value='#arguments.TANUMBER#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'EE')){
			sqlString &= 'EE = :param4';
			qRead.addParam(name='param4', value='#arguments.EE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'INSTATE')){
			sqlString &= 'INSTATE = :param5';
			qRead.addParam(name='param5', value='#arguments.INSTATE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PHYSADDR')){
			sqlString &= 'PHYSADDR = :param6';
			qRead.addParam(name='param6', value='#arguments.PHYSADDR#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'WARRANTADDR')){
			sqlString &= 'WARRANTADDR = :param7';
			qRead.addParam(name='param7', value='#arguments.WARRANTADDR#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PVN')){
			sqlString &= 'PVN = :param9';
			qRead.addParam(name='param9', value='#arguments.PVN#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TRAVELERNAME')){
			sqlString &= 'TRAVELERNAME = :param10';
			qRead.addParam(name='param10', value='#arguments.TRAVELERNAME#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TITLE')){
			sqlString &= 'TITLE = :param11';
			qRead.addParam(name='param11', value='#arguments.TITLE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DEPT')){
			sqlString &= 'DEPT = :param12';
			qRead.addParam(name='param12', value='#arguments.DEPT#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DIV')){
			sqlString &= 'DIV = :param13';
			qRead.addParam(name='param13', value='#arguments.DIV#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'BU')){
			sqlString &= 'BU = :param14';
			qRead.addParam(name='param14', value='#arguments.BU#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DUTYSTATION')){
			sqlString &= 'DUTYSTATION = :param15';
			qRead.addParam(name='param15', value='#arguments.DUTYSTATION#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'HOMEADDRESS')){
			sqlString &= 'HOMEADDRESS = :param16';
			qRead.addParam(name='param16', value='#arguments.HOMEADDRESS#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'HOMECITY')){
			sqlString &= 'HOMECITY = :param17';
			qRead.addParam(name='param17', value='#arguments.HOMECITY#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'HOMESTATE')){
			sqlString &= 'HOMESTATE = :param18';
			qRead.addParam(name='param18', value='#arguments.HOMESTATE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'HOMEZIP')){
			sqlString &= 'HOMEZIP = :param19';
			qRead.addParam(name='param19', value='#arguments.HOMEZIP#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'WORKDAYS')){
			sqlString &= 'WORKDAYS = :param20';
			qRead.addParam(name='param20', value='#arguments.WORKDAYS#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'WORKTIME')){
			sqlString &= 'WORKTIME = :param21';
			qRead.addParam(name='param21', value='#arguments.WORKTIME#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DESTINATION')){
			sqlString &= 'DESTINATION = :param22';
			qRead.addParam(name='param22', value='#arguments.DESTINATION#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TRAVPREF')){
			sqlString &= 'TRAVPREF = :param23';
			qRead.addParam(name='param23', value='#arguments.TRAVPREF#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DEPARTUREFROM')){
			sqlString &= 'DEPARTUREFROM = :param24';
			qRead.addParam(name='param24', value='#arguments.DEPARTUREFROM#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DEPARTUREDATE')){
			sqlString &= 'DEPARTUREDATE = :param25';
			qRead.addParam(name='param25', value='#arguments.DEPARTUREDATE#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'RETURNDATE')){
			sqlString &= 'RETURNDATE = :param26';
			qRead.addParam(name='param26', value='#arguments.RETURNDATE#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'PURPOSE')){
			sqlString &= 'PURPOSE = :param27';
			qRead.addParam(name='param27', value='#arguments.PURPOSE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'ESTCOST')){
			sqlString &= 'ESTCOST = :param28';
			qRead.addParam(name='param28', value='#arguments.ESTCOST#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'ACTUALSREQ')){
			sqlString &= 'ACTUALSREQ = :param29';
			qRead.addParam(name='param29', value='#arguments.ACTUALSREQ#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TRAVADV')){
			sqlString &= 'TRAVADV = :param30';
			qRead.addParam(name='param30', value='#arguments.TRAVADV#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PERSTRAV')){
			sqlString &= 'PERSTRAV = :param31';
			qRead.addParam(name='param31', value='#arguments.PERSTRAV#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PERSTRAVBEGIN')){
			sqlString &= 'PERSTRAVBEGIN = :param32';
			qRead.addParam(name='param32', value='#arguments.PERSTRAVBEGIN#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'PERSTRAVEND')){
			sqlString &= 'PERSTRAVEND = :param33';
			qRead.addParam(name='param33', value='#arguments.PERSTRAVEND#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'PERSTRAVAIRFARE')){
			sqlString &= 'PERSTRAVAIRFARE = :param34';
			qRead.addParam(name='param34', value='#arguments.PERSTRAVAIRFARE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'STATEAUTHTRV')){
			sqlString &= 'STATEAUTHTRV = :param35';
			qRead.addParam(name='param35', value='#arguments.STATEAUTHTRV#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'HOTELINC')){
			sqlString &= 'HOTELINC = :param36';
			qRead.addParam(name='param36', value='#arguments.HOTELINC#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'CARINC')){
			sqlString &= 'CARINC = :param37';
			qRead.addParam(name='param37', value='#arguments.CARINC#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'CONFCOM')){
			sqlString &= 'CONFCOM = :param38';
			qRead.addParam(name='param38', value='#arguments.CONFCOM#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'SUPERVISOR')){
			sqlString &= 'SUPERVISOR = :param39';
			qRead.addParam(name='param39', value='#arguments.SUPERVISOR#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'ISSUBMITTED')){
			sqlString &= 'ISSUBMITTED = :param40';
			qRead.addParam(name='param40', value='#arguments.ISSUBMITTED#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'SPECIALINST')){
			sqlString &= 'SPECIALINST = :param41';
			qRead.addParam(name='param41', value='#arguments.SPECIALINST#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'CREATED')){
			sqlString &= 'CREATED = :param42';
			qRead.addParam(name='param42', value='#arguments.CREATED#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'UPDATED')){
			sqlString &= 'UPDATED = :param43';
			qRead.addParam(name='param43', value='#arguments.UPDATED#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'SUBMITTED')){
			sqlString &= 'SUBMITTED = :param44';
			qRead.addParam(name='param44', value='#arguments.SUBMITTED#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'DELETED')){
			sqlString &= 'DELETED = :param45';
			qRead.addParam(name='param45', value='#arguments.DELETED#',CFSQLTYPE='CF_SQL_DATE');
		}

		if(structkeyexists(arguments, 'TRAVELERID')){
			sqlString &= 'TRAVELERID = :param46';
			qRead.addParam(name='param46', value='#arguments.TRAVELERID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PREPARERID')){
			sqlString &= 'PREPARERID = :param47';
			qRead.addParam(name='param47', value='#arguments.PREPARERID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TRAVADVWN')){
			sqlString &= 'TRAVADVWN = :param48';
			qRead.addParam(name='param48', value='#arguments.TRAVADVWN#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TRAVADVWNAMT')){
			sqlString &= 'TRAVADVWNAMT = :param49';
			qRead.addParam(name='param49', value='#arguments.TRAVADVWNAMT#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'ATMWITHDRAWAL')){
			sqlString &= 'ATMWITHDRAWAL = :param50';
			qRead.addParam(name='param50', value='#arguments.ATMWITHDRAWAL#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'EDOCSID')){
			sqlString &= 'EDOCSID = :param51';
			qRead.addParam(name='param51', value='#arguments.EDOCSID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'EDOCSNAME')){
			sqlString &= 'EDOCSNAME = :param52';
			qRead.addParam(name='param52', value='#arguments.EDOCSNAME#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'DESTINATIONTO')){
			sqlString &= 'DESTINATIONTO = :param53';
			qRead.addParam(name='param53', value='#arguments.DESTINATIONTO#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'ESTIMATORID')){
			sqlString &= 'ESTIMATORID = :param54';
			qRead.addParam(name='param54', value='#arguments.ESTIMATORID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TAXTRAVNONTAX')){
			sqlString &= 'TAXTRAVNONTAX = :param55';
			qRead.addParam(name='param55', value='#arguments.TAXTRAVNONTAX#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TAXTRAVTAXABLE')){
			sqlString &= 'TAXTRAVTAXABLE = :param56';
			qRead.addParam(name='param56', value='#arguments.TAXTRAVTAXABLE#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'TAXTRAVTOTAL')){
			sqlString &= 'TAXTRAVTOTAL = :param57';
			qRead.addParam(name='param57', value='#arguments.TAXTRAVTOTAL#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'PROCESSID')){
			sqlString &= 'PROCESSID = :param58';
			qRead.addParam(name='param58', value='#arguments.PROCESSID#',CFSQLTYPE='CF_SQL_VARCHAR');
		}

		if(structkeyexists(arguments, 'MILEAGERATE')){
			sqlString &= 'MILEAGERATE = :param59';
			qRead.addParam(name='param59', value='#arguments.MILEAGERATE#',CFSQLTYPE='CF_SQL_FLOAT');
		}

		if(structkeyexists(arguments, 'OOPTOTALS')){
			sqlString &= 'OOPTOTALS = :param60';
			qRead.addParam(name='param60', value='#arguments.OOPTOTALS#',CFSQLTYPE='CF_SQL_DECIMAL');
		}

		if(structkeyexists(arguments, 'TOTALDUE')){
			sqlString &= 'TOTALDUE = :param61';
			qRead.addParam(name='param61', value='#arguments.TOTALDUE#',CFSQLTYPE='CF_SQL_DECIMAL');
		}

		if(structkeyexists(arguments, 'TOTALTRIPEXPENSE')){
			sqlString &= 'TOTALDUE = :param62';
			qRead.addParam(name='param62', value='#arguments.TOTALDUE#',CFSQLTYPE='CF_SQL_DECIMAL');
		}

		qRead.setSQL(sqlString);
		return qRead.execute().getResult();
	}

	/*	public any function create( required any bean ) {
		try {
			var qInsert = new query();

			var sqlString = 'Insert Into TA(FISCALYEAR,TANUMBER,EE,INSTATE,PHYSADDR,WARRANTADDR,PVN,TRAVELERNAME,TITLE,DEPT,DIV,BU,DUTYSTATION,HOMEADDRESS,HOMECITY,HOMESTATE,HOMEZIP,WORKDAYS,WORKTIME,DESTINATION,TRAVPREF,DEPARTUREFROM,DEPARTUREDATE,RETURNDATE,PURPOSE,ESTCOST,ACTUALSREQ,TRAVADV,PERSTRAV,PERSTRAVBEGIN,PERSTRAVEND,PERSTRAVAIRFARE,STATEAUTHTRV,HOTELINC,CARINC,CONFCOM,SUPERVISOR,ISSUBMITTED,SPECIALINST,CREATED,UPDATED,SUBMITTED,DELETED,TRAVELERID,PREPARERID,TRAVADVWN,TRAVADVWNAMT,ATMWITHDRAWAL,EDOCSID,EDOCSNAME,DESTINATIONTO,ESTIMATORID,TAXTRAVNONTAX,TAXTRAVTAXABLE,TAXTRAVTOTAL,PROCESSID)'
				& ' values(:FISCALYEAR,:TANUMBER,:EE,:INSTATE,:PHYSADDR,:WARRANTADDR,:PVN,:TRAVELERNAME,:TITLE,:DEPT,:DIV,:BU,:DUTYSTATION,:HOMEADDRESS,:HOMECITY,:HOMESTATE,:HOMEZIP,:WORKDAYS,:WORKTIME,:DESTINATION,:TRAVPREF,:DEPARTUREFROM,:DEPARTUREDATE,:RETURNDATE,:PURPOSE,:ESTCOST,:ACTUALSREQ,:TRAVADV,:PERSTRAV,:PERSTRAVBEGIN,:PERSTRAVEND,:PERSTRAVAIRFARE,:STATEAUTHTRV,:HOTELINC,:CARINC,:CONFCOM,:SUPERVISOR,:ISSUBMITTED,:SPECIALINST,:CREATED,:UPDATED,:SUBMITTED,:DELETED,:TRAVELERID,:PREPARERID,:TRAVADVWN,:TRAVADVWNAMT,:ATMWITHDRAWAL,:EDOCSID,:EDOCSNAME,:DESTINATIONTO,:ESTIMATORID,:TAXTRAVNONTAX,:TAXTRAVTAXABLE,:TAXTRAVTOTAL,:PROCESSID)';
			qInsert.addParam(name='FISCALYEAR', value='#arguments.bean.getFISCALYEAR()#',CFSQLTYPE='CF_SQL_FLOAT', null='#not len(trim(arguments.bean.getFISCALYEAR()))#');
			qInsert.addParam(name='TANUMBER', value='#arguments.bean.getTANUMBER()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='EE', value='#arguments.bean.getEE()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='INSTATE', value='#arguments.bean.getINSTATE()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='PHYSADDR', value='#arguments.bean.getPHYSADDR()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='WARRANTADDR', value='#arguments.bean.getWARRANTADDR()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='PVN', value='#arguments.bean.getPVN()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TRAVELERNAME', value='#arguments.bean.getTRAVELERNAME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TITLE', value='#arguments.bean.getTITLE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DEPT', value='#arguments.bean.getDEPT()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DIV', value='#arguments.bean.getDIV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='BU', value='#arguments.bean.getBU()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DUTYSTATION', value='#arguments.bean.getDUTYSTATION()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='HOMEADDRESS', value='#arguments.bean.getHOMEADDRESS()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='HOMECITY', value='#arguments.bean.getHOMECITY()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='HOMESTATE', value='#arguments.bean.getHOMESTATE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='HOMEZIP', value='#arguments.bean.getHOMEZIP()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='WORKDAYS', value='#arguments.bean.getWORKDAYS()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='WORKTIME', value='#arguments.bean.getWORKTIME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DESTINATION', value='#arguments.bean.getDESTINATION()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TRAVPREF', value='#arguments.bean.getTRAVPREF()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DEPARTUREFROM', value='#arguments.bean.getDEPARTUREFROM()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DEPARTUREDATE', value='#left(arguments.bean.getDEPARTUREDATE(), 10)#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='RETURNDATE', value='#left(arguments.bean.getRETURNDATE(), 10)#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='PURPOSE', value='#arguments.bean.getPURPOSE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='ESTCOST', value='#arguments.bean.getESTCOST()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='ACTUALSREQ', value='#arguments.bean.getACTUALSREQ()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='TRAVADV', value='#arguments.bean.getTRAVADV()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='PERSTRAV', value='#arguments.bean.getPERSTRAV()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='PERSTRAVBEGIN', value='#arguments.bean.getPERSTRAVBEGIN()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='PERSTRAVEND', value='#arguments.bean.getPERSTRAVEND()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='PERSTRAVAIRFARE', value='#arguments.bean.getPERSTRAVAIRFARE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='STATEAUTHTRV', value='#arguments.bean.getSTATEAUTHTRV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='HOTELINC', value='#arguments.bean.getHOTELINC()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='CARINC', value='#arguments.bean.getCARINC()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='CONFCOM', value='#arguments.bean.getCONFCOM()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='SUPERVISOR', value='#arguments.bean.getSUPERVISOR()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='ISSUBMITTED', value='#arguments.bean.getISSUBMITTED()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='SPECIALINST', value='#arguments.bean.getSPECIALINST()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='CREATED', value='#arguments.bean.getCREATED()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='UPDATED', value='#arguments.bean.getUPDATED()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='SUBMITTED', value='#arguments.bean.getSUBMITTED()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='DELETED', value='#arguments.bean.getDELETED()#',CFSQLTYPE='CF_SQL_DATE');
			qInsert.addParam(name='TRAVELERID', value='#int(arguments.bean.getTRAVELERID())#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='PREPARERID', value='#int(arguments.bean.getPREPARERID())#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.addParam(name='TRAVADVWN', value='#arguments.bean.getTRAVADVWN()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TRAVADVWNAMT', value='#arguments.bean.getTRAVADVWNAMT()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='ATMWITHDRAWAL', value='#arguments.bean.getATMWITHDRAWAL()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='EDOCSID', value='#arguments.bean.getEDOCSID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='EDOCSNAME', value='#arguments.bean.getEDOCSNAME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='DESTINATIONTO', value='#arguments.bean.getDESTINATIONTO()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='ESTIMATORID', value='#arguments.bean.getESTIMATORID()#',CFSQLTYPE='CF_SQL_FLOAT', null='#not len(trim(arguments.bean.getESTIMATORID()))#');
			qInsert.addParam(name='TAXTRAVNONTAX', value='#arguments.bean.getTAXTRAVNONTAX()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TAXTRAVTAXABLE', value='#arguments.bean.getTAXTRAVTAXABLE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='TAXTRAVTOTAL', value='#arguments.bean.getTAXTRAVTOTAL()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qInsert.addParam(name='PROCESSID', value='#arguments.bean.getPROCESSID()#',CFSQLTYPE='CF_SQL_FLOAT');
			qInsert.setSQL(sqlString);

			var qInserted = qInsert.execute().getPrefix().ROWID;

			var msg.id = new model.services.ta().getIdFromRowid(qInserted);
			var msg.text = 'Record inserted successfully.';
			var msg.type = 'success';
			return msg;
		} catch (any e) {
			var msg.text = 'An error has occured. The record was not inserted';
			var msg.type = 'error';
			var msg.result = e;
			var msg.realSql = new model.services.usefulfunctions().getRealSql(e);
			return msg;
		}
	} */

	/*
	public any function update( required any bean ) {
		var qUpdate = new query();
		var msg = {};

		try {

			var sqlString = 'Update TA Set'
				& ' FISCALYEAR = :FISCALYEAR,'
				& ' TANUMBER = :TANUMBER,'
				& ' EE = :EE,'
				& ' INSTATE = :INSTATE,'
				& ' PHYSADDR = :PHYSADDR,'
				& ' WARRANTADDR = :WARRANTADDR,'
				& ' PVN = :PVN,'
				& ' TRAVELERNAME = :TRAVELERNAME,'
				& ' TITLE = :TITLE,'
				& ' DEPT = :DEPT,'
				& ' DIV = :DIV,'
				& ' BU = :BU,'
				& ' DUTYSTATION = :DUTYSTATION,'
				& ' HOMEADDRESS = :HOMEADDRESS,'
				& ' HOMECITY = :HOMECITY,'
				& ' HOMESTATE = :HOMESTATE,'
				& ' HOMEZIP = :HOMEZIP,'
				& ' WORKDAYS = :WORKDAYS,'
				& ' WORKTIME = :WORKTIME,'
				& ' DESTINATION = :DESTINATION,'
				& ' TRAVPREF = :TRAVPREF,'
				& ' DEPARTUREFROM = :DEPARTUREFROM,'
				& ' DEPARTUREDATE = :DEPARTUREDATE,'
				& ' RETURNDATE = :RETURNDATE,'
				& ' PURPOSE = :PURPOSE,'
				& ' ESTCOST = :ESTCOST,'
				& ' ACTUALSREQ = :ACTUALSREQ,'
				& ' TRAVADV = :TRAVADV,'
				& ' PERSTRAV = :PERSTRAV,'
				& ' PERSTRAVBEGIN = :PERSTRAVBEGIN,'
				& ' PERSTRAVEND = :PERSTRAVEND,'
				& ' PERSTRAVAIRFARE = :PERSTRAVAIRFARE,'
				& ' STATEAUTHTRV = :STATEAUTHTRV,'
				& ' HOTELINC = :HOTELINC,'
				& ' CARINC = :CARINC,'
				& ' CONFCOM = :CONFCOM,'
				& ' SUPERVISOR = :SUPERVISOR,'
				& ' ISSUBMITTED = :ISSUBMITTED,'
				& ' SPECIALINST = :SPECIALINST,'
				& ' CREATED = :CREATED,'
				& ' UPDATED = :UPDATED,'
				& ' SUBMITTED = :SUBMITTED,'
				& ' DELETED = :DELETED,'
				& ' TRAVELERID = :TRAVELERID,'
				& ' PREPARERID = :PREPARERID,'
				& ' TRAVADVWN = :TRAVADVWN,'
				& ' TRAVADVWNAMT = :TRAVADVWNAMT,'
				& ' ATMWITHDRAWAL = :ATMWITHDRAWAL,'
				& ' EDOCSID = :EDOCSID,'
				& ' EDOCSNAME = :EDOCSNAME,'
				& ' DESTINATIONTO = :DESTINATIONTO,'
				& ' ESTIMATORID = :ESTIMATORID,'
				& ' TAXTRAVNONTAX = :TAXTRAVNONTAX,'
				& ' TAXTRAVTAXABLE = :TAXTRAVTAXABLE,'
				& ' TAXTRAVTOTAL = :TAXTRAVTOTAL,'
				& ' PROCESSID = :PROCESSID'
				& ' where ID = :ID';
			qUpdate.addParam(name='ID', value='#arguments.bean.getID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='FISCALYEAR', value='#arguments.bean.getFISCALYEAR()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TANUMBER', value='#arguments.bean.getTANUMBER()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='EE', value='#arguments.bean.getEE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='INSTATE', value='#arguments.bean.getINSTATE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PHYSADDR', value='#arguments.bean.getPHYSADDR()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='WARRANTADDR', value='#arguments.bean.getWARRANTADDR()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PVN', value='#arguments.bean.getPVN()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TRAVELERNAME', value='#arguments.bean.getTRAVELERNAME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TITLE', value='#arguments.bean.getTITLE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DEPT', value='#arguments.bean.getDEPT()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DIV', value='#arguments.bean.getDIV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='BU', value='#arguments.bean.getBU()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DUTYSTATION', value='#arguments.bean.getDUTYSTATION()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='HOMEADDRESS', value='#arguments.bean.getHOMEADDRESS()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='HOMECITY', value='#arguments.bean.getHOMECITY()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='HOMESTATE', value='#arguments.bean.getHOMESTATE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='HOMEZIP', value='#arguments.bean.getHOMEZIP()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='WORKDAYS', value='#arguments.bean.getWORKDAYS()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='WORKTIME', value='#arguments.bean.getWORKTIME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DESTINATION', value='#arguments.bean.getDESTINATION()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TRAVPREF', value='#arguments.bean.getTRAVPREF()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DEPARTUREFROM', value='#arguments.bean.getDEPARTUREFROM()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DEPARTUREDATE', value='#arguments.bean.getDEPARTUREDATE()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='RETURNDATE', value='#arguments.bean.getRETURNDATE()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='PURPOSE', value='#arguments.bean.getPURPOSE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='ESTCOST', value='#arguments.bean.getESTCOST()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='ACTUALSREQ', value='#arguments.bean.getACTUALSREQ()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TRAVADV', value='#arguments.bean.getTRAVADV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PERSTRAV', value='#arguments.bean.getPERSTRAV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PERSTRAVBEGIN', value='#arguments.bean.getPERSTRAVBEGIN()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='PERSTRAVEND', value='#arguments.bean.getPERSTRAVEND()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='PERSTRAVAIRFARE', value='#arguments.bean.getPERSTRAVAIRFARE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='STATEAUTHTRV', value='#arguments.bean.getSTATEAUTHTRV()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='HOTELINC', value='#arguments.bean.getHOTELINC()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='CARINC', value='#arguments.bean.getCARINC()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='CONFCOM', value='#arguments.bean.getCONFCOM()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='SUPERVISOR', value='#arguments.bean.getSUPERVISOR()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='ISSUBMITTED', value='#arguments.bean.getISSUBMITTED()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='SPECIALINST', value='#arguments.bean.getSPECIALINST()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='CREATED', value='#arguments.bean.getCREATED()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='UPDATED', value='#arguments.bean.getUPDATED()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='SUBMITTED', value='#arguments.bean.getSUBMITTED()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='DELETED', value='#arguments.bean.getDELETED()#',CFSQLTYPE='CF_SQL_DATE');
			qUpdate.addParam(name='TRAVELERID', value='#arguments.bean.getTRAVELERID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PREPARERID', value='#arguments.bean.getPREPARERID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TRAVADVWN', value='#arguments.bean.getTRAVADVWN()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TRAVADVWNAMT', value='#arguments.bean.getTRAVADVWNAMT()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='ATMWITHDRAWAL', value='#arguments.bean.getATMWITHDRAWAL()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='EDOCSID', value='#arguments.bean.getEDOCSID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='EDOCSNAME', value='#arguments.bean.getEDOCSNAME()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='DESTINATIONTO', value='#arguments.bean.getDESTINATIONTO()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='ESTIMATORID', value='#arguments.bean.getESTIMATORID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TAXTRAVNONTAX', value='#arguments.bean.getTAXTRAVNONTAX()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TAXTRAVTAXABLE', value='#arguments.bean.getTAXTRAVTAXABLE()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='TAXTRAVTOTAL', value='#arguments.bean.getTAXTRAVTOTAL()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.addParam(name='PROCESSID', value='#arguments.bean.getPROCESSID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qUpdate.setSQL(sqlString);

			qUpdate.execute();

			msg.id = arguments.bean.getID();
			msg.text = 'Record updated successfully.';
			msg.type = 'success';
			return msg;
		} catch (any e) {
			msg.text = 'An error has occured. The record was not updated.';
			msg.type = 'error';
			msg.result = e;
		}
		return msg;
	}
	*/

	public any function delete( required any bean ) {
		var msg = {};
		try {
			var qDelete = new query();

			var sqlString = 'Delete from TA where ID = :pkValue';
			qDelete.addParam(name='pkValue', value='#arguments.bean.getID()#',CFSQLTYPE='CF_SQL_VARCHAR');
			qDelete.setSQL(sqlString);

			qDelete.execute();
			msg.text = 'Record deleted successfully.';
			msg.type = 'success';
		} catch (any e) {
			msg.text = 'An error has occured. The record was not deleted';
			msg.type = 'error';
			msg.result = e;
		}
		return msg;
	}

	private string function createSQLUUID() {
		var uuid = createUUID();
		return left(uuid, 23) & '-' & right(uuid, 12);
	}
	</cfscript>

</cfcomponent>
