<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="loadWorkflowTest">
		<cfhttp
			url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg"
			method="POST"
			username="jphustman"
			password="Freidn0r.10010">

			<!--- Required fields for check in --->
			<cfhttpparam type="formfield" name="IdcService" value="LOAD_WORKFLOW_QUEUE">
				<cfhttpparam type="formfield" name="IsSoap" value="true">
				</cfhttp>

				<cfset debug(cfhttp)>
				<!---<cfset xmlFull = XmlParse(cfhttp.Filecontent)>--->
				<cfset  toJson = new model.services.xmltools().xmlToJson(cfhttp.Filecontent, true)>
				<cfset debug(toJson)>
				<!---<cfset debug(xmlFull)>
				<cfset arrNodes = XmlSearch(xmlFull,"//*[local-name()='service' and namespace-uri()='http://www.stellant.com/IdcService/']")>
				<cfset debug(arrNodes)>--->
				<!---<cfset edocsStruct = new model.services.usefulfunctions()
						.soapToStruct(cfhttp.Filecontent)>
				<cfset debug(edocsStruct)>--->
			</cffunction>

	<cffunction name="resubmitRejectedTest">
		<cfsavecontent variable="soapBody">
			<cfoutput>
<?xml version='1.0' encoding='utf-8' ?>
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <idc:service
            xmlns:idc="http://www.stellent.com/IdcService/" IdcService="CHECKIN_UNIVERSAL">
            <idc:document dPublishType="" dFormat="application/pdf" dRevisionID="1" dProcessingState="C" dSecurityGroup="Projects" dOriginalName="25-2015-00003-azgj4s.pdf" dDocType="Other" dWebExtension="pdf" dDocAuthor="jphustman" dRevLabel="1" dUser="jphustman" dPublishState="" dFileSize="0" dDocName="DOT-JNU_066069" dRevClassID="66069" dStatus="GENWWW" dOutDate="" dIsWebFormat="0" dLocation="" dID="67935" dCheckoutUser="" dReleaseState="E" dCreateDate="4/16/15 1:35 PM" dIsPrimary="1" dExtension="pdf" dDocTitle="25-2015-00003" dDocID="137182" dIsCheckedOut="0" dDocAccount="prj/PRJ0000028">
                <idc:field name="xTransaction">eta_workflow</idc:field>
                <idc:field name="xSupDateTypes"></idc:field>
                <idc:field name="xGISxRef:isSetDefault">1</idc:field>
                <idc:field name="wfAction">CHECKIN</idc:field>
                <idc:field name="wfStepCheckinType">:C:CA:CE:</idc:field>
                <idc:field name="xDocAuthor"></idc:field>
                <idc:field name="xDocAuthor:isSetDefault">1</idc:field>
                <idc:field name="xEmailCC"></idc:field>
                <idc:field name="xPrimaryParties"></idc:field>
                <idc:field name="xReplaces:isSetDefault">1</idc:field>
                <idc:field name="xDateValidStart"></idc:field>
                <idc:field name="xFormat:isSetDefault">1</idc:field>
                <idc:field name="xDateValidStart:isSetDefault">1</idc:field>
                <idc:field name="isNew"></idc:field>
                <idc:field name="dLastModifiedDate">3/6/15 2:03 PM</idc:field>
                <idc:field name="dWfName">eta_workflow</idc:field>
                <idc:field name="xRoutingToken1:isSetDefault">1</idc:field>
                <idc:field name="dWfID">28</idc:field>
                <idc:field name="xWebFlag"></idc:field>
                <idc:field name="dWfStepWeight">1</idc:field>
                <idc:field name="dpEvent">OnImport</idc:field>
                <idc:field name="xPermitType"></idc:field>
                <idc:field name="xStateID2Type:isSetDefault">1</idc:field>
                <idc:field name="xSSNSet"></idc:field>
                <idc:field name="xStateRegion"></idc:field>
                <idc:field name="xPartitionId"></idc:field>
                <idc:field name="xAlertText:isSetDefault">1</idc:field>
                <idc:field name="isDocProfileDone">1</idc:field>
                <idc:field name="xStateID2:isSetDefault">1</idc:field>
                <idc:field name="isCollaboration">1</idc:field>
                <idc:field name="xLatitude:isSetDefault">1</idc:field>
                <idc:field name="xStateID5Type"></idc:field>
                <idc:field name="xPermitLicenseNum"></idc:field>
                <idc:field name="dCollectionInherit">0</idc:field>
                <idc:field name="xStateID1Type:isSetDefault">1</idc:field>
                <idc:field name="xSupStateIDs:isSetDefault">1</idc:field>
                <idc:field name="xEmailFrom:isSetDefault">1</idc:field>
                <idc:field name="xScanDate"></idc:field>
                <idc:field name="xSupDate1Type:isSetDefault">1</idc:field>
                <idc:field name="dCollectionEnabled">1</idc:field>
                <idc:field name="dRawDocID">137180</idc:field>
                <idc:field name="isCurRevEmpty"></idc:field>
                <idc:field name="dWfDocState">INPROCESS</idc:field>
                <idc:field name="VaultfilePath">/opt/stellent/vault/other/@prj/@prj0000028/67935.pdf</idc:field>
                <idc:field name="xTransactionType:isSetDefault">1</idc:field>
                <idc:field name="xPermitType:isSetDefault">1</idc:field>
                <idc:field name="xDiscussionCount">0</idc:field>
                <idc:field name="isDocProfileUsed">true</idc:field>
                <idc:field name="xAssociatedRoles:isSetDefault">1</idc:field>
                <idc:field name="xRoutingToken3:isSetDefault">1</idc:field>
                <idc:field name="xStateID4Type"></idc:field>
                <idc:field name="dActionMillis">476131105</idc:field>
                <idc:field name="latestCreateDate">{ts '2015-04-16 13:34:55.890'}</idc:field>
                <idc:field name="xMilePost"></idc:field>
                <idc:field name="xProjectActivityNum"></idc:field>
                <idc:field name="dWfEntryTs">{ts '2015-04-16 13:35:31.075'}</idc:field>
                <idc:field name="AliasAccessList">statewide-edocs-admin,7,statewide-eta-review,15</idc:field>
                <idc:field name="dConversionState">New</idc:field>
                <idc:field name="xComments"></idc:field>
                <idc:field name="xFileType"></idc:field>
                <idc:field name="lastEntryTs">{ts '2015-04-16 13:35:00.000'}</idc:field>
                <idc:field name="dCollectionCreator">jphustman</idc:field>
                <idc:field name="xProjectActivityNum:isSetDefault">1</idc:field>
                <idc:field name="isStatusChanged">1</idc:field>
                <idc:field name="xDateAccepted"></idc:field>
                <idc:field name="latestInDate">{ts '2015-04-16 13:34:55.890'}</idc:field>
                <idc:field name="xEmailSubject"></idc:field>
                <idc:field name="xSupDate1:isSetDefault">1</idc:field>
                <idc:field name="xWorkflowTrigger"></idc:field>
                <idc:field name="xMilePoint:isSetDefault">1</idc:field>
                <idc:field name="xAssociatedParties"></idc:field>
                <idc:field name="xPrimaryParties:isSetDefault">1</idc:field>
                <idc:field name="xStateID3Type"></idc:field>
                <idc:field name="xFacilityID"></idc:field>
                <idc:field name="xEmailTo"></idc:field>
                <idc:field name="oldName">DOT-JNU_066069</idc:field>
                <idc:field name="dConversion">ImageThumbnail</idc:field>
                <idc:field name="isInfoOnly"></idc:field>
                <idc:field name="xStateID5"></idc:field>
                <idc:field name="xStateID4"></idc:field>
                <idc:field name="xForceFolderSecurity">TRUE</idc:field>
                <idc:field name="xStateID3"></idc:field>
                <idc:field name="xStateID2"></idc:field>
                <idc:field name="dWfStepType">:R:</idc:field>
                <idc:field name="xClbraAliasList">@statewide-edocs-admin(RWD),@statewide-eta-review(RWDA)</idc:field>
                <idc:field name="xStateID1"></idc:field>
                <idc:field name="xDateCreated"></idc:field>
                <idc:field name="dCurRevID">67935</idc:field>
                <idc:field name="xTransactionType"></idc:field>
                <idc:field name="dWfDirectory">projects</idc:field>
                <idc:field name="numlevels">0</idc:field>
                <idc:field name="xPublicallyAccessible:isSetDefault">1</idc:field>
                <idc:field name="dActionDate">4/16/15 1:35 PM</idc:field>
                <idc:field name="dWfStepIsAll">0</idc:field>
                <idc:field name="xFormat"></idc:field>
                <idc:field name="dAction">Checkin</idc:field>
                <idc:field name="prevReleaseState"></idc:field>
                <idc:field name="xSupStateIDTypes:isSetDefault">1</idc:field>
                <idc:field name="CurRevID">67935</idc:field>
                <idc:field name="xStateID2Type"></idc:field>
                <idc:field name="xApprover:isSetDefault">1</idc:field>
                <idc:field name="xStateID5Type:isSetDefault">1</idc:field>
                <idc:field name="xHidden">FALSE</idc:field>
                <idc:field name="xTypeCategory:isSetDefault">1</idc:field>
                <idc:field name="latestRevLabel">1</idc:field>
                <idc:field name="dCollectionGUID">9176D945-DB21-9A8B-68F0-B4909C26705A</idc:field>
                <idc:field name="xDateIssued"></idc:field>
                <idc:field name="xFacilityType"></idc:field>
                <idc:field name="xPublicationDate"></idc:field>
                <idc:field name="dClbraLongDesc">Admin procedures, certificates, server restarts, etc.</idc:field>
                <idc:field name="dWfStatus">INPROCESS</idc:field>
                <idc:field name="xSupDates:isSetDefault">1</idc:field>
                <idc:field name="xRouteType"></idc:field>
                <idc:field name="xEmailTo:isSetDefault">1</idc:field>
                <idc:field name="xAssociatedRoles"></idc:field>
                <idc:field name="xFederalProjectNum"></idc:field>
                <idc:field name="xStateID1:isSetDefault">1</idc:field>
                <idc:field name="xStateID1Type"></idc:field>
                <idc:field name="xTrashDeleter:isSetDefault">1</idc:field>
                <idc:field name="xProjectActivityType"></idc:field>
                <idc:field name="xComments:isSetDefault">1</idc:field>
                <idc:field name="xSupDates"></idc:field>
                <idc:field name="xProfileTrigger"></idc:field>
                <idc:field name="xEmailCC:isSetDefault">1</idc:field>
                <idc:field name="latestStatus">EDIT</idc:field>
                <idc:field name="latestPublishState"></idc:field>
                <idc:field name="xFileType:isSetDefault">1</idc:field>
                <idc:field name="xParcelID"></idc:field>
                <idc:field name="xPrimaryRole3"></idc:field>
                <idc:field name="xPrimaryRole2"></idc:field>
                <idc:field name="wfCurrentStepPrefix">Director_Approval@eta_workflow</idc:field>
                <idc:field name="xPrimaryRole1"></idc:field>
                <idc:field name="dpAction">CheckinSel</idc:field>
                <idc:field name="xBorough:isSetDefault">1</idc:field>
                <idc:field name="xSupDateTypes:isSetDefault">1</idc:field>
                <idc:field name="xTrashDeleteName"></idc:field>
                <idc:field name="dClbraDefDispAttrs">color_blue</idc:field>
                <idc:field name="WfEditFinished">true</idc:field>
                <idc:field name="xClbraUserList">&amp;sysadmin(RWDA),&amp;jphustman(RWDA)</idc:field>
                <idc:field name="xFacilityType:isSetDefault">1</idc:field>
                <idc:field name="xDateValidEnd"></idc:field>
                <idc:field name="xDateAccepted:isSetDefault">1</idc:field>
                <idc:field name="wfQueueEnterTs">{ts '2015-04-16 13:35:31.131'}</idc:field>
                <idc:field name="isCheckin">1</idc:field>
                <idc:field name="xSupDate3"></idc:field>
                <idc:field name="dClbraMailExcludeAll">1</idc:field>
                <idc:field name="xSubject"></idc:field>
                <idc:field name="xSupDate2"></idc:field>
                <idc:field name="dWfStepName">Director_Approval</idc:field>
                <idc:field name="xSupDate1"></idc:field>
                <idc:field name="xMilePoint"></idc:field>
                <idc:field name="WebfilePath">/opt/stellent/weblayout/groups/projects/@prj/@prj0000028/documents/other/dot-jnu_066069~1.pdf</idc:field>
                <idc:field name="xSupStateIDTypes"></idc:field>
                <idc:field name="xRoutingToken3"></idc:field>
                <idc:field name="xRoutingToken2"></idc:field>
                <idc:field name="xPrimaryRole1:isSetDefault">1</idc:field>
                <idc:field name="xRoutingToken1"></idc:field>
                <idc:field name="xStateID4:isSetDefault">1</idc:field>
                <idc:field name="hasCollectionID">1</idc:field>
                <idc:field name="xSelectedWorkflow"></idc:field>
                <idc:field name="dClbraProjLead">sysadmin</idc:field>
                <idc:field name="dWfStepDescription"></idc:field>
                <idc:field name="StatusCode">0</idc:field>
                <idc:field name="xLegalDescription"></idc:field>
                <idc:field name="xProjectActivityPhase"></idc:field>
                <idc:field name="xTypeCategory"></idc:field>
                <idc:field name="xPrimaryParty3"></idc:field>
                <idc:field name="xPrimaryParty2"></idc:field>
                <idc:field name="xPrimaryParty1">jphustman</idc:field>
                <idc:field name="xTrashDeleteName:isSetDefault">1</idc:field>
                <idc:field name="xLatitude"></idc:field>
                <idc:field name="xAnnouncement">no</idc:field>
                <idc:field name="latestID">67935</idc:field>
                <idc:field name="xFederalProjectNum:isSetDefault">1</idc:field>
                <idc:field name="xTypeSubcategory:isSetDefault">1</idc:field>
                <idc:field name="dParentCollectionID">708</idc:field>
                <idc:field name="xReceiveDate:isSetDefault">1</idc:field>
                <idc:field name="xTrashDeleteDate"></idc:field>
                <idc:field name="xEmailFrom"></idc:field>
                <idc:field name="isUpdate">1</idc:field>
                <idc:field name="xStateDepartment">Transportation &amp; Public Facilities</idc:field>
                <idc:field name="xTrashDeleteLoc">0</idc:field>
                <idc:field name="xAlert">no</idc:field>
                <idc:field name="xDiscussionType">N/A</idc:field>
                <idc:field name="xRouteType:isSetDefault">1</idc:field>
                <idc:field name="xSource"></idc:field>
                <idc:field name="xLongitude"></idc:field>
                <idc:field name="xDateCreated:isSetDefault">1</idc:field>
                <idc:field name="entryCount">2</idc:field>
                <idc:field name="dWfComputed"></idc:field>
                <idc:field name="xProjectActivityName"></idc:field>
                <idc:field name="xBorough"></idc:field>
                <idc:field name="xPublicationDate:isSetDefault">1</idc:field>
                <idc:field name="xPrimaryRole3:isSetDefault">1</idc:field>
                <idc:field name="primaryFile">/srv/http/eta/app/temp/25-2015-00003-azgj4s.pdf</idc:field>
                <idc:field name="xSupDate3:isSetDefault">1</idc:field>
                <idc:field name="dCollectionModifier">jphustman</idc:field>
                <idc:field name="dConvJobID">72199</idc:field>
                <idc:field name="xPrimaryParty3:isSetDefault">1</idc:field>
                <idc:field name="xDateIssued:isSetDefault">1</idc:field>
                <idc:field name="StatusMessage">Successfully checked in content item 'DOT-JNU_066069'.</idc:field>
                <idc:field name="xProfileTrigger:isSetDefault">1</idc:field>
                <idc:field name="xInhibitUpdate">FALSE</idc:field>
                <idc:field name="xSupDate3Type"></idc:field>
                <idc:field name="xProjectActivityName:isSetDefault">1</idc:field>
                <idc:field name="wfQueueActionState"></idc:field>
                <idc:field name="wfMessage"></idc:field>
                <idc:field name="xPublicallyAccessible"></idc:field>
                <idc:field name="xStateAgencySection:isSetDefault">1</idc:field>
                <idc:field name="xStateID4Type:isSetDefault">1</idc:field>
                <idc:field name="xRoute:isSetDefault">1</idc:field>
                <idc:field name="dCollectionType">0</idc:field>
                <idc:field name="xStateAgencySection"></idc:field>
                <idc:field name="dClbraName">PRJ0000028</idc:field>
                <idc:field name="dPromptForMetadata">0</idc:field>
                <idc:field name="xSubject:isSetDefault">1</idc:field>
                <idc:field name="IsWorkflow">1</idc:field>
                <idc:field name="xScanBatchName"></idc:field>
                <idc:field name="xIsPartOf:isSetDefault">1</idc:field>
                <idc:field name="dConvActionDate">4/16/15 1:35 PM</idc:field>
                <idc:field name="dWorkflowState">R</idc:field>
                <idc:field name="xReadOnly">FALSE</idc:field>
                <idc:field name="IsNotLatestRev"></idc:field>
                <idc:field name="xStateID3Type:isSetDefault">1</idc:field>
                <idc:field name="xTrashDeleteDate:isSetDefault">1</idc:field>
                <idc:field name="dCollectionID">732</idc:field>
                <idc:field name="xSupDate2Type"></idc:field>
                <idc:field name="xScannerStationID"></idc:field>
                <idc:field name="xDatum"></idc:field>
                <idc:field name="xSupDate3Type:isSetDefault">1</idc:field>
                <idc:field name="xParcelIDType"></idc:field>
                <idc:field name="xEmailSubject:isSetDefault">1</idc:field>
                <idc:field name="RenditionId">webViewableFile</idc:field>
                <idc:field name="xParcelIDType:isSetDefault">1</idc:field>
                <idc:field name="IsAutoNumber">1</idc:field>
                <idc:field name="wfQueueLastActionTs">{ts '2015-04-16 13:35:31.131'}</idc:field>
                <idc:field name="DocExists">1</idc:field>
                <idc:field name="xProjectActivityPhase:isSetDefault">1</idc:field>
                <idc:field name="xIsPartOf"></idc:field>
                <idc:field name="xRoutingToken2:isSetDefault">1</idc:field>
                <idc:field name="xApprover"></idc:field>
                <idc:field name="xPermitLicenseNum:isSetDefault">1</idc:field>
                <idc:field name="primaryFile:path">/opt/stellent/vault/~temp/439225588.pdf</idc:field>
                <idc:field name="xSupDate2Type:isSetDefault">1</idc:field>
                <idc:field name="xCity:isSetDefault">1</idc:field>
                <idc:field name="dConvStartDate">4/16/15 1:35 PM</idc:field>
                <idc:field name="xRoute"></idc:field>
                <idc:field name="xDateSubmitted:isSetDefault">1</idc:field>
                <idc:field name="dCollectionQueries">1</idc:field>
                <idc:field name="xSupDate1Type"></idc:field>
                <idc:field name="UserAccessList">sysadmin,15</idc:field>
                <idc:field name="latestReleaseState">E</idc:field>
                <idc:field name="xStateID3:isSetDefault">1</idc:field>
                <idc:field name="xSupStateIDs"></idc:field>
                <idc:field name="dWfType">Criteria</idc:field>
                <idc:field name="dWfCurrentStepID">70</idc:field>
                <idc:field name="xGISxRef"></idc:field>
                <idc:field name="IsUpdate">1</idc:field>
                <idc:field name="reserveLocation">false</idc:field>
                <idc:field name="xAlertText"></idc:field>
                <idc:field name="xFileNumber"></idc:field>
                <idc:field name="dWfStepID">70</idc:field>
                <idc:field name="xSSNSet:isSetDefault">1</idc:field>
                <idc:field name="xAPPxRef"></idc:field>
                <idc:field name="xStateRegion:isSetDefault">1</idc:field>
                <idc:field name="updateSideEffectServices"></idc:field>
                <idc:field name="xTrashDeleter"></idc:field>
                <idc:field name="dCollectionOwner">jphustman</idc:field>
                <idc:field name="xScanUser"></idc:field>
                <idc:field name="xStateDocID"></idc:field>
                <idc:field name="xTypeSubcategory"></idc:field>
                <idc:field name="xProjectActivityType:isSetDefault">1</idc:field>
                <idc:field name="dUserName">jphustman</idc:field>
                <idc:field name="xDateValidEnd:isSetDefault">1</idc:field>
                <idc:field name="xLongitude:isSetDefault">1</idc:field>
                <idc:field name="xFacilityID:isSetDefault">1</idc:field>
                <idc:field name="xSelectedWorkflow:isSetDefault">1</idc:field>
                <idc:field name="dClbraMailExcludeList"></idc:field>
                <idc:field name="xPrimaryRole2:isSetDefault">1</idc:field>
                <idc:field name="xParcelID:isSetDefault">1</idc:field>
                <idc:field name="dCollectionName">eta-dev</idc:field>
                <idc:field name="xDateSubmitted"></idc:field>
                <idc:field name="xSupDate2:isSetDefault">1</idc:field>
                <idc:field name="xStateID5:isSetDefault">1</idc:field>
                <idc:field name="xCity"></idc:field>
                <idc:field name="xDatum:isSetDefault">1</idc:field>
                <idc:field name="xPrimaryParty2:isSetDefault">1</idc:field>
                <idc:field name="xAssociatedParties:isSetDefault">1</idc:field>
                <idc:field name="xLegalDescription:isSetDefault">1</idc:field>
                <idc:field name="xCollectionID">732</idc:field>
                <idc:field name="xSource:isSetDefault">1</idc:field>
                <idc:field name="xz_test"></idc:field>
                <idc:field name="xFileNumber:isSetDefault">1</idc:field>
                <idc:field name="xMilePost:isSetDefault">1</idc:field>
                <idc:field name="dChildManipulation">1</idc:field>
                <idc:field name="xStorageRule"></idc:field>
                <idc:field name="xReceiveDate"></idc:field>
                <idc:field name="xReplaces"></idc:field>
                <idc:field name="isEditMode">1</idc:field>
                <idc:resultset name="UserAttribInfo" TotalRows="1">
                    <idc:row>
                        <idc:field name="dUserName">jphustman</idc:field>
                        <idc:field name="AttributeInfo">account,prj,15,account,##none,15,role,contributor,15,role,mscve_public,15,role,planning_public,15,role,materials_public,15,role,design_public,15,role,row_public,15,role,admin_public,15,role,airport_public,15,role,gis_public,15,role,construction_public,15,role,advertising_public,15,role,archives_public,15,role,preconstruction_public,15,role,transdata_public,15,role,research_public,15</idc:field>
                    </idc:row>
                </idc:resultset>
            </idc:document>
        </idc:service>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope></cfoutput>
			</cfsavecontent>

			<cfset smallerXml = new model.services.usefulfunctions().soapToArrayNodes(soapBody)>
			<cfset arrNode = xmlSearch(smallerXml, "//field")>
			<cfset newStruct = {}>
			<cfloop array="#arrNode#" index="i">
				<cfif i.XmlAttributes["name"] EQ "dWfStatus">
                	<cfset structInsert(newStruct, i.XmlAttributes["name"], i.XmlText)>
				</cfif>
			</cfloop>

			<cfset assertEquals("INPROCESS", newStruct.dWfStatus)>
        </cffunction>

</cfcomponent>
