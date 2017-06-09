<cfcomponent>

    <cffunction name="taCheckin" returnType="struct">
        <cfargument name="edocs_user" type="string" required="no" default="project_checkin">
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
        <cfargument name="edocsName" required="no" type="string">

        <cfsetting requestTimeOut = "1000">

        <cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_recipients=#Replace(recipients,"&","&amp;","all")#>

        <cfset localscope.primaryFilePath = GetTempDirectory() & filePath>

        <cfset returnStruct = {}>
        <cfset checkinstatus = "">
        <cftry>
            <cfhttp
                url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
                method="POST"
                username="#arguments.edocs_user#"
                password="#arguments.edocs_password#"
                multipart="yes"
                timeout="1000">

                <!--- The service field (could any service be called this way? --->
                <cfif isRejected>
                  <cfhttpparam type="formfield" name="IdcService" value="WORKFLOW_CHECKIN">
                <cfelse>
                  <cfhttpparam type="formfield" name="IdcService" value="CHECKIN_NEW">
                </cfif>

                <!--- Required fields for check in --->
                <cfif isRejected>
                  <cfhttpparam type="formfield" name="dDocName" value="#arguments.edocsName#">
                  <cfhttpparam type="formfield" name="dID" value="#arguments.edocsId#">
                  <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
                  <cfhttpparam type="formfield" name="dDocAccount" value="#arguments.account#">
                  <cfhttpparam type="formfield" name="isFinished" value="0">
                <cfelse>
                  <cfhttpparam type="formfield" name="dDocType" value="#arguments.type#">
                  <cfhttpparam type="formfield" name="dDocAuthor" value="#localscope.ampersand_escaped_author#">
                  <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
                  <cfhttpparam type="formfield" name="dDocTitle" value="#localscope.ampersand_escaped_title#">
                  <cfhttpparam type="formfield" name="dRevLabel" value="1">
                  <cfhttpparam type="formfield" name="dDocAccount" value="#arguments.account#">
                </cfif>

                <!--- Optional metadata fields --->
                <cfhttpparam type="formfield" name="xTypeCategory" value="#arguments.typecategory#">
                <cfhttpparam type="formfield" name="xTypeSubcategory" value="#arguments.typesubcategory#">
                <cfhttpparam type="formfield" name="xCollectionID" value="#arguments.collectionid#">
                <cfhttpparam type="formfield" name="xDocumentAuthor" value="#arguments.documentauthor#">
                <cfhttpparam type="formfield" name="xProjectActivityNum" value="#arguments.AKSAS#">
                <cfhttpparam type="formfield" name="xProjectActivityName" value="#localscope.ampersand_escaped_projname#">
                <cfhttpparam type="formfield" name="xFederalProjectNum" value="#arguments.fedprojectnum#">
                <cfhttpparam type="formfield" name="xDatum" value="#arguments.datum#">
                <cfhttpparam type="formfield" name="xStateDepartment" value="#arguments.statedepartment#">
                <cfhttpparam type="formfield" name="xStateAgencySection" value="#arguments.agencysection#">
                <cfhttpparam type="formfield" name="xStateRegion" value="#arguments.stateregion#">
                <cfhttpparam type="formfield" name="xCity" value="#arguments.city#">
                <cfhttpparam type="formfield" name="xBorough" value="#arguments.borough#">
                <cfhttpparam type="formfield" name="xLatitude" value="#arguments.latitude#">
                <cfhttpparam type="formfield" name="xLongitude" value="#arguments.longitude#">
                <cfhttpparam type="formfield" name="xDateCreated" value="#arguments.datecreated#">
                <cfhttpparam type="formfield" name="xDateIssued" value="#arguments.dateissued#">
                <cfhttpparam type="formfield" name="xEmailTo" value="#localscope.ampersand_escaped_recipients#">
                <cfhttpparam type="formfield" name="xComments" value="#arguments.comment#">
                <cfhttpparam type="formfield" name="xTransaction" value="#arguments.workflow#">
                <cfhttpparam type="formfield" name="xPrimaryParty1" value="#arguments.workflow_entity1#">
                <cfhttpparam type="formfield" name="xPrimaryParty2" value="#arguments.workflow_entity2#">
                <cfhttpparam type="formfield" name="xProfileTrigger" value="#arguments.formtype#">

                <!--- Return SOAP --->
                <cfhttpparam type="formfield" name="isSoap" value="1">

                <!--- Required primary file --->
                <cfhttpparam type="file" name="primaryFile" file="#arguments.primaryFile#">
            </cfhttp>


            <cfif find("Content Server Request Failed",cfhttp.fileContent) neq 0>
                <cfset returnStruct.status="failure">

                <cfsavecontent variable="errormessage">
                    <cfoutput>#mid(cfhttp.fileContent,find("Content Server Request Failed",cfhttp.fileContent),500)#</cfoutput>
                </cfsavecontent>

                <cfsavecontent variable="errordetailstart">
                    <cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
                </cfsavecontent>

                <cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

                <cfset returnStruct.message="<b>eDocs Check In Failed:</b> " & #errordetail#>
            </cfif>
            <cfif find("Check In Confirmation",cfhttp.fileContent) neq 0>
                <cfset findEdocsId = mid(cfhttp.fileContent,find("dID=",cfhttp.fileContent)+4,10)>
                <cfset dID = left(findEdocsId, find("&",findEdocsId)-1)>
                <cfset findEdocsName = mid(cfhttp.fileContent,find("dDocName=",cfhttp.fileContent)+9,18)>
                <cfset dDocName = left(findEdocsName, find("&",findEdocsName)-1)>

                <cfset returnStruct.dID = dID>
                <cfset returnStruct.dDocName = dDocName>
                <cfset returnStruct.status="success">
                <cfset returnStruct.message="Check In successful for <b>" & #localscope.ampersand_escaped_title# & "</b>">
            </cfif>

            <cfif isRejected>
              <cfset returnStruct.status = "Checking back into workflow">
              <cfset returnStruct.message = "Checked back in.">
            </cfif>

            <cfif returnStruct.status eq "">
                <cfset returnStruct.message=cfhttp.FileContent>
            </cfif>

            <cfcatch type="any">
                <cfsavecontent variable="returnStruct.message">
                <h3>You've Thrown an Error</h3>
                <cfoutput>
                    <!--- and the diagnostic message from the ColdFusion server --->
                    <p>#cfcatch.message#</p>
                    <p>Caught an exception, type = #CFCATCH.TYPE#
                    </p>
                    <p>The contents of the tag stack are:</p>
                    <cfloop index = "i" from = "1" to = "#ArrayLen(CFCATCH.TAGCONTEXT)#">
                        <cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#>
                        #sCurrent["ID"]# #cfcatch.Message#<br>
                        Error Detail: #cfcatch.Detail#<br>
                        Line: #sCurrent["LINE"]#<br>
                        Column: #sCurrent["COLUMN"]#<br>
                        Template: #sCurrent["TEMPLATE"]#
                    </cfloop>
                </cfoutput>
                </cfsavecontent>
                <cfreturn returnStruct>
            </cfcatch>
        </cftry>

        <cfreturn returnStruct>
    </cffunction>



</cfcomponent>
<!--
All steps, current status
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOW_INFO_BYNAME&dDocName=DOT-JNU_028489


All documents in given workflow
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOWDOCREVISIONS&dWfName=tam_workflow

-->

