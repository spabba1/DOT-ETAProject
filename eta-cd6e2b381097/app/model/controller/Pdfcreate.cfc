<cfcomponent>

	<cffunction name="create" output="false" access="remote" returnType="string">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="convertToBase64" default="false" type="boolean">

		<cfset var isOutOfState = new model.services.ta().isOutOfState(taid)>
		<cfset var ta = new model.services.ta().getTaByTaid(taid)>
		<cfset var tanumber = ta.getTaNumber()>

		<cfset var etapdf = "">

		<cfset var pdfStruct = {}>

		<cfif request.environment EQ 'dev'>
			<cfset var pdfFilename = "ram:///dev-#tanumber#.pdf">
		<cfelseif request.environment EQ 'test'>
			<cfset var pdfFilename = "ram:///test-#tanumber#.pdf">
		<cfelse>
			<cfset var pdfFilename = "ram:///#tanumber#.pdf">
		</cfif>


		<cfdocument
			format="PDF"
			name="etapdf"
			fontembed="yes"
			mimeType="text/html"
			localUrl="yes"
			pagetype="letter"
			overwrite="yes"
			filename="#pdfFilename#"
			>

			<cfinclude template="../../views/pdf-template.cfm">

			<cfif isOutOfState>
				<cfdocumentitem type="pagebreak" />
				<cfinclude template="../../views/pdf-oos-template.cfm">
			</cfif>

		</cfdocument>

		<cfif convertToBase64>
			<cfset var pdfOutput = BinaryEncode(etapdf, 'Base64')>
		<cfelse>
			<cfreturn pdfFilename>
		</cfif>


		<cfreturn pdfOutput>
	</cffunction>

	<cffunction name="getTaByTaid" output="false" returnType="struct">
		<cfargument name="taid" required="true" type="numeric">
		<cfset var thisTa = {}>

		<cfset thisTa.ta = new model.services.ta().getTaByTaid(taid)>
		<cfset thisTa.fincodes = new model.services.financialcode().getFincodesByTaid(taid)>
		<cfset thisTa.expenses = new model.services.expense().getExpensesByTaid(taid)>
		<cfset thisTa.onecards = new model.services.onecard().getOnecardsByTaid(taid)>
		<cfset thisTa.trws = new model.services.trw().getTrwsByTaid(taid)>
		<cfif thisTa.ta.getInstate()>
			<cfset thisTa.oostate = new model.services.oostate().getByTaid(taid)>
		</cfif>

		<cfreturn thisTa>
	</cffunction>

</cfcomponent>
