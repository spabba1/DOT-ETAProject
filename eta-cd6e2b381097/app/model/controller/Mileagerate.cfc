<cfcomponent>

	<cfset variables.mileagerateService = new model.services.Mileagerate()>

	<cffunction name="getLatest" access="remote" output="false" returnType="numeric">
		<cfset var qMileageRate = new Query()>
		<cfquery name="qMileageRate">
			select count(1) id from mileagerate order by id desc
		</cfquery>
		<cfreturn qMileageRate.id>
	</cffunction>

	<cffunction name="getQueryBy" output="false" remote="true">
		<cfargument name="rc" required="true" type="struct">
		<cfreturn getMileageRateDao().getQueryBy(argumentCollection=arguments.rc)>
	</cffunction>

	<cfscript>
	remote function create( required string data ) {
		data = deserializeJSON(data);
		var bean = new model.beans.mileagerate();

		bean.setMileageRate(data.MileageRate);
		bean.setEffectiveDate(data.effectiveDate);
		bean.setChangedBy(data.ChangedBy);

		return new model.dao.mileagerate().create(bean);
	}
	</cfscript>

	<cffunction name="getMileageRate" access="remote" output="false">
		<cfset var currentBean = getBeanByCurrentFY()>
		<cfreturn currentBean.getMileagerate()>
	</cffunction>

</cfcomponent>
