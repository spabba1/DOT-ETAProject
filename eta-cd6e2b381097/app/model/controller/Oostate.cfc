<cfcomponent>

    <cffunction name="create" output="false" returnType="struct">
        <cfargument name="ooStateBean" type="model.beans.Oostate" required="true">

		<cfset var saveoos = new model.dao.Oostate().create(ooStateBean)>

        <cfreturn saveoos>
    </cffunction>

	<cffunction name="getByTaid" access="remote" output="false">
		<cfargument name="taid" required="true">
		<cfset var ooStateBean = new model.dao.Oostate().getQueryBy(taid=arguments.taid)>
		<!---<cfset var ooStateArray = new model.services.usefulfunctions().queryToArray(ooStateBean)>--->

		<cfreturn ooStateBean>
	</cffunction>

	<cffunction name="getEmptyBean" access="remote" output="false">
		<cfset var ooStateBean = new model.beans.Oostate().init()>
		<cfreturn ooStateBean>
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
