<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the StaffDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="model.dao.Staff"
		hint="I am the constructor method of the StaffDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="read" access="public" output="false" returnType="boolean"
			hint="I return the Staff bean populated with details of a specific Staff.">
		<cfargument name="staff" required="true" type="model.beans.Staff">

		<cfset var qSearch = new query()>
		<cfset var objStaff = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				FIRSTNAME,
				LASTNAME,
				EMAIL,
				DATEJOINED,
				DATELEFT,
				OTHERDETAILS,
				STAFFROLEID,
				NOTIFY,
				USERNAME
			FROM STAFF
			WHERE ID = <cfqueryparam value="#arguments.staff.getID()#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount eq 1>
			<!--- If a record has been returned for the StaffId, create an instance of the Staff bean and return it. --->
			<cfset arguments.staff.init(
				id = qSearch.ID,
				firstname = qSearch.FIRSTNAME,
				lastname = qSearch.LASTNAME,
				email = qSearch.EMAIL,
				datejoined = qSearch.DATEJOINED,
				dateleft = qSearch.DATELEFT,
				otherdetails = qSearch.OTHERDETAILS,
				staffroleid = qSearch.STAFFROLEID,
				notify = qSearch.NOTIFY,
				username = qSearch.USERNAME
			)>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>

	<cffunction name="delete" access="public" output="false" returnType="boolean" hint="I delete a Staff from the database.">
		<cfargument name="staffId" required="true" type="numeric"
				hint="I am the Id of the Staff you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Staff
				where Id = <cfqueryparam value="#arguments.staffId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="save" access="public" output="false" returnType="string"
		hint="I handle saving a Staff, either by creating a new entry or updating an existing one.">
	    <cfargument name="Staff" required="true" type="model.beans.Staff" hint="I am the Staff bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.staff)>
	        <cfset success = updateStaff(arguments.staff)>
	    <cfelse>
	        <cfset success = createNewStaff(arguments.staff)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="update" access="public" output="false" returnType="boolean"
			hint="I update a Staffs details">
		<cfargument name="staff" required="true" type="Staff" hint="I am the Staff bean.">

		<cfset var qUpdate = new Query()>
		<cftransaction action="begin">

			<cftry>

				<cfquery name="qUpdate">
					UPDATE STAFF
					SET
						ID = <cfqueryparam value="#arguments.staff.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.staff.getFirstname()#)>
								FIRSTNAME = <cfqueryparam value="#arguments.staff.getFirstname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							FIRSTNAME = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getLastname()#)>
								LASTNAME = <cfqueryparam value="#arguments.staff.getLastname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							LASTNAME = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getEmail()#)>
								EMAIL = <cfqueryparam value="#arguments.staff.getEmail()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							EMAIL = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getDatejoined()#)>
								DATEJOINED = <cfqueryparam value="#arguments.staff.getDatejoined()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							DATEJOINED = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getDateleft()#)>
								DATELEFT = <cfqueryparam value="#arguments.staff.getDateleft()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							DATELEFT = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getOtherdetails()#)>
								OTHERDETAILS = <cfqueryparam value="#arguments.staff.getOtherdetails()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							OTHERDETAILS = <cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.staff.getStaffroleid()#>
								STAFFROLEID = <cfqueryparam value="#arguments.staff.getStaffroleid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							STAFFROLEID = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getNotify()#)>
								NOTIFY = <cfqueryparam value="#arguments.staff.getNotify()#" cfsqltype="cf_sql_char" />,
						<cfelse>
							NOTIFY = <cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.staff.getUsername()#)>
								USERNAME = <cfqueryparam value="#arguments.staff.getUsername()#" cfsqltype="cf_sql_varchar" />
						<cfelse>
							USERNAME = <cfqueryparam null="true">
						</cfif>
					WHERE ID = <cfqueryparam value="#arguments.staff.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Staff exists within the database, using the ID as a check.">
		<cfargument name="Staff" required="true" type="model.beans.Staff" hint="I am the Staff bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM STAFF
			WHERE ID = <cfqueryparam value="#arguments.Staff.getID()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="create" access="private" output="false" returnType="boolean"
			hint="I insert a new record into the database.">
		<cfargument name="staff" required="true" type="model.beans.Staff"
				hint="I am the Staff bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO STAFF
					(
							ID,
							FIRSTNAME,
							LASTNAME,
							EMAIL,
							DATEJOINED,
							DATELEFT,
							OTHERDETAILS,
							STAFFROLEID,
							NOTIFY,
							USERNAME
					) VALUES (
						<cfqueryparam value="#arguments.staff.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(trim(#arguments.staff.getFirstname()#))>
							<cfqueryparam value="#arguments.staff.getFirstname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getLastname()#))>
							<cfqueryparam value="#arguments.staff.getLastname()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getEmail()#))>
							<cfqueryparam value="#arguments.staff.getEmail()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getDatejoined()#))>
							<cfqueryparam value="#arguments.staff.getDatejoined()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getDateleft()#))>
							<cfqueryparam value="#arguments.staff.getDateleft()#" cfsqltype="cf_sql_timestamp" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getOtherdetails()#))>
							<cfqueryparam value="#arguments.staff.getOtherdetails()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getStaffroleid()#))>
							<cfqueryparam value="#arguments.staff.getStaffroleid()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getNotify()#))>
							<cfqueryparam value="#arguments.staff.getNotify()#" cfsqltype="cf_sql_char" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(trim(#arguments.staff.getUsername()#))>
							<cfqueryparam value="#arguments.staff.getUsername()#" cfsqltype="cf_sql_varchar" />
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
