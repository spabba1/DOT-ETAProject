<cfcomponent accessors="true" output="false">

	<cffunction name="getAll" output="false" returnType="query">
		<cfset var qRead = new Query()>
		<cfset var result = {}>
		<cfquery name='qRead' result='result'>
			Select * from OUTOFSTATE
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="getBeanById" output="false" returnType="model.beans.OUTOFSTATE">
		<cfargument name="id" required="true" type="numeric">
		<cfset var qRead = new query()>
		<cfset var result = {}>
		<cfquery name="qRead" result="result">
			SELECT *
			FROM OUTOFSTATE
			WHERE ID = <cfqueryparam value="#ID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfset var OUTOFSTATEBean = new model.beans.OUTOFSTATE()>
		<cfset OUTOFSTATEBean.setID( qRead.ID )>
		<cfset OUTOFSTATEBean.setCONFNAME( qRead.CONFNAME )>
		<cfset OUTOFSTATEBean.setGOAL( qRead.GOAL )>
		<cfset OUTOFSTATEBean.setLOCALOPTION( qRead.LOCALOPTION )>
		<cfset OUTOFSTATEBean.setLOCALOPTIONREASON( qRead.LOCALOPTIONREASON )>
		<cfset OUTOFSTATEBean.setBENEFICIAL( qRead.BENEFICIAL )>
		<cfset OUTOFSTATEBean.setSHARING( qRead.SHARING )>
		<cfset OUTOFSTATEBean.setGROUPABLE( qRead.GROUPABLE )>
		<cfset OUTOFSTATEBean.setDEBRIEF( qRead.DEBRIEF )>
		<cfset OUTOFSTATEBean.setCOMMENTS( qRead.COMMENTS )>
		<cfset OUTOFSTATEBean.setTAID( qRead.TAID )>
		<cfreturn OUTOFSTATEBean>
	</cffunction>

	<cffunction name="getQueryBy" output="false" returnType="query">
		<cfset var qRead = new query()>
		<cfquery name="qRead">
			select * from OUTOFSTATE where 1=1 and

		<cfif (structKeyExists(arguments, 'ID'))>
			ID = <cfqueryparam value="#arguments.ID#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'CONFNAME'))>
			CONFNAME = <cfqueryparam value="#arguments.CONFNAME#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'GOAL'))>
			GOAL = <cfqueryparam value="#arguments.GOAL#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'LOCALOPTION'))>
			LOCALOPTION = <cfqueryparam value="#arguments.LOCALOPTION#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'LOCALOPTIONREASON'))>
			LOCALOPTIONREASON = <cfqueryparam value="#arguments.LOCALOPTIONREASON#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'BENEFICIAL'))>
			BENEFICIAL = <cfqueryparam value="#arguments.BENEFICIAL#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'SHARING'))>
			SHARING = <cfqueryparam value="#arguments.SHARING#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'GROUPABLE'))>
			GROUPABLE = <cfqueryparam value="#arguments.GROUPABLE#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'DEBRIEF'))>
			DEBRIEF = <cfqueryparam value="#arguments.DEBRIEF#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'COMMENTS'))>
			COMMENTS = <cfqueryparam value="#arguments.COMMENTS#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'TAID'))>
			TAID = <cfqueryparam value="#arguments.TAID#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="create" output="false" returnType="struct">
		<cfargument name="OUTOFSTATEBean" required="true" type="model.beans.OUTOFSTATE">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>
			<cfquery name="qInsert" result="result">
				INSERT INTO OUTOFSTATE (
				CONFNAME,GOAL,LOCALOPTION,LOCALOPTIONREASON,BENEFICIAL,SHARING,GROUPABLE,DEBRIEF,COMMENTS,TAID
				) VALUES (
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getCONFNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="128">,
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getGOAL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getLOCALOPTION())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.OUTOFSTATEBean.getLOCALOPTION())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getLOCALOPTIONREASON()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getBENEFICIAL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getSHARING()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getGROUPABLE())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.OUTOFSTATEBean.getGROUPABLE())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
			<cfif NOT len(arguments.OUTOFSTATEBean.getDEBRIEF())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.OUTOFSTATEBean.getDEBRIEF())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
			<cfqueryparam value="#arguments.OUTOFSTATEBean.getCOMMENTS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getTAID())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.OUTOFSTATEBean.getTAID())#" cfsqltype="CF_SQL_FLOAT">
			</cfif>
				)
			</cfquery>

			<cfset msg.id = result.rowid>
			<cfset msg.text = "Record inserted successfully.">
			<cfset msg.type = "success">
		<cfcatch type="any" name="e">
			<cfset msg.text = "An error has occurred. The record was not inserted">
			<cfset msg.type = "error">
			<cfset msg.result = e>
		</cfcatch>

		</cftry>

		<cfreturn msg>
	</cffunction>

	<cffunction name="update" output="false" returnType="struct">
		<cfargument name="OUTOFSTATEBean" required="true" type="model.beans.OUTOFSTATE">

		<cfset var qUpdate = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>

			<cfquery>

			UPDATE OUTOFSTATE
			SET
				CONFNAME = <cfqueryparam value="#arguments.OUTOFSTATEBean.getCONFNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="128">,
				GOAL = <cfqueryparam value="#arguments.OUTOFSTATEBean.getGOAL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getLOCALOPTION())>
				LOCALOPTION = <cfqueryparam null="true">,
			<cfelse>
				LOCALOPTION = <cfqueryparam value="#int(arguments.OUTOFSTATEBean.getLOCALOPTION())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
				LOCALOPTIONREASON = <cfqueryparam value="#arguments.OUTOFSTATEBean.getLOCALOPTIONREASON()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
				BENEFICIAL = <cfqueryparam value="#arguments.OUTOFSTATEBean.getBENEFICIAL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
				SHARING = <cfqueryparam value="#arguments.OUTOFSTATEBean.getSHARING()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getGROUPABLE())>
				GROUPABLE = <cfqueryparam null="true">,
			<cfelse>
				GROUPABLE = <cfqueryparam value="#int(arguments.OUTOFSTATEBean.getGROUPABLE())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
			<cfif NOT len(arguments.OUTOFSTATEBean.getDEBRIEF())>
				DEBRIEF = <cfqueryparam null="true">,
			<cfelse>
				DEBRIEF = <cfqueryparam value="#int(arguments.OUTOFSTATEBean.getDEBRIEF())#" cfsqltype="CF_SQL_FLOAT">,
			</cfif>
				COMMENTS = <cfqueryparam value="#arguments.OUTOFSTATEBean.getCOMMENTS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="1024">,
			<cfif NOT len(arguments.OUTOFSTATEBean.getTAID())>
				TAID = <cfqueryparam null="true">,
			<cfelse>
				TAID = <cfqueryparam value="#int(arguments.OUTOFSTATEBean.getTAID())#" cfsqltype="CF_SQL_FLOAT">
			</cfif>
				 where ID = <cfqueryparam value="#int(arguments.OUTOFSTATEBean.getID())#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>

			<cfset msg.id = #arguments.OUTOFSTATEBean.getID()#>
			<cfset msg.text = "Record updated successfully.">
			<cfset msg.type = "success">
			<cfcatch type="any" name="e">
				<cfset msg.text = "An error has occurred. The record was not updated.">
				<cfset msg.type = "error">
				<cfset msg.result = e>
			</cfcatch>
		</cftry>
		<cfreturn msg>
	</cffunction>

	<cffunction name="delete" output="false" returnType="struct" type="model.beans.OUTOFSTATE">
		<cfargument name="bean" required="true">
		<cfset var msg = {}>

		<cftry>
			<cfset var qDelete = new query()>
			<cfquery name="qDelete">
				Delete from OUTOFSTATE
				where ID = <cfqueryparam value="#arguments.bean.getID()#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			<cfset msg.text = 'Record deleted successfully.'>
			<cfset msg.type = 'success'>
			<cfreturn msg>
		<cfcatch type="any">
			<cfset msg.text = 'An error has occurred. The record was not deleted'>
			<cfset msg.type = 'error'>
			<cfset msg.result = #cfcatch#>
			<cfreturn msg>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="createSQLUUID" type="private" returnType="string" output="false">
		<cfset var uuid = createUUID()>
		<cfreturn left(uuid, 23) & "-" & right(uuid, 12)>
	</cffunction>
</cfcomponent>
