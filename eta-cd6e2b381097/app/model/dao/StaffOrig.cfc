<cfcomponent>

	<cffunction name="getAll" output="false">

		<cfset var qRead = new Query()>
		<cfset var result = {}>
		<cfquery name="qRead" result="result">
			select * from STAFF, STAFF_ROLE
			where STAFF.staffroleid = STAFF_ROLE.id
		</cfquery>

		<cfreturn qRead>

	</cffunction>

	<cffunction name="getBeanById" output="false" returnType="model.beans.STAFF">
		<cfargument name="id" required="true" type="numeric">
		<cfset var qRead = new query()>
		<cfset var result = {}>
		<cfquery name="qRead" result="result">
			SELECT *
			FROM STAFF
			WHERE ID = <cfqueryparam value="#ID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfset var STAFFBean = new model.beans.STAFF()>
		<cfset STAFFBean.setID( qRead.ID )>
		<cfset STAFFBean.setFIRSTNAME( qRead.FIRSTNAME )>
		<cfset STAFFBean.setLASTNAME( qRead.LASTNAME )>
		<cfset STAFFBean.setEMAIL( qRead.EMAIL )>
		<cfset STAFFBean.setDATEJOINED( qRead.DATEJOINED )>
		<cfset STAFFBean.setDATELEFT( qRead.DATELEFT )>
		<cfset STAFFBean.setOTHERDETAILS( qRead.OTHERDETAILS )>
		<cfset STAFFBean.setSTAFFROLEID( qRead.STAFFROLEID )>
		<cfset STAFFBean.setNOTIFY( qRead.NOTIFY )>
		<cfset STAFFBean.setUSERNAME( qRead.USERNAME )>
		<cfreturn STAFFBean>
	</cffunction>

	<cffunction name="getQueryBy" output="false" returnType="query">
		<cfset var qRead = new query()>
		<cfquery name="qRead">
			select * from STAFF where 1=1 and

		<cfif (structKeyExists(arguments, 'ID'))>
			ID = <cfqueryparam value="#arguments.ID#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'FIRSTNAME'))>
			FIRSTNAME = <cfqueryparam value="#arguments.FIRSTNAME#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'LASTNAME'))>
			LASTNAME = <cfqueryparam value="#arguments.LASTNAME#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'EMAIL'))>
			EMAIL = <cfqueryparam value="#arguments.EMAIL#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'DATEJOINED'))>
			DATEJOINED = <cfqueryparam value="#arguments.DATEJOINED#" CFSQLTYPE="CF_SQL_DATE">
		</cfif>

		<cfif (structKeyExists(arguments, 'DATELEFT'))>
			DATELEFT = <cfqueryparam value="#arguments.DATELEFT#" CFSQLTYPE="CF_SQL_DATE">
		</cfif>

		<cfif (structKeyExists(arguments, 'OTHERDETAILS'))>
			OTHERDETAILS = <cfqueryparam value="#arguments.OTHERDETAILS#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'STAFFROLEID'))>
			STAFFROLEID = <cfqueryparam value="#arguments.STAFFROLEID#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'NOTIFY'))>
			NOTIFY = <cfqueryparam value="#arguments.NOTIFY#" CFSQLTYPE="CF_SQL_CHAR">
		</cfif>

		<cfif (structKeyExists(arguments, 'USERNAME'))>
			USERNAME = <cfqueryparam value="#arguments.USERNAME#" CFSQLTYPE="CF_SQL_VARCHAR">
		</cfif>

		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="create" output="false" returnType="struct">
		<cfargument name="STAFFBean" required="true" type="model.beans.STAFF">

		<cfset var qInsert = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>
			<cfquery name="qInsert" result="result">
				INSERT INTO STAFF (
				ID,FIRSTNAME,LASTNAME,EMAIL,DATEJOINED,DATELEFT,OTHERDETAILS,STAFFROLEID,NOTIFY,USERNAME
				) VALUES (
			<cfqueryparam value="#arguments.STAFFBean.getID()#" cfsqltype="CF_SQL_FLOAT">,
			<cfqueryparam value="#arguments.STAFFBean.getFIRSTNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfqueryparam value="#arguments.STAFFBean.getLASTNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfqueryparam value="#arguments.STAFFBean.getEMAIL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfif NOT len(arguments.STAFFBean.getDATEJOINED())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.STAFFBean.getDATEJOINED()#" cfsqltype="CF_SQL_TIMESTAMP" maxlength="19">,
			</cfif>
			<cfif NOT len(arguments.STAFFBean.getDATELEFT())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#arguments.STAFFBean.getDATELEFT()#" cfsqltype="CF_SQL_TIMESTAMP" maxlength="19">,
			</cfif>
			<cfqueryparam value="#arguments.STAFFBean.getOTHERDETAILS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="255">,
			<cfif NOT len(arguments.STAFFBean.getSTAFFROLEID())>
				<cfqueryparam null="true">,
			<cfelse>
				<cfqueryparam value="#int(arguments.STAFFBean.getSTAFFROLEID())#" cfsqltype="CF_SQL_FLOAT" maxlength="10">,
			</cfif>
			<cfqueryparam value="#arguments.STAFFBean.getNOTIFY()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
			<cfqueryparam value="#arguments.STAFFBean.getUSERNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">
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

	<cffunction name="update" output="false">
		<cfargument name="STAFFBean" required="true" type="model.beans.STAFF">

		<cfset var qUpdate = new Query()>
		<cfset var result = {}>
		<cfset var msg = {}>

		<cftry>

			<cfquery>

			UPDATE STAFF
			SET
				FIRSTNAME = <cfqueryparam value="#arguments.STAFFBean.getFIRSTNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
				LASTNAME = <cfqueryparam value="#arguments.STAFFBean.getLASTNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
				EMAIL = <cfqueryparam value="#arguments.STAFFBean.getEMAIL()#" cfsqltype="CF_SQL_VARCHAR" maxlength="45">,
			<cfif NOT len(arguments.STAFFBean.getDATEJOINED())>
				DATEJOINED = <cfqueryparam null="true">,
			<cfelse>
				DATEJOINED = <cfqueryparam value="#arguments.STAFFBean.getDATEJOINED()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
			<cfif NOT len(arguments.STAFFBean.getDATELEFT())>
				DATELEFT = <cfqueryparam null="true">,
			<cfelse>
				DATELEFT = <cfqueryparam value="#arguments.STAFFBean.getDATELEFT()#" cfsqltype="CF_SQL_TIMESTAMP">,
			</cfif>
				OTHERDETAILS = <cfqueryparam value="#arguments.STAFFBean.getOTHERDETAILS()#" cfsqltype="CF_SQL_VARCHAR" maxlength="255">,
			<cfif NOT len(arguments.STAFFBean.getSTAFFROLEID())>
				STAFFROLEID = <cfqueryparam null="true">,
			<cfelse>
				STAFFROLEID = <cfqueryparam value="#int(arguments.STAFFBean.getSTAFFROLEID())#" cfsqltype="CF_SQL_FLOAT" maxlength="10">,
			</cfif>
				NOTIFY = <cfqueryparam value="#arguments.STAFFBean.getNOTIFY()#" cfsqltype="CF_SQL_CHAR" maxlength="1">,
				USERNAME = <cfqueryparam value="#arguments.STAFFBean.getUSERNAME()#" cfsqltype="CF_SQL_VARCHAR" maxlength="20">
				 where ID = <cfqueryparam value="#int(arguments.STAFFBean.getID())#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>

			<cfset msg.id = #arguments.STAFFBean.getID()#>
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

	<cffunction name="delete" output="false">
		<cfargument name="bean" required="true">
		<cfset var msg = {}>

		<cftry>
			<cfset var qDelete = new query()>
			<cfquery name="qDelete">
				Delete from STAFF
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
