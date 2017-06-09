<cfcomponent output="no">
    <cfscript>
    function init() {
        return this;
    }
    </cfscript>

    <cffunction name="StellentCheckInNoFile" access="public" returntype="string" output="false">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="aksas" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projectname" type="string" required="no" default="">

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#arguments.author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.aksas#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projectname#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>?</s0:fileName>
                  <s0:fileContent/>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="ajkeeffe" password="6Biffinvv">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>

        <cfset myResult="#docID#">
        <cfreturn myResult>
    </cffunction>

    <cffunction name="StellentCheckInFile" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">

        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#arguments.author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityType</s0:name>
                   <s0:value>#arguments.facilitytype#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityID</s0:name>
                   <s0:value>#arguments.facilityid#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>60</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(fileLocalPath,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cfhttp url="http://fbxedocs.dot.state.ak.us/fbx-dot-edocs/idcplg" method="POST" username="materials_checkin" password="materials_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <!---
        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>
        --->

        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("was not",retval) eq 0>
            <cfset statusMessage="Successful checkin">
        <cfelse>
            <cfset statusMessage=#mid(retval,findnocase("content item",retval),500)#>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->
        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>


    <cffunction name="StellentCheckInFile_project" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">
        <cfargument name="dateissued" type="string" required="no" default="">
        <cfargument name="collectionid" type="string" required="no" default="">


        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>


        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#localscope.ampersand_escaped_title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityType</s0:name>
                   <s0:value>#arguments.facilitytype#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityID</s0:name>
                   <s0:value>#arguments.facilityid#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#localscope.ampersand_escaped_projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>#arguments.collectionid#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://ancedocs.dot.state.ak.us/anc-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>


        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>


        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("successfully checked in",retval) neq 0>
            <cfset statusMessage=#mid(retval,findnocase("successfully checked in",retval),500)#>
        <cfelse>
            <cfset statusMessage = retval>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->

        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>

    <cffunction name="central_project_checkin" access="public" returntype="string" output="false">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="collectionid" type="string" required="no" default="">
        <cfargument name="author" type="string" required="yes">
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
        <cfargument name="group" type="string" required="yes">

        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="dateissued" type="string" required="no" default="">
        <cfargument name="filePath" required="yes">


        <cfsetting requestTimeOut = "1000">

        <cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>

        <cfset localscope.primaryFilePath = GetTempDirectory() & filePath>

    <cfhttp url="http://ancedocs-ucm.dot.state.ak.us/anc-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin" multipart="yes" timeout="1000">

    <!--- The service field (could any service be called this way? --->
    <cfhttpparam type="formfield" name="IdcService" value="CHECKIN_NEW">

    <!--- Required fields for check in --->
    <cfhttpparam type="formfield" name="dDocType" value="#arguments.type#">
    <cfhttpparam type="formfield" name="dDocAuthor" value="#localscope.ampersand_escaped_author#">
    <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
    <cfhttpparam type="formfield" name="dDocTitle" value="#localscope.ampersand_escaped_title#">
    <cfhttpparam type="formfield" name="dRevLabel" value="1">

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
    <cfhttpparam type="formfield" name="xProfileTrigger" value="Project Documents">

    <!--- Required primary file --->
    <cfhttpparam type="file" name="primaryFile" file="#localscope.primaryFilePath#">
    </cfhttp>

    <cfif find("Content Server Request Failed",cfhttp.fileContent) neq 0>

        <cfsavecontent variable="errormessage">
            <cfoutput>#mid(cfhttp.fileContent,find("Content Server Request Failed",cfhttp.fileContent),500)#</cfoutput>
        </cfsavecontent>

        <cfsavecontent variable="errordetailstart">
            <cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
        </cfsavecontent>

        <cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

        <cfset returnmessage="eDocs Check In Failed: " & #errordetail#>

    <!---<cfset returnmessage="eDocs Check In Failed: " & cfhttp.FileContent>--->
    </cfif>

    <cfif find("Check In Confirmation",cfhttp.fileContent) neq 0>
        <cfset returnmessage="Check In successful for <b>" & #localscope.ampersand_escaped_title# & "</b>">
    </cfif>

        <cfreturn returnmessage>
    </cffunction>

    <cffunction name="zzzsoutheast_project_checkin_test" access="public" returntype="string" output="false">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="collectionid" type="string" required="no" default="">
        <cfargument name="author" type="string" required="yes">
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
        <cfargument name="group" type="string" required="yes">

        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="dateissued" type="string" required="no" default="">
        <cfargument name="filePath" required="yes">


        <cfsetting requestTimeOut = "1000">

        <cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>

        <cfset localscope.primaryFilePath = GetTempDirectory() & filePath>

    <cfhttp url="http://fbxedocs-ucm.dot.state.ak.us/fbx-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin" multipart="yes" timeout="1000">

    <!--- The service field (could any service be called this way? --->
    <cfhttpparam type="formfield" name="IdcService" value="CHECKIN_NEW">

    <!--- Required fields for check in --->
    <cfhttpparam type="formfield" name="dDocType" value="#arguments.type#">
    <cfhttpparam type="formfield" name="dDocAuthor" value="#localscope.ampersand_escaped_author#">
    <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
    <cfhttpparam type="formfield" name="dDocTitle" value="#localscope.ampersand_escaped_title#">
    <cfhttpparam type="formfield" name="dRevLabel" value="1">

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
    <cfhttpparam type="formfield" name="xProfileTrigger" value="Project Documents">

    <!--- Required primary file --->
    <cfhttpparam type="file" name="primaryFile" file="#localscope.primaryFilePath#">
    </cfhttp>

    <cfif find("Content Server Request Failed",cfhttp.fileContent) neq 0>

        <cfsavecontent variable="errormessage">
            <cfoutput>#mid(cfhttp.fileContent,find("Content Server Request Failed",cfhttp.fileContent),500)#</cfoutput>
        </cfsavecontent>

        <cfsavecontent variable="errordetailstart">
            <cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
        </cfsavecontent>

        <cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

        <cfset returnmessage="eDocs Check In Failed: " & #errordetail#>

    <!---<cfset returnmessage="eDocs Check In Failed: " & cfhttp.FileContent>--->
    </cfif>

    <cfif find("Check In Confirmation",cfhttp.fileContent) neq 0>
        <cfset returnmessage="Check In successful for <b>" & #localscope.ampersand_escaped_title# & "</b>">
    </cfif>

        <cfreturn returnmessage>
    </cffunction>


    <cffunction name="StellentCheckInFile_km" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="formtype" type="string" required="no" default="">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">

        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;")#>

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>300</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProfileTrigger</s0:name>
                   <s0:value>#arguments.formtype#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="km_checkin" password="km_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <!---
        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>
        --->

        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("was not",retval) eq 0>
            <cfset statusMessage="Successful checkin">
        <cfelse>
            <cfset statusMessage=fileLocalPath & "--" & #mid(retval,findnocase("content item",retval),500)#>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->
        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>
    <!---
    southeast collection IDs
    parent project folder 293
    As Builts 295
    Contracts 296
    Environmental 294
    Geotechnical 298
    Recon 299

    --->
    <cffunction name="StellentCheckInFile_project_southeast" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="formtype" type="string" required="no" default="">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="parcel" type="string" required="no" default="">
        <cfargument name="trackerID" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="folder" type="string" required="no" default="293">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">

        <cfswitch expression="#arguments.typesubcategory#">
            <cfcase value="As Builts">
                <cfset localscope.folderID = "295">
            </cfcase>
            <cfdefaultcase>
                <cfset localscope.folderID = "293">
            </cfdefaultcase>
        </cfswitch>

        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;")#>

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xParcelID</s0:name>
                   <s0:value>#arguments.parcel#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFileNumber</s0:name>
                   <s0:value>#arguments.trackerID#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>#arguments.folder#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProfileTrigger</s0:name>
                   <s0:value>#arguments.formtype#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <!---
        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>
        --->

        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("was not",retval) eq 0>
            <cfset statusMessage="Successful checkin">
        <cfelse>
            <cfset statusMessage=fileLocalPath & "--" & #mid(retval,findnocase("content item",retval),500)#>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->
        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>

    <cffunction name="StellentCheckInFile_project_northern" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="formtype" type="string" required="no" default="">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">

        <cfset localscope.folderID = "63">

        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;")#>

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>#localscope.folderID#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProfileTrigger</s0:name>
                   <s0:value>#arguments.formtype#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://fbxedocs.dot.state.ak.us/fbx-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <!---
        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>
        --->

        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("was not",retval) eq 0>
            <cfset statusMessage="Successful checkin">
        <cfelse>
            <cfset statusMessage=fileLocalPath & "--" & #mid(retval,findnocase("content item",retval),500)#>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->
        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>


    <cffunction name="StellentCheckInFile_appraisal_southeast" access="public" returntype="string" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="formtype" type="string" required="no" default="">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="folder" type="string" required="no" default="293">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">

        <cfswitch expression="#arguments.typesubcategory#">
            <cfcase value="As Builts">
                <cfset localscope.folderID = "295">
            </cfcase>
            <cfdefaultcase>
                <cfset localscope.folderID = "293">
            </cfdefaultcase>
        </cfswitch>

        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;")#>

        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#arguments.title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#arguments.projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>#arguments.folder#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProfileTrigger</s0:name>
                   <s0:value>#arguments.formtype#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <!---
        <cfsavecontent variable="docID">
            <cfoutput>#mid(cfhttp.fileContent,find("idc:dID>",cfhttp.fileContent)+8,5)#</cfoutput>
        </cfsavecontent>
        --->

        <cfset retval=cfhttp.fileContent>

        <cfif findnocase("was not",retval) eq 0>
            <cfset statusMessage="Successful checkin">
        <cfelse>
            <cfset statusMessage=fileLocalPath & "--" & #mid(retval,findnocase("content item",retval),500)#>
        </cfif>


    <!---
        <cfsavecontent variable="statusMessage">
            <cfoutput>#mid(cfhttp.fileContent,find("0 Success",cfhttp.fileContent)+1,500)#</cfoutput>
        </cfsavecontent>
    --->
        <!---<cfset myResult="#docID#">--->
        <cfset myResult=statusMessage>
        <cfreturn myResult>
    </cffunction>

    <cffunction name="project_document_checkin_central" access="public" returntype="struct" output="false">
        <cfargument name="filePath" required="yes">
        <cfargument name="fileLocalPath" required="yes">
        <cfargument name="title" type="string" required="yes">
        <cfargument name="facilitytype" type="string" required="no" default="">
        <cfargument name="facilityid" type="string" required="no" default="">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="documentauthor" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="AKSAS" type="string" required="no" default="">
        <cfargument name="comment" type="string" required="no" default="">
        <cfargument name="projname" type="string" required="no" default="">
        <cfargument name="fedprojectnum" type="string" required="no" default="">
        <cfargument name="typecategory" type="string" required="no" default="">
        <cfargument name="typesubcategory" type="string" required="no" default="">
        <cfargument name="datum" type="string" required="no" default="">
        <cfargument name="latitude" type="string" required="no" default="">
        <cfargument name="longitude" type="string" required="no" default="">
        <cfargument name="city" type="string" required="no" default="">
        <cfargument name="statedepartment" type="string" required="no" default="">
        <cfargument name="agencysection" type="string" required="no" default="">
        <cfargument name="stateregion" type="string" required="no" default="">
        <cfargument name="borough" type="string" required="no" default="">
        <cfargument name="datecreated" type="string" required="no" default="">
        <cfargument name="dateissued" type="string" required="no" default="">
        <cfargument name="collectionid" type="string" required="no" default="">


        <cffile
        action="readbinary"
        file="#filePath#"
        variable="objBinaryData"
        />

        <cfsavecontent variable="strXmlData">
            <cfoutput>
                #ToBase64(objBinaryData)#
            </cfoutput>
        </cfsavecontent>

        <cfset localscope.ampersand_escaped_filename=#Replace(fileLocalPath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>


        <cfsavecontent variable="localscope.soapRequest">
        <cfoutput>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:s0="http://www.stellent.com/CheckIn/">
          <soap:Body>
            <s0:CheckInUniversal>
              <s0:dDocTitle>#localscope.ampersand_escaped_title#</s0:dDocTitle>
              <s0:dDocType>#arguments.type#</s0:dDocType>
              <s0:dDocAuthor>#localscope.ampersand_escaped_author#</s0:dDocAuthor>
              <s0:dSecurityGroup>#arguments.group#</s0:dSecurityGroup>
              <s0:dDocAccount/>
              <s0:CustomDocMetaData>
                <s0:property>
                   <s0:name>xDocAuthor</s0:name>
                   <s0:value>#localscope.ampersand_escaped_documentauthor#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityNum</s0:name>
                   <s0:value>#arguments.AKSAS#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xComments</s0:name>
                   <s0:value>#arguments.comment#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityType</s0:name>
                   <s0:value>#arguments.facilitytype#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFacilityID</s0:name>
                   <s0:value>#arguments.facilityid#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xProjectActivityName</s0:name>
                   <s0:value>#localscope.ampersand_escaped_projname#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xFederalProjectNum</s0:name>
                   <s0:value>#arguments.fedprojectnum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeCategory</s0:name>
                   <s0:value>#arguments.typecategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xTypeSubcategory</s0:name>
                   <s0:value>#arguments.typesubcategory#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDatum</s0:name>
                   <s0:value>#arguments.datum#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLatitude</s0:name>
                   <s0:value>#arguments.latitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xLongitude</s0:name>
                   <s0:value>#arguments.longitude#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCity</s0:name>
                   <s0:value>#arguments.city#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xBorough</s0:name>
                   <s0:value>#arguments.borough#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xDateCreated</s0:name>
                   <s0:value>#arguments.datecreated#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateDepartment</s0:name>
                   <s0:value>#localscope.ampersand_escaped_department#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateAgencySection</s0:name>
                   <s0:value>#arguments.agencysection#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xStateRegion</s0:name>
                   <s0:value>#arguments.stateregion#</s0:value>
                </s0:property>
                <s0:property>
                   <s0:name>xCollectionID</s0:name>
                   <s0:value>#arguments.collectionid#</s0:value>
                </s0:property>
              </s0:CustomDocMetaData>
              <s0:primaryFile>
                  <s0:fileName>#Replace(localscope.ampersand_escaped_filename,"\","/")#</s0:fileName>
                  <s0:fileContent>#trim(strXmlData)#</s0:fileContent>
              </s0:primaryFile>
            </s0:CheckInUniversal>
          </soap:Body>
        </soap:Envelope>
        </cfoutput>
        </cfsavecontent>
        <cffile action="Write" file="soaprequest.txt" nameconflict="overwrite" output="#trim(localscope.soapRequest)#">
        <cfhttp url="http://ancedocs.dot.state.ak.us/anc-dot-edocs/idcplg" method="POST" username="project_checkin" password="project_checkin">
        <cfhttpparam type="header" name="Content-Type" value="text/xml; charset=utf-8">
        <cfhttpparam type="header" name="SOAPAction" value="http://www.stellent.com/CheckIn">
        <cfhttpparam type="xml" name="body" value="#trim(localscope.soapRequest)#">
        </cfhttp>

        <cfset retval=cfhttp.fileContent>

        <cfxml variable="retvalxml" casesensitive="no">
        <cfoutput>#retval#</cfoutput>
        </cfxml>
        <cfset checkinStatus = structnew()>
        <cfset checkinStatus.did = retvalxml.Envelope.body.checkinuniversalresponse.checkinuniversalresult.did.xmltext>
        <cfset checkinStatus.ddocname = "DOT-ANC_" & retvalxml.Envelope.body.checkinuniversalresponse.checkinuniversalresult.drevclassid.xmltext>
        <cfset checkinStatus.returncode = retvalxml.Envelope.body.checkinuniversalresponse.checkinuniversalresult.statusinfo.statuscode.xmltext>
        <cfset checkinStatus.message = retvalxml.Envelope.body.checkinuniversalresponse.checkinuniversalresult.statusinfo.statusmessage.xmltext>

        <cfreturn checkinstatus>
    </cffunction>

    <cffunction name="southeast_project_checkin_cfhttp" access="public" returntype="string" output="false">
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


        <cfsetting requestTimeOut = "1000">

        <cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_documentauthor=#Replace(documentauthor,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_department=#Replace(statedepartment,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_projname=#Replace(projname,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_recipients=#Replace(recipients,"&","&amp;","all")#>

        <cfset localscope.primaryFilePath = GetTempDirectory() & filePath>

        <cfset returnmessage = "">
        <cfset checkinstatus = "">
        <cftry>
            <cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="#arguments.edocs_user#" password="#arguments.edocs_password#" multipart="yes" timeout="1000">

                <!--- The service field (could any service be called this way? --->
                <cfhttpparam type="formfield" name="IdcService" value="CHECKIN_NEW">

                <!--- Required fields for check in --->
                <cfhttpparam type="formfield" name="dDocType" value="#arguments.type#">
                <cfhttpparam type="formfield" name="dDocAuthor" value="#localscope.ampersand_escaped_author#">
                <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
                <cfhttpparam type="formfield" name="dDocTitle" value="#localscope.ampersand_escaped_title#">
                <cfhttpparam type="formfield" name="dRevLabel" value="1">
                <cfhttpparam type="formfield" name="dDocAccount" value="#arguments.account#">

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

                <!--- Required primary file --->
                <cfhttpparam type="file" name="primaryFile" file="#arguments.primaryFile#">
            </cfhttp>

            <cfif find("Content Server Request Failed",cfhttp.fileContent) neq 0>
                <cfset checkinstatus="failure">

                <cfsavecontent variable="errormessage">
                    <cfoutput>#mid(cfhttp.fileContent,find("Content Server Request Failed",cfhttp.fileContent),500)#</cfoutput>
                </cfsavecontent>

                <cfsavecontent variable="errordetailstart">
                    <cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
                </cfsavecontent>

                <cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

                <cfset returnmessage="<b>eDocs Check In Failed:</b> " & #errordetail#>
            </cfif>

            <cfif find("Check In Confirmation",cfhttp.fileContent) neq 0>
                <cfset checkinstatus="success">
                <cfset returnmessage="Check In successful for <b>" & #localscope.ampersand_escaped_title# & "</b>">
            </cfif>

            <cfif checkinstatus eq "">
                <cfset returnmessage=cfhttp.FileContent>
            </cfif>

            <cfcatch type="any">
                <cfsavecontent variable="returnmessage">
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
                <cfreturn returnmessage>
            </cfcatch>
        </cftry>

        <cfreturn returnmessage>
    </cffunction>


    <cffunction name="southeast_revision_checkin_cfhttp" access="public" returntype="string" output="false">
        <cfargument name="edocs_user" type="string" required="no" default="project_checkin">
        <cfargument name="edocs_password" type="string" required="no" default="project_checkin">
        <cfargument name="did" type="string" required="yes">
        <cfargument name="drevlabel" type="string" required="yes">
        <cfargument name="account" type="string" required="no" default="">
        <cfargument name="ddocname" type="string" required="yes">

        <cfargument name="title" type="string" required="yes">
        <cfargument name="type" type="string" required="yes">
        <cfargument name="author" type="string" required="yes">
        <cfargument name="group" type="string" required="yes">
        <cfargument name="filePath" required="yes">

        <cfargument name='xBorough' type='string' required='yes'>
        <cfargument name='xCity' type='string' required='yes'>
        <cfargument name='xClbraAliasList' type='string' required='yes'>
        <cfargument name='xClbraUserList' type='string' required='yes'>
        <cfargument name='xCollectionID' type='string' required='yes'>
        <cfargument name='xComments' type='string' required='yes'>
        <cfargument name='xDateAccepted' type='string' required='yes'>
        <cfargument name='xDateCreated' type='string' required='yes'>
        <cfargument name='xDateIssued' type='string' required='yes'>
        <cfargument name='xDateSubmitted' type='string' required='yes'>
        <cfargument name='xDateValidEnd' type='string' required='yes'>
        <cfargument name='xDateValidStart' type='string' required='yes'>
        <cfargument name='xDatum' type='string' required='yes'>
        <cfargument name='xDocAuthor' type='string' required='yes'>
        <cfargument name='xEmailCC' type='string' required='yes'>
        <cfargument name='xEmailFrom' type='string' required='yes'>
        <cfargument name='xEmailSubject' type='string' required='yes'>
        <cfargument name='xEmailTo' type='string' required='yes'>
        <cfargument name='xFacilityID' type='string' required='yes'>
        <cfargument name='xFacilityType' type='string' required='yes'>
        <cfargument name='xFederalProjectNum' type='string' required='yes'>
        <cfargument name='xFileNumber' type='string' required='yes'>
        <cfargument name='xFileType' type='string' required='yes'>
        <cfargument name='xFormat' type='string' required='yes'>
        <cfargument name='xIsPartOf' type='string' required='yes'>
        <cfargument name='xLatitude' type='string' required='yes'>
        <cfargument name='xLegalDescription' type='string' required='yes'>
        <cfargument name='xLongitude' type='string' required='yes'>
        <cfargument name='xMilePoint' type='string' required='yes'>
        <cfargument name='xMilePost' type='string' required='yes'>
        <cfargument name='xParcelID' type='string' required='yes'>
        <cfargument name='xParcelIDType' type='string' required='yes'>
        <cfargument name='xPermitLicenseNum' type='string' required='yes'>
        <cfargument name='xPermitType' type='string' required='yes'>
        <cfargument name='xPrimaryParties' type='string' required='yes'>
        <cfargument name='xPrimaryParty1' type='string' required='yes'>
        <cfargument name='xPrimaryParty2' type='string' required='yes'>
        <cfargument name='xPrimaryParty3' type='string' required='yes'>
        <cfargument name='xPrimaryRole1' type='string' required='yes'>
        <cfargument name='xPrimaryRole2' type='string' required='yes'>
        <cfargument name='xPrimaryRole3' type='string' required='yes'>
        <cfargument name='xProfileTrigger' type='string' required='yes'>
        <cfargument name='xProjectActivityName' type='string' required='yes'>
        <cfargument name='xProjectActivityNum' type='string' required='yes'>
        <cfargument name='xProjectActivityPhase' type='string' required='yes'>
        <cfargument name='xProjectActivityType' type='string' required='yes'>
        <cfargument name='xPublicationDate' type='string' required='yes'>
        <cfargument name='xReceiveDate' type='string' required='yes'>
        <cfargument name='xReplaces' type='string' required='yes'>
        <cfargument name='xRoute' type='string' required='yes'>
        <cfargument name='xRouteType' type='string' required='yes'>
        <cfargument name='xSource' type='string' required='yes'>
        <cfargument name='xSSNSet' type='string' required='yes'>
        <cfargument name='xStateAgencySection' type='string' required='yes'>
        <cfargument name='xStateDepartment' type='string' required='yes'>
        <cfargument name='xStateID1' type='string' required='yes'>
        <cfargument name='xStateID1Type' type='string' required='yes'>
        <cfargument name='xStateID2' type='string' required='yes'>
        <cfargument name='xStateID2Type' type='string' required='yes'>
        <cfargument name='xStateID3' type='string' required='yes'>
        <cfargument name='xStateID3Type' type='string' required='yes'>
        <cfargument name='xStateID4' type='string' required='yes'>
        <cfargument name='xStateID4Type' type='string' required='yes'>
        <cfargument name='xStateID5' type='string' required='yes'>
        <cfargument name='xStateID5Type' type='string' required='yes'>
        <cfargument name='xStateRegion' type='string' required='yes'>
        <cfargument name='xSubject' type='string' required='yes'>
        <cfargument name='xSupDate1' type='string' required='yes'>
        <cfargument name='xSupDate1Type' type='string' required='yes'>
        <cfargument name='xSupDate2' type='string' required='yes'>
        <cfargument name='xSupDate2Type' type='string' required='yes'>
        <cfargument name='xSupDate3' type='string' required='yes'>
        <cfargument name='xSupDate3Type' type='string' required='yes'>
        <cfargument name='xSupDates' type='string' required='yes'>
        <cfargument name='xSupDateTypes' type='string' required='yes'>
        <cfargument name='xSupStateIDs' type='string' required='yes'>
        <cfargument name='xSupStateIDTypes' type='string' required='yes'>
        <cfargument name='xTransaction' type='string' required='yes'>

        <cfsetting requestTimeOut = "1000">

        <cfset localscope.ampersand_escaped_filename=#Replace(filePath,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_author=#Replace(author,"&","&amp;","all")#>
        <cfset localscope.ampersand_escaped_title=#Replace(title,"&","&amp;","all")#>

        <cfset localscope.primaryFilePath = GetTempDirectory() & filePath>

        <cfset returnmessage = "">
        <cfset checkinstatus = "">
        <cftry>
            <cfhttp url="http://jnuedocs-ucm.dot.state.ak.us/jnu-dot-edocs/idcplg" method="POST" username="#arguments.edocs_user#" password="#arguments.edocs_password#" multipart="yes" timeout="1000">

                <!--- The service field (could any service be called this way? --->
                <cfhttpparam type="formfield" name="IdcService" value="CHECKIN_SEL">
                <cfhttpparam type="formfield" name="isXml" value="1">

                <!--- Required fields for check in --->
                <cfhttpparam type="formfield" name="dDocType" value="#arguments.type#">
                <cfhttpparam type="formfield" name="dID" value="#arguments.did#">
                <cfhttpparam type="formfield" name="dDocAuthor" value="#localscope.ampersand_escaped_author#">
                <cfhttpparam type="formfield" name="dSecurityGroup" value="#arguments.group#">
                <cfhttpparam type="formfield" name="dDocTitle" value="#localscope.ampersand_escaped_title#">
                <cfhttpparam type="formfield" name="dDocAccount" value="#arguments.account#">
                <cfhttpparam type="formfield" name="dDocName" value="#arguments.ddocname#">
                <cfhttpparam type="formfield" name="dRevLabel" value="#arguments.drevlabel#">
                <cfhttpparam type="formfield" name="xCollectionID" value="#arguments.drevlabel#">

                <!--- Optional metadata fields --->
                <cfhttpparam type='formfield' name='xBorough' value='#arguments.xBorough#'>
                <cfhttpparam type='formfield' name='xCity' value='#arguments.xCity#'>
                <cfhttpparam type='formfield' name='xClbraAliasList' value='#arguments.xClbraAliasList#'>
                <cfhttpparam type='formfield' name='xClbraUserList' value='#arguments.xClbraUserList#'>
                <cfhttpparam type='formfield' name='xCollectionID' value='#arguments.xCollectionID#'>
                <cfhttpparam type='formfield' name='xComments' value='#arguments.xComments#'>
                <cfhttpparam type='formfield' name='xDateAccepted' value='#arguments.xDateAccepted#'>
                <cfhttpparam type='formfield' name='xDateCreated' value='#arguments.xDateCreated#'>
                <cfhttpparam type='formfield' name='xDateIssued' value='#arguments.xDateIssued#'>
                <cfhttpparam type='formfield' name='xDateSubmitted' value='#arguments.xDateSubmitted#'>
                <cfhttpparam type='formfield' name='xDateValidEnd' value='#arguments.xDateValidEnd#'>
                <cfhttpparam type='formfield' name='xDateValidStart' value='#arguments.xDateValidStart#'>
                <cfhttpparam type='formfield' name='xDatum' value='#arguments.xDatum#'>
                <cfhttpparam type='formfield' name='xDocAuthor' value='#arguments.xDocAuthor#'>
                <cfhttpparam type='formfield' name='xEmailCC' value='#arguments.xEmailCC#'>
                <cfhttpparam type='formfield' name='xEmailFrom' value='#arguments.xEmailFrom#'>
                <cfhttpparam type='formfield' name='xEmailSubject' value='#arguments.xEmailSubject#'>
                <cfhttpparam type='formfield' name='xEmailTo' value='#arguments.xEmailTo#'>
                <cfhttpparam type='formfield' name='xFacilityID' value='#arguments.xFacilityID#'>
                <cfhttpparam type='formfield' name='xFacilityType' value='#arguments.xFacilityType#'>
                <cfhttpparam type='formfield' name='xFederalProjectNum' value='#arguments.xFederalProjectNum#'>
                <cfhttpparam type='formfield' name='xFileNumber' value='#arguments.xFileNumber#'>
                <cfhttpparam type='formfield' name='xFileType' value='#arguments.xFileType#'>
                <cfhttpparam type='formfield' name='xFormat' value='#arguments.xFormat#'>
                <cfhttpparam type='formfield' name='xIsPartOf' value='#arguments.xIsPartOf#'>
                <cfhttpparam type='formfield' name='xLatitude' value='#arguments.xLatitude#'>
                <cfhttpparam type='formfield' name='xLegalDescription' value='#arguments.xLegalDescription#'>
                <cfhttpparam type='formfield' name='xLongitude' value='#arguments.xLongitude#'>
                <cfhttpparam type='formfield' name='xMilePoint' value='#arguments.xMilePoint#'>
                <cfhttpparam type='formfield' name='xMilePost' value='#arguments.xMilePost#'>
                <cfhttpparam type='formfield' name='xParcelID' value='#arguments.xParcelID#'>
                <cfhttpparam type='formfield' name='xParcelIDType' value='#arguments.xParcelIDType#'>
                <cfhttpparam type='formfield' name='xPermitLicenseNum' value='#arguments.xPermitLicenseNum#'>
                <cfhttpparam type='formfield' name='xPermitType' value='#arguments.xPermitType#'>
                <cfhttpparam type='formfield' name='xPrimaryParties' value='#arguments.xPrimaryParties#'>
                <cfhttpparam type='formfield' name='xPrimaryParty1' value='#arguments.xPrimaryParty1#'>
                <cfhttpparam type='formfield' name='xPrimaryParty2' value='#arguments.xPrimaryParty2#'>
                <cfhttpparam type='formfield' name='xPrimaryParty3' value='#arguments.xPrimaryParty3#'>
                <cfhttpparam type='formfield' name='xPrimaryRole1' value='#arguments.xPrimaryRole1#'>
                <cfhttpparam type='formfield' name='xPrimaryRole2' value='#arguments.xPrimaryRole2#'>
                <cfhttpparam type='formfield' name='xPrimaryRole3' value='#arguments.xPrimaryRole3#'>
                <cfhttpparam type='formfield' name='xProfileTrigger' value='#arguments.xProfileTrigger#'>
                <cfhttpparam type='formfield' name='xProjectActivityName' value='#arguments.xProjectActivityName#'>
                <cfhttpparam type='formfield' name='xProjectActivityNum' value='#arguments.xProjectActivityNum#'>
                <cfhttpparam type='formfield' name='xProjectActivityPhase' value='#arguments.xProjectActivityPhase#'>
                <cfhttpparam type='formfield' name='xProjectActivityType' value='#arguments.xProjectActivityType#'>
                <cfhttpparam type='formfield' name='xPublicationDate' value='#arguments.xPublicationDate#'>
                <cfhttpparam type='formfield' name='xReceiveDate' value='#arguments.xReceiveDate#'>
                <cfhttpparam type='formfield' name='xReplaces' value='#arguments.xReplaces#'>
                <cfhttpparam type='formfield' name='xRoute' value='#arguments.xRoute#'>
                <cfhttpparam type='formfield' name='xRouteType' value='#arguments.xRouteType#'>
                <cfhttpparam type='formfield' name='xSource' value='#arguments.xSource#'>
                <cfhttpparam type='formfield' name='xSSNSet' value='#arguments.xSSNSet#'>
                <cfhttpparam type='formfield' name='xStateAgencySection' value='#arguments.xStateAgencySection#'>
                <cfhttpparam type='formfield' name='xStateDepartment' value='#arguments.xStateDepartment#'>
                <cfhttpparam type='formfield' name='xStateID1' value='#arguments.xStateID1#'>
                <cfhttpparam type='formfield' name='xStateID1Type' value='#arguments.xStateID1Type#'>
                <cfhttpparam type='formfield' name='xStateID2' value='#arguments.xStateID2#'>
                <cfhttpparam type='formfield' name='xStateID2Type' value='#arguments.xStateID2Type#'>
                <cfhttpparam type='formfield' name='xStateID3' value='#arguments.xStateID3#'>
                <cfhttpparam type='formfield' name='xStateID3Type' value='#arguments.xStateID3Type#'>
                <cfhttpparam type='formfield' name='xStateID4' value='#arguments.xStateID4#'>
                <cfhttpparam type='formfield' name='xStateID4Type' value='#arguments.xStateID4Type#'>
                <cfhttpparam type='formfield' name='xStateID5' value='#arguments.xStateID5#'>
                <cfhttpparam type='formfield' name='xStateID5Type' value='#arguments.xStateID5Type#'>
                <cfhttpparam type='formfield' name='xStateRegion' value='#arguments.xStateRegion#'>
                <cfhttpparam type='formfield' name='xSubject' value='#arguments.xSubject#'>
                <cfhttpparam type='formfield' name='xSupDate1' value='#arguments.xSupDate1#'>
                <cfhttpparam type='formfield' name='xSupDate1Type' value='#arguments.xSupDate1Type#'>
                <cfhttpparam type='formfield' name='xSupDate2' value='#arguments.xSupDate2#'>
                <cfhttpparam type='formfield' name='xSupDate2Type' value='#arguments.xSupDate2Type#'>
                <cfhttpparam type='formfield' name='xSupDate3' value='#arguments.xSupDate3#'>
                <cfhttpparam type='formfield' name='xSupDate3Type' value='#arguments.xSupDate3Type#'>
                <cfhttpparam type='formfield' name='xSupDates' value='#arguments.xSupDates#'>
                <cfhttpparam type='formfield' name='xSupDateTypes' value='#arguments.xSupDateTypes#'>
                <cfhttpparam type='formfield' name='xSupStateIDs' value='#arguments.xSupStateIDs#'>
                <cfhttpparam type='formfield' name='xSupStateIDTypes' value='#arguments.xSupStateIDTypes#'>
                <cfhttpparam type='formfield' name='xTransaction' value='#arguments.xTransaction#'>

                <!--- Required primary file --->
                <cfhttpparam type="file" name="primaryFile" file="#localscope.primaryFilePath#">
            </cfhttp>


            <cfset retval=cfhttp.fileContent>


            <cfreturn retval>


            <cfif find("Content Server Request Failed",cfhttp.fileContent) neq 0>
                <cfset checkinstatus="failure">

                <cfsavecontent variable="errormessage">
                    <cfoutput>#mid(cfhttp.fileContent,find("Content Server Request Failed",cfhttp.fileContent),500)#</cfoutput>
                </cfsavecontent>

                <cfsavecontent variable="errordetailstart">
                    <cfoutput>#mid(errormessage,find("title",errormessage)+7,200)#</cfoutput>
                </cfsavecontent>

                <cfset errordetail = left(errordetailstart, find("</span>",errordetailstart)-1)>

                <cfset returnmessage="<b>eDocs Check In Failed:</b> " & #errordetail#>
            </cfif>

            <cfif find("Check In Confirmation",cfhttp.fileContent) neq 0>
                <cfset checkinstatus="success">
                <cfset returnmessage="Check In successful for <b>" & #localscope.ampersand_escaped_title# & "</b>">
            </cfif>

            <cfif checkinstatus eq "">
                <cfset returnmessage=cfhttp.FileContent>
            </cfif>

            <cfcatch type="any">
                <cfsavecontent variable="returnmessage">
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
                <cfreturn returnmessage>
            </cfcatch>
        </cftry>

        <cfreturn returnmessage>
    </cffunction>

</cfcomponent>
<!--
All steps, current status
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOW_INFO_BYNAME&dDocName=DOT-JNU_028489


All documents in given workflow
http://jnuedocs.dot.state.ak.us/jnu-dot-edocs/idcplg?IdcService=GET_WORKFLOWDOCREVISIONS&dWfName=tam_workflow

-->

