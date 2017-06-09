<cfcomponent accessors="true" output="false" extends="model.services.CoreUtils"
			hint="I am the ExpenseDao Class.">

	<cfset init()>

	<cffunction name="init" access="public" output="false" returnType="struct"
		hint="I am the constructor method of the ExpenseDao Class.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getExpense" access="public" output="false" returnType="boolean"
			hint="I return the Expense bean populated with details of a specific Expense.">
		<cfargument name="expense" required="true" type="Expense">

		<cfset var qSearch = new query()>
		<cfset var objExpense = {}>
		<cfquery name="qSearch">
			SELECT
				ID,
				EXPENSEDATE,
				EXPLANATION,
				MEALS,
				FACILITY,
				MILES,
				SURFMILEAGE,
				OTHERTRANS,
				LODGING,
				MIE,
				OTHER,
				TAID
			FROM EXPENSE
			WHERE ID = <cfqueryparam value="#arguments.expense.getExpenseID#" cfsqltype="CF_SQL_FLOAT">
		</cfquery>

		<cfif qSearch.recordCount>
			<!--- If a record has been returned for the ExpenseId, create an instance of the Expense bean and return it. --->
			<cfset arguments.expense.init(
				id = qSearch.ID,
				expensedate = qSearch.EXPENSEDATE,
				explanation = qSearch.EXPLANATION,
				meals = qSearch.MEALS,
				facility = qSearch.FACILITY,
				miles = qSearch.MILES,
				surfmileage = qSearch.SURFMILEAGE,
				othertrans = qSearch.OTHERTRANS,
				lodging = qSearch.LODGING,
				mie = qSearch.MIE,
				other = qSearch.OTHER,
				taid = qSearch.TAID
			)>
		</cfif>
		<cfreturn objEXPENSE>
	</cffunction>

	<cffunction name="deleteExpenseById" access="public" output="false" returnType="boolean" hint="I delete a Expense from the database.">
		<cfargument name="expenseId" required="true" type="numeric"
				hint="I am the Id of the Expense you wish to delete.">
		<cfset var qDelete = new Query()>
		<cfset var boolSuccess = true>

		<cftry>
			<cfquery name="qDelete">
				Delete from Expense
				where Id = <cfqueryparam value="#arguments.expenseId()#" cfsqltype="CF_SQL_FLOAT">
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false>
			</cfcatch>
		</cftry>
	    <cfreturn boolSuccess>
	</cffunction>

	<!--- SAVE --->
	<cffunction name="saveExpense" access="public" output="false" returnType="string"
		hint="I handle saving a Expense, either by creating a new entry or updating an existing one.">
	    <cfargument name="Expense" required="true" type="model.beans.Expense" hint="I am the Expense bean.">

	    <cfset var success = "">
	    <cfif exists(arguments.expense)>
	        <cfset success = updateExpense(arguments.expense)>
	    <cfelse>
	        <cfset success = createNewExpense(arguments.expense)>
		</cfif>
	    <cfreturn success>
	</cffunction>

	<cffunction name="updateExpense" access="public" output="false" returnType="boolean"
			hint="I update a Expenses details">
			<cfargument name="expense" required="true" type="Expense" hint="I am the Expense bean.">

			<cfset var qUpdate = new Query()>
			<cftransaction action="begin">

				<cftry>

					<cfquery name="qUpdate">
						UPDATE EXPENSE
						SET
							ID = <cfqueryparam value="#arguments.expense.getId()#" cfsqltype="cf_sql_decimal" />,
							<cfif len(#arguments.expense.getExpensedate()#)>
								EXPENSEDATE = <cfqueryparam value="#arguments.expense.getExpensedate()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								EXPENSEDATE = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.expense.getExplanation()#)>
								EXPLANATION = <cfqueryparam value="#arguments.expense.getExplanation()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								EXPLANATION = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.expense.getMeals()#)>
								MEALS = <cfqueryparam value="#arguments.expense.getMeals()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								MEALS = <cfqueryparam null="true">,
							</cfif>
							<cfif len(#arguments.expense.getFacility()#)>
								FACILITY = <cfqueryparam value="#arguments.expense.getFacility()#" cfsqltype="cf_sql_varchar" />,
							<cfelse>
								FACILITY = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getMiles()#>
								MILES = <cfqueryparam value="#arguments.expense.getMiles()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								MILES = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getSurfmileage()#>
								SURFMILEAGE = <cfqueryparam value="#arguments.expense.getSurfmileage()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								SURFMILEAGE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getOthertrans()#>
								OTHERTRANS = <cfqueryparam value="#arguments.expense.getOthertrans()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								OTHERTRANS = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getLodging()#>
								LODGING = <cfqueryparam value="#arguments.expense.getLodging()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								LODGING = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getMie()#>
								MIE = <cfqueryparam value="#arguments.expense.getMie()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								MIE = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getOther()#>
								OTHER = <cfqueryparam value="#arguments.expense.getOther()#" cfsqltype="cf_sql_decimal" />,
							<cfelse>
								OTHER = <cfqueryparam null="true">,
							</cfif>
							<cfif #arguments.expense.getTaid()#>
								TAID = <cfqueryparam value="#arguments.expense.getTaid()#" cfsqltype="cf_sql_decimal" />
							<cfelse>
								TAID = <cfqueryparam null="true">
							</cfif>
						WHERE ID = <cfqueryparam value="#arguments.expense.getId()#" cfsqltype="cf_sql_float" />
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
			hint="I check to see if a specific Expense exists within the database, using the ID as a check.">
		<cfargument name="Expense" required="true" type="model.beans.Expense" hint="I am the Expense bean.">

		<cfset var qExists = new Query()>

		<cfquery name="qExists" maxrows="1">
			SELECT count(1) as idexists
			FROM EXPENSE
			WHERE ID = <cfqueryparam value="#arguments.Expense.getId()#" cfsqltype="cf_sql_float">
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true>
		</cfif>

		<cfreturn false>
	</cffunction>

	<!--- Private Methods --->
	<cffunction name="createNewExpense" access="private" output="false" returnType="numeric"
			hint="I insert a new record into the database.">
		<cfargument name="expense" required="true" type="model.beans.Expense" hint="I am the Expense bean.">

		<cfset var qInsert = new Query()>
		<cfset var insertResult = 0>

		<cftransaction action="begin">
			<cftry>
				<cfquery name="qInsert" result="insertResult">
					INSERT
					INTO EXPENSE
					(
							ID,
							EXPENSEDATE,
							EXPLANATION,
							MEALS,
							FACILITY,
							MILES,
							SURFMILEAGE,
							OTHERTRANS,
							LODGING,
							MIE,
							OTHER,
							TAID
					) VALUES (
						<cfqueryparam value="#arguments.expense.getId()#" cfsqltype="cf_sql_decimal" />,
						<cfif len(#arguments.expense.getExpensedate()#)>
							<cfqueryparam value="#arguments.expense.getExpensedate()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.expense.getExplanation()#)>
							<cfqueryparam value="#arguments.expense.getExplanation()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.expense.getMeals()#)>
							<cfqueryparam value="#arguments.expense.getMeals()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif len(#arguments.expense.getFacility()#)>
							<cfqueryparam value="#arguments.expense.getFacility()#" cfsqltype="cf_sql_varchar" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getMiles()#>
							<cfqueryparam value="#arguments.expense.getMiles()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getSurfmileage()#>
							<cfqueryparam value="#arguments.expense.getSurfmileage()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getOthertrans()#>
							<cfqueryparam value="#arguments.expense.getOthertrans()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getLodging()#>
							<cfqueryparam value="#arguments.expense.getLodging()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getMie()#>
							<cfqueryparam value="#arguments.expense.getMie()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getOther()#>
							<cfqueryparam value="#arguments.expense.getOther()#" cfsqltype="cf_sql_decimal" />,
						<cfelse>
							<cfqueryparam null="true">,
						</cfif>
						<cfif #arguments.expense.getTaid()#>
							<cfqueryparam value="#arguments.expense.getTaid()#" cfsqltype="cf_sql_decimal" />
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