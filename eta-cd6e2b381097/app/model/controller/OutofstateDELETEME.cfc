<cfcomponent>

    <cffunction name="create" output="false">
        <cfargument name="ooStateBean" type="model.beans.outofstate" required="true">

		<cfdump var="#ooStateBean#" abort>
		<cfset var saveoos = new model.dao.oostate().create(ooStateBean)>

		<cfdump var="#saveoos#" abort>
        <cfreturn saveoos>
    </cffunction>

	<cffunction name="getByTaid" output="false">
		<cfargument name="taid" required="true">
		<cfset oosBean = new model.dao.oostate().getQueryBy(taid = arguments.taid)>

		<cfdump var="#oosBean#" abort>

		</cffunction>

    <!---<cffunction name="getByTaid" output="false">
        <cfargument name="taid" required="true">
		<cfset var qGet = new Query()>
		<cfset var result = {}>
		<cfset var oostateBean = {}>

        <cfquery name="qGet" result="result">
			SELECT id,
				confname,
				goal,
				localoption,
				localoptionreason,
				beneficial,
				sharing,
				groupable,
				debrief,
				comments
			FROM outofstate
			WHERE fk_taid = <cfqueryparam value="#arguments.taid#" cfsqltype="CF_SQL_FLOAT">
        </cfquery>

        <cfif result.recordcount>
            <cfset oostateBean = new model.beans.OutOfState().init(
                id = qGet.id,
                confname = qGet.confname,
                goal = qGet.goal,
                localoption = qGet.localoption,
                localoptionreason = qGet.localoptionreason,
                beneficial = qGet.beneficial,
                sharing = qGet.sharing,
                groupable = qGet.groupable,
                debrief = qGet.debrief,
                comments = qGet.comments,
                fk_taid = arguments.taid
                )>
        <cfelse>
            <cfset oostateBean = new model.beans.OutOfState().init()>
        </cfif>

        <cfreturn oostateBean>
    </cffunction>--->

</cfcomponent>
