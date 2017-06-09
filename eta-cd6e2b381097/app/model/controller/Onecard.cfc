<cfcomponent>

	<cffunction name="getAll">
		<cfreturn new model.dao.Onecard().getAll()>
	</cffunction>

	<!--- new create function --->
	<cffunction name="create">
		<cfset var bean = new model.beans.Onecard()>

		<cfset bean.setTYPE( rc.TYPE )>
		<cfset bean.setAKSASREFID( rc.AKSASREFID )>
		<cfset bean.setREFINVNUMBER( rc.REFINVNUMBER )>
		<cfset bean.setVENDORPVNDESC( rc.VENDORPVNDESC )>
		<cfset bean.setAMOUNT( rc.AMOUNT )>
		<cfset bean.setDATEPAID( rc.DATEPAID )>
		<cfset bean.setAKSASACCT( rc.AKSASACCT )>
		<cfset bean.setAKSASBATCHNUM( rc.AKSASBATCHNUM )>
		<cfset bean.setTAID( rc.TAID )>

		<cfreturn new model.dao.Onecard().create( bean )>
	}
	</cffunction>

	<!--- original create function
	<cffunction name="create" returntype="numeric" output="false">
		<cfargument name="onecard" required="true">
		<cfset var qCreate = new Query()>
		<cfset var result = {}>

		<cfset var onecardId = 0>

		<cfquery name="qCreate" result="result">
			insert into onecard (
				type,
			   	aksasrefid,
			   	refinvnumber,
			   	vendorpvndesc,
			   	amount,
				datepaid,
			   	aksasacct,
			   	aksasbatchnum,
			   	taid
			) VALUES (
				<cfqueryparam value="#arguments.onecard.getType()#" cfsqltype="CF_SQL_VARCHAR" maxLength="5">,
				<cfqueryparam value="#arguments.onecard.getAksasrefid()#" cfsqltype="CF_SQL_VARCHAR" maxLength="3">,
				<cfqueryparam value="#arguments.onecard.getRefinvnumber()#" cfsqltype="CF_SQL_VARCHAR" maxLength="25">,
				<cfqueryparam value="#arguments.onecard.getVendorpvndesc()#" cfsqltype="CF_SQL_VARCHAR" maxLength="100">,
				<cfqueryparam value="#val(arguments.onecard.getAmount())#" cfsqltype="CF_SQL_DOUBLE">,
				<cfqueryparam value="#dateFormat(arguments.onecard.getDatepaid())#" cfsqltype="CF_SQL_DATE">,
				<cfqueryparam value="#arguments.onecard.getAksasacct()#" cfsqltype="CF_SQL_VARCHAR" maxLength="25">,
				<cfqueryparam value="#arguments.onecard.getAksasbatchnum()#" cfsqltype="CF_SQL_VARCHAR" maxLength="25">,
				<cfqueryparam value="#arguments.onecard.getFk_taid()#" cfsqltype="CF_SQL_INTEGER">
			)
		</cfquery>

		<cfif result.recordCount>
		<cfset var insertId = new Query()>
		<cfset var idResult = {}>
			<cfquery name="insertId" result="idResult">
				select id
				  from onecard
				 where ROWID = <cfqueryparam value='#result.ROWID#'>
			</cfquery>

			<cfset onecardId = insertId.id>
		</cfif>

		<cfreturn onecardId>
	</cffunction>
--->

	<cffunction name="getOnecardsByTaId" access="remote" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfset var qOnecards = new Query()>
		<cfset var result = {}>
		<cfset var onecardArray = []>

		<cfquery name="qOnecards" result="result">
			select id, type, aksasrefid, refinvnumber, vendorpvndesc, amount, datepaid,
			       aksasacct, aksasbatchnum, taid
			  from onecard
			 where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
			 order by id
		</cfquery>

		<cfset var numOnecards = result.recordCount>

		<cfif result.recordCount GTE 1>
			<cfloop query="qOnecards">
				<cfset onecardArray[currentRow] = new model.beans.Onecard().init(
						id = qOnecards.id,
						type = qOnecards.type,
						aksasrefid = qOnecards.aksasrefid,
						refinvnumber = qOnecards.refinvnumber,
						vendorpvndesc = qOnecards.vendorpvndesc,
						amount = qOnecards.amount,
						datepaid = qOnecards.datepaid,
						aksasacct = qOnecards.aksasacct,
						aksasbatchnum = qOnecards.aksasbatchnum,
						taid = qOnecards.taid
						)>
			</cfloop>
		<cfelse>
			<cfset onecardArray[1] = new model.beans.Onecard()>
		</cfif>

		<cfreturn onecardArray>
	</cffunction>

	<cffunction name="getemptybean" output="false" access="remote">
		<cfreturn new model.beans.Onecard()>
	</cffunction>

	<cffunction name="update" returntype="boolean" output="false">
		<cfargument name="onecard" required="true">
		<cfset var qUpdate = new Query()>
		<cfset var result = {}>
		<cfset var boolSuccess = false>

		<cfquery name="qUpdate" result="result">
			update onecard
			   set type          = <cfqueryparam value="#arguments.onecard.gettype()#" cfsqltype="CF_SQL_VARCHAR">,
			       aksasrefid    = <cfqueryparam value="#arguments.onecard.getaksasrefid()#" cfsqltype="CF_SQL_VARCHAR">,
			       refinvnumber  = <cfqueryparam value="#arguments.onecard.getrefinvnumber()#" cfsqltype="CF_SQL_VARCHAR">,
			       vendorpvndesc = <cfqueryparam value="#arguments.onecard.getVendorpvndesc()#" cfsqltype="CF_SQL_VARCHAR">,
			       amount        = <cfqueryparam value="#arguments.onecard.getamount()#">,
			       datepaid      = <cfqueryparam value="#dateFormat(arguments.onecard.getdatepaid())#" cfsqltype="CF_SQL_VARCHAR">,
			       aksasacct     = <cfqueryparam value="#arguments.onecard.getaksasacct()#" cfsqltype="CF_SQL_VARCHAR">,
			       aksasbatchnum = <cfqueryparam value="#arguments.onecard.getaksasbatchnum()#" cfsqltype="CF_SQL_VARCHAR">
			 where id            = <cfqueryparam value="#arguments.onecard.getId()#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif result.recordCount GTE 1>
			<cfset boolSuccess = true>
		</cfif>

		<cfreturn boolSuccess>
	</cffunction>

	<cffunction name="deleteById" returntype="boolean" output="false">
		<cfargument name="id" type="numeric" required="true">
		<cfset var qDelete = new Query()>
		<cfset var result = {}>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete" result="result">
				delete from onecard
				 where id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
		<cfcatch>
			<cfset boolSuccess = false>
		</cfcatch>
		</cftry>

		<cfreturn boolSuccess>
	</cffunction>

    <cffunction name="deleteAll" output="false">
        <cfargument name="taid" required="true">
        <cfset var delQuery = new Query()>
        <cfset var result = {}>
        <cfset var msg = {}>
        <cftry>
        <cfquery name="delQuery" result="result">
            delete from onecard where taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfset msg.text = 'Onecard expenses deleted successfully.'>
        <cfset msg.type = 'success'>
        <cfcatch type="any" name="e">
			<cfthrow message = '#e#'>
            <cfset msg.text = 'Error deleting Onecard Expenses.'>
            <cfset msg.type = 'error'>
            <cfset msg.detail = e>
        </cfcatch>
        </cftry>

        <cfreturn msg>

    </cffunction>

</cfcomponent>
