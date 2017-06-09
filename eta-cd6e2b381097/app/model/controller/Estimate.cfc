<cfcomponent>

	<cffunction name="save" access="remote" output="false">
		<cfargument name="ta" type="string" required="true">
		<cfargument name="oostate" type="string" required="false" default="">
		<cfargument name="expenses" type="string" required="false" default="">
		<cfargument name="fincodes" type="string" required="false" default="">
		<cfargument name="trws" type="string" required="false" default="">
		<cfargument name="onecards" type="string" required="false" default="">

		<cfset var taBean = new model.beans.ta().init(argumentCollection=deserializeJSON(ta))>
		<cfset var oostateBean = new model.beans.oostate().init(argumentCollection=deserializeJSON(oostate))>

		<!---<cfdump var="#taBean#">--->
		<!---<cfdump var="#oostateBean#" abort>--->

		<cfset var expensesArray = deserializeJSON(expenses)>
		<cfset var fincodesArray = deserializeJSON(fincodes)>
		<cfset var trwsArray = deserializeJSON(trws)>
		<cfset var onecardsArray = deserializeJSON(onecards)>

		<cfset taBean.setDeparturedate(new model.services.usefulfunctions().fromDatepickerConvert(taBean.getDeparturedate()))>
		<cfset taBean.setReturndate(new model.services.usefulfunctions().fromDatepickerConvert(taBean.getReturndate()))>

		<cftry>

			<cftransaction>

				<cfset new model.services.expense().deleteAll(taBean.getId())>
				<cfloop array="#expensesArray#" index="exp">
					<cfset var expenseBean = new model.beans.expense().init(argumentCollection=#exp#)>
					<cfset expenseBean.setTaid(taBean.getId())>

					<cfset var expCreate = new model.dao.expense().create(expenseBean)>
				</cfloop>


				<cfset new model.services.financialcode().deleteAll(taBean.getId())>
				<cfloop array="#fincodesArray#" index="fcode">
					<cfset var fCodeBean = new model.beans.financial_code().init(argumentCollection=#fcode#)>
					<cfset fCodeBean.setTaid(taBean.getId())>

					<cfset var fcodeCreate = new model.dao.financialcode().create(fCodeBean)>
				</cfloop>

				<cfset new model.services.trw().deleteAll(taBean.getId())>
				<cfloop array="#trwsArray#" index="trw">
					<cfset var trwBean = new model.beans.trw().init(argumentCollection=#trw#)>
					<cfset trwBean.setTaid(taBean.getId())>

					<cfset var trwCreate = new model.dao.trw().create(trwBean)>
				</cfloop>

				<cfset new model.services.onecard().deleteAll(taBean.getId())>
				<cfloop array="#onecardsArray#" index="onecard">
					<cfset var onecardBean = new model.beans.onecard().init(argumentCollection=#onecard#)>
					<cfset onecardBean.setTaid(taBean.getId())>

					<cfset var onecardCreate = new model.dao.onecard().create(onecardBean)>
				</cfloop>

				<cfset var taUpdate = new model.dao.ta().update(taBean)>

				<cfif not taBean.getInState()>
					<cfset var oosUpdate = new model.dao.oostate().update(oostateBean)>
				</cfif>

				<!---<cftransaction action="commit"></cftransaction>--->
			</cftransaction>

			<cfset msg.type = "success">
			<cfset msg.text = "TA Estimation Saved">

			<cfcatch>
				<cfset msg.type = "error">
				<cfset msg.text = "Estimation was not saved">
				<cfset msg.detail = "#cfcatch#">
			</cfcatch>
		</cftry>

		<cfreturn msg>
	</cffunction>

</cfcomponent>
