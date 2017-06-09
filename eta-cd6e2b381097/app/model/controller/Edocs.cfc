<cfcomponent>

	<cffunction name="getdIDFromName" returnType="string" output="false">
		<cfargument name="edocs_user" required="true" type="string">
		<cfargument name="edocs_password" required="true" type="string">
		<cfargument name="edocsName" required="true" type="string">

		<cfhttp
			url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="POST"
			username="#arguments.edocs_user#"
			password="#arguments.edocs_password#"
			timeout="1000">

			<cfhttpparam type="formfield" name="IdcService" value="DOC_INFO_BY_NAME">
			<cfhttpparam type="formfield" name="dDocName" value="#arguments.edocsName#">
			<cfhttpparam type="formfield" name="IsSoap" value="true">
		</cfhttp>

		<cfset var edocsStruct = new model.services.usefulfunctions().soapToArrayNodes(cfhttp.Filecontent)>

		<!---<cfdump var="#edocsStruct[3].XmlChildren.XmlAttributes.dID#">--->
	</cffunction>

    <cffunction name="checkin" returnType="struct" output="false">
		<cfargument name="edocs_user" type="string" required="true">
		<cfargument name="edocs_password" type="string" required="true">
		<cfargument name="stellent" type="model.beans.Stellent" required="true">
		<cfargument name="pdfFilename" type="string" required="true">
		<cfargument name="isRejected" type="boolean" required="true">
		<cfargument name="edocsInfo" type="struct" required="true">

		<cfif request.environment EQ "dev">
			<cfset stellent.setxCollectionID(732)>
		<cfelseif request.environment EQ "test">
			<cfset stellent.setxCollectionID(737)>
		<cfelseif request.environment EQ "prod">
			<cfset stellent.setxCollectionID(709)>
		</cfif>


        <!---<cfargument name="edocs_user" type="string" required="no" default="project_checkin">
        <cfargument name="edocs_password" type="string" required="no" default="project_checkin">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="collectionid" type="string" required="no" default="">
        <cfargument name="workflow" type="string" required="no" default="">
        <cfargument name="workflow_entity1" type="string" required="no" default="">
        <cfargument name="workflow_entity2" type="string" required="no" default="">
        <cfargument name="account" type="string" required="no" default="">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="recipients" type="string" required="no" default="">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">
        <cfargument name="dateissued" type="string" required="no" default="">
        <cfargument name="formtype" type="string" required="no" default="Project Documents">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="filePath" required="yes">
        <cfargument name="isRejected" required="yes" type="boolean">
        <cfargument name="edocsId" required="no" type="string">
        <cfargument name="edocsName" required="no" type="string">--->

        <cfsetting requestTimeOut = "1000">

        <!---<cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_recipients=#Replace(recipients,"&","&amp;","all")#>--->

        <!---<cfset localscope.primaryFilePath = GetTempDirectory() & filePath>--->

		<cfset var edocsStruct = {}>
        <cfset var returnStruct = {}>
		<cfset returnStruct.type = "">
		<cfset returnStruct.message = "">
        <cfset var checkinstatus = "">
		<cfset var httpResult = "">
		<cftry>

			<cfhttp
				url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
				method="POST"
				username="#arguments.edocs_user#"
				password="#arguments.edocs_password#"
				multipart="yes"
				result="httpResult"
				timeout="1000">

				<!--- Required fields for check in --->
				<cfhttpparam type="formfield" name="IdcService" value="CHECKIN_UNIVERSAL">

				<cfif isRejected>
					<cfhttpparam type="formfield" name="dDocName" value="#stellent.getdDocName()#">
					<cfhttpparam type="formfield" name="dID" value="#stellent.getdID()#">
					<cfhttpparam type="formfield" name="isFinished" value="1">
					<!--- Not sure if important
					<cfhttpparam type="formfield" name="dRevLabel" value="#Val(stellent.setdRevLabel(stellent.getdRevLabel())) + 1#">--->
				<cfelse>
					<!---<cfhttpparam type="formfield" name="IdcService" value="CHECKIN_NEW">--->
				</cfif>

					<!---<cfhttpparam type="formfield" name="dRevLabel" value="#stellent.getdRevLabel()#">--->
					<cfhttpparam type="formfield" name="dDocType" value="#stellent.getdDocType()#">
					<cfhttpparam type="formfield" name="dSecurityGroup" value="#stellent.getdSecurityGroup()#">
					<cfhttpparam type="formfield" name="dDocAuthor" value="#stellent.getdDocAuthor()#">
					<cfhttpparam type="formfield" name="dDocTitle" value="#stellent.getdDocTitle()#">
					<cfhttpparam type="formfield" name="xCollectionID" value="#stellent.getxCollectionID()#">
					<cfhttpparam type="formfield" name="xStateDepartment" value="#stellent.getxStateDepartment()#">
					<cfhttpparam type="formfield" name="xTransaction" value="#stellent.getxTransaction()#">
					<cfhttpparam type="formfield" name="xPrimaryParty1" value="#stellent.getxPrimaryParty1()#">
					<!---<cfhttpparam type="formfield" name="dDocAccount" value="prj/PRJ0000028">--->

					<!--- Optional metadata fields --->
					<!---<cfhttpparam type="formfield" name="xTypeCategory" value="#arguments.typecategory#">
					<cfhttpparam type="formfield" name="xTypeSubcategory" value="#arguments.typesubcategory#">--->
					<!---<cfhttpparam type="formfield" name="xDocumentAuthor" value="#arguments.documentauthor#">
					<cfhttpparam type="formfield" name="xProjectActivityNum" value="#arguments.AKSAS#">
					<cfhttpparam type="formfield" name="xProjectActivityName" value="#localscope.ampersand_escaped_projname#">
					<cfhttpparam type="formfield" name="xFederalProjectNum" value="#arguments.fedprojectnum#">
					<cfhttpparam type="formfield" name="xDatum" value="#arguments.datum#">--->
					<!---<cfhttpparam type="formfield" name="xStateAgencySection" value="#arguments.agencysection#">
					<cfhttpparam type="formfield" name="xStateRegion" value="#arguments.stateregion#">
					<cfhttpparam type="formfield" name="xCity" value="#arguments.city#">
					<cfhttpparam type="formfield" name="xBorough" value="#arguments.borough#">
					<cfhttpparam type="formfield" name="xLatitude" value="#arguments.latitude#">
					<cfhttpparam type="formfield" name="xLongitude" value="#arguments.longitude#">
					<cfhttpparam type="formfield" name="xDateCreated" value="#arguments.datecreated#">
					<cfhttpparam type="formfield" name="xDateIssued" value="#arguments.dateissued#">
					<cfhttpparam type="formfield" name="xEmailTo" value="#localscope.ampersand_escaped_recipients#">
					<cfhttpparam type="formfield" name="xComments" value="#arguments.comment#">--->

					<!---<cfhttpparam type="formfield" name="xPrimaryParty2" value="#arguments.workflow_entity2#">
					<cfhttpparam type="formfield" name="xProfileTrigger" value="#arguments.formtype#">--->

				<!--- Return SOAP --->
				<cfhttpparam type="formfield" name="IsSoap" value="true">

				<!--- Required primary file --->
				<cfhttpparam type="file" name="primaryFile" file="#pdfFilename#">
			</cfhttp>

			<!---<cfset arrNodes = new model.services.usefulfunctions().soapToArrayNodes(httpResult.Filecontent)>--->
			<!---<cfdump var="#arrNodes[1].xmlChildren.statusMessage#" abort>--->
			<cfset var checkStatus = {}>
			<cfset checkStatus.dWfStatus = ""> <!--- needs to be defined for returnstruct if statement.  --->
			<cfif isRejected>
			<!---
				<cfset var smallerXml = new model.services.usefulfunctions().soapToArrayNodes(httpResult.filecontent)>
				<cfset var arrNode = xmlSearch(smallerXml, "//field")>
            	<cfloop array="#arrNode#" index="i">
                    <cfif i.XmlAttributes["name"] EQ "dWfStatus">
                    	<cfset structInsert(checkStatus, i.XmlAttributes["name"], i.XmlText)>
                	</cfif>
            	</cfloop>
			--->

            <cfelse>
            	<cfset edocsStruct = new model.services.usefulfunctions().soapToStruct(httpResult.Filecontent)>
			</cfif>

			<cfif find("Content Server Request Failed",httpResult.fileContent) neq 0>
				<cfset returnStruct.status="error">

				<cfsavecontent variable="errormessage">
					<cfoutput>#mid(httpResult.fileContent,find("Content Server Request Failed",httpResult.fileContent),500)#</cfoutput>
				</cfsavecontent>

				<cfsavecontent variable="errordetailstart">
					<cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
				</cfsavecontent>

				<cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

				<cfset returnStruct.message="<b>eDocs Check In Failed:</b> " & #errordetail#>
			</cfif>

			<cfif structKeyExists(edocsStruct, "StatusCode") AND edocsStruct.StatusCode EQ 0>
				<cfset var findEdocsName = REMatch("'[^']+'", edocsStruct.StatusMessage) />
				<cfset var dDocName = ListFirst(findEdocsName[1],"'") />

				<cfset var dIDFull = mid(edocsStruct.VaultfilePath,44,20) />

				<cfset var dID = left(dIDFull, len(dIDFull)-4) />
				<cfset returnStruct.dID = dID>
				<cfset returnStruct.dDocName = dDocName>
				<cfset returnStruct.type="success">
				<cfset returnStruct.message="You have successfully checked in #stellent.getdDocTitle()#">
			<cfelseif isRejected> --->
			<!--- <cfelseif isRejected AND checkStatus.dWfStatus EQ "INPROCESS"> --->
				<cfset returnStruct.dID = #stellent.getdID()#>
				<cfset returnStruct.dDocName = #stellent.getdDocName()#>
				<cfset returnStruct.type = "success">
				<cfset returnStruct.message = "You have successfully checked back into workflow #stellent.getdDocTitle()#.">
			<cfelse>
				<cfset returnStruct.type = "danger">
				<cfset returnStruct.message = "A serious error has occured, please contact Jeremey Hustman">
				<cfset returnStruct.detail = #edocsStruct.StatusMessage#>
				<cfthrow message="#returnStruct.message#"
					detail="#edocsStruct.StatusMessage#">
			</cfif>

			<cfcatch type="any">
				<cfset var handleError = new model.services.errorhandler().sendError(cfcatch)>
			</cfcatch>
		</cftry>

        <cfreturn returnStruct>
	</cffunction>

	<cffunction name="checkout" output="false">
		<cfargument name="edocs_user" required="true">
		<cfargument name="edocs_password" required="true">
		<cfargument name="dID" type="numeric" required="true">

		<cfhttp
			url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="post"
			username="#arguments.edocs_user#"
			password="#arguments.edocs_password#"
			timeout="1000">

			<cfhttpparam type="formfield" name="IdcService" value="CHECKOUT">
			<cfhttpparam type="formfield" name="dID" value="#Val(arguments.dID)#">
			<cfhttpparam type="formfield" name="IsSoap" value="true">

		</cfhttp>
		<cfset var resultStruct = new model.services.usefulfunctions().soapToStruct(httpResult.Filecontent)>

		<cfset var returnStruct = {}>

		<cfif structKeyExists(resultStruct, "StatusCode") && resultStruct.StatusCode EQ "-22">
			<cfset returnStruct.success = false>
			<cfset returnStruct.message = resultStruct.StatusMessage>
		<cfelseif structKeyExists(resultStruct, "dAction") && resultStruct.dAction EQ "Check out">
			<cfset returnStruct.success = true>
			<cfset returnStruct.message = "Checkout OK">
		<cfelse>
			<cfset returnStruct.success = false>
			<cfset returnStruct.message = "There is a problem communicating with eDocs, please contact Jeremey Hustman 465-2908">
		</cfif>

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="upload" returntype="any" output="false" hint="I upload a TA into edocs.">
		<cfargument name="taid" required="true" type="numeric">
		<cfargument name="approver" required="true" type="string">
		<cfargument name="authdata" required="true" type="array">
		<cfargument name="isRejected" required="false" type="boolean" default="false">

		<cfset var taInfo        = new model.services.ta().getTaByTaid(taId)>
		<cfset var fincodes      = new model.services.financialCode().getFincodesByTaid(taId)>
		<cfset var expenseArray  = new model.services.expense().getExpensesByTaId(taId)>
		<cfset var onecardArray  = new model.services.onecard().getOnecardsByTaId(taId)>
		<cfset var trwArray      = new model.services.trw().getTrwsByTaId(taId)>
		<cfset var usefulFuncs   = new model.services.usefulfunctions()>
		<cfset var stellent      = new model.beans.Stellent()>
		<cfset var estimatorId   = taInfo.getPreparerid()>
		<cfset var ldapInfo      = deserializeJSON(new model.services.ldap().getUserByEinForTa(estimatorId))>
		<cfset var preparerid     = ldapInfo[1].EMPLOYEENUMBER>

		<cfset var authUser = authdata[1]>
		<cfset var authPass = authdata[2]>
		<cfset var isOutOfState = new model.services.ta().isOutOfState(taid)>

		<cfif isRejected>
			<cfset var edocsinfo = new model.services.ta().getEdocsInfoFromTaid(taid)>
			<cfset stellent.setdDocName(edocsinfo.ddocname)>
			<cfset stellent.setdID(edocsinfo.dID)>
		<cfelse>
			<cfset var edocsinfo = {}>
		</cfif>

		<cfif isOutOfState>
			<cfset var oostate = new model.services.outofstate().getByTaid(taid)>
		</cfif>

		<cfset var taForApproval = "">

		<cfset var pdfFilename = new model.services.pdfcreate().create(taid)>
		<!---<cfdocument
			format="pdf"
			fontembed="yes"
			marginLeft=".25"
			marginTop=".25"
			marginRight=".25"
			marginBottom=".25"
			pageHeight="11"
			pageWidth="8.5"
			pageType="custom"
			name="taForApproval"
			localUrl="yes">

			<cfinclude template="../../views/travel/edocsupload.cfm">

			<cfif NOT InState>
				<cfdocumentitem type="pagebreak" />
				<cfinclude template="../../views/travel/edocsuploadOOS.cfm">
			</cfif>

		</cfdocument>--->

		<!---<cfset var uploadFolder = expandPath("temp")>--->
		<!---<cfset var uploadFile = #uploadFolder# & '/' & #taInfo.getTaNumber()# &
		'-' & #usefulFuncs.randomString()# & '.pdf' />--->
		<!---<cffile action="write" file="#uploadFile#" output="#taForApproval#">--->

		<cfset stellent.setdDocAuthor(authuser)>
		<cfset stellent.setdDocTitle(taInfo.getTaNumber())>
		<cfset stellent.setPrimaryFile(taForApproval)>
		<cfset stellent.setxPrimaryParty1(approver)>

		<!---[><cfset strDateSubmitted = #request.nowStamp#><]--->

		<cfset var checkin = checkin(
			authUser,
			authPass,
			stellent,
			pdfFilename,
			isRejected,
			edocsinfo)>

		<!---[> Log The Process <]--->
		<cfif #checkin.type# EQ "success">

			<cfset var processid = new model.services.workflow_processes().getIdFromName("Waiting for Div Approval")>

			<cfset taInfo.setEdocsId(checkin.dID)>
			<cfset taInfo.setEdocsName(checkin.dDocName)>
			<cfset taInfo.setProcessid(processid)>

			<cfset var updateTa = new model.services.ta().updateTa(taInfo)>
			<cfset var statusid = new model.services.ta_status().getIdFromDesc("Pre-Trip")>
			<cfset var travelerid = taInfo.getTravelerID()>

			<cfset var logBean = new model.beans.logger(
					taid = taid,
					processid = processid,
					statusid = statusid,
					travelerid = travelerid,
					preparerid = preparerid,
					created = request.nowStamp
					)>

			<cfset var checkIfStaff = new model.services.staff().isAdmin(preparerid)>

			<cfif checkIfStaff.isAdmin>
				<cfset logBean.setStaffid(preparerid)>
			</cfif>

			<cfset var doLog = new model.services.logger().logProcess(logBean)>
		</cfif>

		<cfreturn checkin>
	</cffunction>

	<cffunction name="workflowApprove" access="remote" returnFormat="json" output="false">
		<cfargument name="edocs_user" type="string" required="yes">
		<cfargument name="edocs_password" type="string" required="yes">
		<cfargument name="dID" type="numeric" required="yes" />

		<cfset var returnStruct = {}>

		<cfset var taId = new model.services.ta().getIdFromEdocsId(dID)>
		<cfset var taBean = new model.services.ta().getTaByTaid(taId)>

		<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="POST" username="#edocs_user#" password="#edocs_password#"
			timeout="1000">

			<cfhttpparam type="formfield" name="IdcService" value="WORKFLOW_APPROVE">
				<cfhttpparam type="formfield" name="dID" value="#dID#">
				<cfhttpparam type="formfield" name="IsSoap" value="true">
		</cfhttp>

		<cfset var edocsStruct = new model.services.usefulfunctions().soapToStruct(cfhttp.filecontent)>

		<cfif structKeyExists(edocsStruct, "WfEditFinished")>
			<cfset returnStruct.status = "success">
			<cfset returnStruct.message = "You have successfully approved this TA.">
			<cfset var processId = new model.services.workflow_processes().getIdFromName("Travel Envelope Preparation")>

			<cfset taBean.setProcessId(processId)>
			<cfset new model.dao.ta().update(taBean)>

			<!--- Logging --->
			<cfset var logBean = new model.beans.logger()>

			<cfset var statusId = new model.services.ta_status().getIdFromDesc("Pre-Trip")>
			<cfset var staffId = new model.services.staff().getIdFromUsername(edocs_user)>
			<cfset var travelerId = new model.services.ta().getTravelerByTaid(taid)>

			<cfset logBean.setTaid(taid)>
			<cfset logBean.setProcessId(processId)>
			<cfset logBean.setStatusId(statusId)>
			<cfset logBean.setStaffid(staffId)>
			<cfset logBean.setPreparerId(staffId)>
			<cfset logBean.setTravelerId(travelerId)>
			<cfset logBean.setCreated(request.nowstamp)>
			<cfset logBean.setApproved(1)>
			<cfset logBean.setApproverid(staffId)>

			<cfset var logged = new model.services.logger().logProcess(logBean)>

		<cfelseif structKeyExists(edocsStruct, "StatusCode")>
			<cfset returnStruct.status = "failure">
			<cfset returnStruct.message = #edocsStruct.StatusMessage#>
		<cfelse>
			<cfset returnStruct.status = "failure">
			<cfset returnStruct.message = "An unexpected error occured processing your approval, please contact Jeremey Hustman.">
		</cfif>

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="workflowReject" access="remote" returnFormat="json" output="false">
		<cfargument name="taid" type="numeric" required="true">
		<cfargument name="auth" type="array" required="true">
		<cfargument name="dID" type="numeric" required="true" />
		<cfargument name="wfRejectMessage" type="string" required="true" />

		<cfset var returnStruct = {}>

		<cftry>
			<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
				method="POST" username="#auth[1]#" password="#auth[2]#" timeout="5000">

				<cfhttpparam type="formfield" name="IdcService" value="WORKFLOW_REJECT">
				<cfhttpparam type="formfield" name="dID" value="#dID#">
				<cfhttpparam type="formfield" name="wfRejectMessage" value="#wfRejectMessage#">
				<cfhttpparam type="formfield" name="IsSoap" value="true">

			</cfhttp>

			<!-- Original -->
			<!---<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"--->
				<!---method="POST" username="#auth[1]#" password="#auth[2]#" timeout="5000">--->

				<!---<cfhttpparam type="formfield" name="IdcService" value="WORKFLOW_REJECT">--->
				<!---<cfhttpparam type="formfield" name="dID" value="#dID#">--->
				<!---<cfhttpparam type="formfield" name="wfRejectMessage" value="#wfRejectMessage#">--->
				<!---<cfhttpparam type="formfield" name="IsSoap" value="true">--->

			<!---</cfhttp>--->

		<cfset var edocsStruct = new model.services.usefulfunctions().soapToStruct(cfhttp.Filecontent)>

		<cfif structKeyExists(edocsStruct, "WfEditFinished")>
			<!--- Rejected Sucessfully --->
			<cfset returnStruct.status="success">
			<cfset returnStruct.message="You have successfully rejected this TA.">

			<cfset ta = new model.services.ta().getTaByTaid(taid)>
			<cfset doUpdate = new model.services.ta().updateTa(ta)>

			<!--- Logging --->
			<cfset var logBean = new model.beans.logger()>

			<cfset var processId = new model.services.workflow_processes().getIdFromName("Rejected")>
			<cfset var statusId = new model.services.ta_status().getIdFromDesc("Pre-Trip")>
			<cfset var staffId = new model.services.staff().getIdFromUsername(auth[1])>
			<cfset var travelerId = new model.services.ta().getTravelerByTaid(taid)>

			<cfset logBean.setTaid(taid)>
			<cfset logBean.setCreated(request.nowstamp)>
			<cfset logBean.setProcessId(processId)>
			<cfset logBean.setStatusId(statusId)>
			<cfset logBean.setStaffid(staffId)>
			<cfset logBean.setPreparerId(staffId)>
			<cfset logBean.setTravelerId(travelerId)>
			<cfset logBean.setDetails(wfRejectMessage)>

			<cfset var logged = new model.services.logger().logProcess(logBean)>

			<!--- flag ta as rejected --->
			<cfset var ta = new model.services.ta().getTaByTaid(taid)>
			<cfset ta.setProcessId(processId)>
			<cfset var updateTa = new model.services.ta().updateTa(ta)>

		<cfelseif structKeyExists(edocsStruct, "StatusCode")>
			<cfset returnStruct.status = "danger">
			<cfset returnStruct.message = #edocsStruct.StatusMessage#>
		</cfif>
		<cfcatch>
			<cfset returnStruct.status = "danger">
			<cfset returnStruct.message = "An unexpected error occured processing your rejection, please contact Jeremey Hustman.">
			<cfset returnStruct.details = #cfcatch#>
		</cfcatch>

		</cftry>
		<!---<cfset var --->

		<cfreturn returnStruct>
	</cffunction>

	<cffunction name="addWorkflow" returnType="any" output="false">
		<cfargument name="authdata" type="array" required="true" output="false">

		<cfset var stellent = new model.beans.stellent()>
		<cfset var authUser = authdata[1]>
		<cfset var authPass = authdata[2]>

		<cfset stellent.setIdcService("ADD_WORKFLOW")>
		<cfset stellent.setdWfName("Travel_Authorization")>
		<cfset stellent.setdWfDescription("")>
		<cfset stellent.setdWfType("Basic")>
		<cfset stellent.setdSecurityGroup("Projects")>
		<cfset stellent.setdWfCriteriaName("")>
		<cfset stellent.setdWfCriteriaOperator("")>
		<cfset stellent.setdWfCriteriaValue("")>

		<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="POST" username="#authUser#" password="#authPass#" timeout="5000">

			<cfhttpparam type="formfield" name="IdcService" value="#stellent.getIdcService()#">
			<cfhttpparam type="formfield" name="dWfName" value="#stellent.getdWfName()#">
			<cfhttpparam type="formfield" name="dWfDescription" value="#stellent.getdWfDescription()#">
			<cfhttpparam type="formfield" name="dWfType" value="#stellent.getdWfType()#">
			<cfhttpparam type="formfield" name="dWfSecurityGroup" value="#stellent.getdWfType()#">
			<cfhttpparam type="formfield" name="IsSoap" value="true">

		</cfhttp>

		<cfreturn #cfhttp#>
	</cffunction>

	<cffunction name="startWorkflow" returnType="any" output="false" hint="approves the Initial_Import because rejecting this sends an email and I don't want it to.  I have to set wfSetNotifyOff on the entry point here -- lame workaround to prevent emails being sent from eDocs itself">
		<cfargument name="docStruct" type="struct" required="true" output="false">
		<cfargument name="approver" type="string" required="true" output="false">
		<cfargument name="authdata" type="array" required="true" output="false">

		<cfset var authUser = authdata[1]>
		<cfset var authPass = authdata[2]>

		<!--- Add Workflow --->

			<cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
				method="POST" username="#authUser#" password="#authPass#" timeout="5000">

				<cfhttpparam type="formfield" name="IdcService" value="WORKFLOW_APPROVE">
				<cfhttpparam type="formfield" name="dID" value="#docStruct.dID#">
				<cfhttpparam type="formfield" name="IsSoap" value="true">

			</cfhttp>

			<cfreturn #cfhttp#>

	</cffunction>

</cfcomponent>

<!---
All steps, current status
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOW_INFO_BYNAME&dDocName=DOT-JNU_028489


All documents in given workflow
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOWDOCREVISIONS&dWfName=eta_workflow

--->
