<!---
Name:       createPdf.cfm
Author:     Jeremey Hustman
Description: Generate PDF
Created:    10/01/2013
--->
<cfdocument
    name="taForApproval"
    format="pdf"
    fontembed="true"
    localUrl="true"
    >
    <cfoutput>

<!DOCTYPE html>
<head>
    <title>TA #rc.taInfo.getTaNumber()#</title>
    <link href="assets/css/normalize.css" rel="stylesheet">
    <link href="assets/css/960_24_col.css" rel="stylesheet">
    <style>
    body {
    }
    .soa {
        font-weight: bold;
        font-size: 180%;
    }
    .taInfoHead {
        font-weight: bold;
        background-color: ##EEE8D5;
        font-size: 110%;
    }
    .taPdfInfo {
        font-size: 110%;
    }
    </style>
</head>
<body class="container_24">
<div class="grid_6 taInfoHead" style="height: 64px;text-align: center;padding-top: 12px;">
    Travel Authorization<br>and Expense Report
</div>
<div class="grid_8">
    <img src="assets/img/Alaska-StateSeal.png" width="64" height="64" alt="Alaska State Seal" />
    <span class="soa">&nbsp;&nbsp;State of Alaska</span>
</div>
<div class="grid_5">
    <div class="taInfoHead">Travel Auth No.</div>
    #rc.taInfo.getTaNumber()#
</div>
<div class="grid_2">
    <div class="taInfoHead">Emp No.</div>
    #rc.taInfo.getEin()#
</div>
<div class="grid_3">
    <div class="taInfoHead">PVN</div>
    <span class="taPdfInfo">#rc.taInfo.getPvn()#</span>
</div>
<div class="clear"></div>
<div class="grid_24 taInfoHead" style="text-align: center;font-size: 150%">
    Travel Authorization
</div>
<div class="clear"><hr></div>
<div class="grid_9">
    <div class="taInfoHead">Name of Traveler</div>
    <span class="taPdfInfo">#rc.taInfo.getTravelerName()#</span>
</div>
<div class="grid_6">
    <div class="taInfoHead">Title</div>
    <span class="taPdfInfo">#rc.taInfo.getTitle()#</span>
</div>
<div class="grid_9">
    <div class="taInfoHead">Department</div>
    <span class="taPdfInfo">#rc.taInfo.getDept()#</span>
</div>
<div class="clear"></div>
<div class="grid_8">
    <div class="taInfoHead">Division</div>
    <span class="taPdfInfo">#rc.taInfo.getDiv()#</span>
</div>
<div class="grid_4">
    <div class="taInfoHead">Bargaining Unit</div>
    <span class="taPdfInfo">#rc.taInfo.getBu()#</span>
</div>
<div class="grid_4">
    <div class="taInfoHead">Duty Station</div>
    <span class="taPdfInfo">#rc.taInfo.getDutyStation()#</span>
</div>
<div class="grid_8">
    <div class="taInfoHead">Normal Work Schedule (DOT Only)</div>
    <span class="taInfoHead">Days:</span>&nbsp;#rc.taInfo.getWorkDays()#
    <span class="taInfoHead">Time:</span>&nbsp;#rc.taInfo.getWorkTime()#
</div>
<div class="clear"></div>
<div class="grid_12">
    <div class="taInfoHead">Physical Home Address</div>
    <span class="taPdfInfo">#rc.taInfo.getHomeAddress()#</span>
</div>
<div class="grid_6">
    <div class="taInfoHead">City</div>
    <span class="taPdfInfo">#rc.taInfo.getHomeCity()#</span>
</div>
<div class="grid_2">
    <div class="taInfoHead">State</div>
    <span class="taPdfInfo">#rc.taInfo.getHomeState()#</span>
</div>
<div class="grid_4">
    <div class="taInfoHead">Zip Code</div>
    <span class="taPdfInfo">#rc.taInfo.getHomeZip()#</span>
</div>
<div class="clear"></div>
<div class="grid_8">
    <div class="taInfoHead">Total Not To Exceed</div>
    <span class="taPdfInfo">#rc.taInfo.getEstCost()#</span>
</div>
<div class="grid_5">
    <div class="taInfoHead">Request Includes Personal Travel</div>
    <span class="taPdfInfo">#rc.taInfo.getPersTrav()#</span>
</div>
<div class="grid_3">
    <div class="taInfoHead">Date Begins</div>
    <span class="taPdfInfo">#rc.taInfo.getPersTravBegin()#</span>
</div>
<div class="grid_3">
    <div class="taInfoHead">Date Ends</div>
    <span class="taPdfInfo">#rc.taInfo.getPersTravEnd()#</span>
</div>
<div class="grid_5">
    <div class="taInfoHead">State Auth Airfare</div>
    <span class="taPdfInfo">#rc.taInfo.getStateAuthTrv()#</span>
</div>
<div class="clear"></div>
<div class="grid_2">
    <div class="taInfoHead">Itinerary</div>
</div>
<div class="grid_8">
    <div class="taInfoHead">From</div>
    <span class="taPdfInfo">#rc.taInfo.getDepartureFrom()#</span>
</div>
<div class="grid_3">
    <div class="taInfoHead">Departure Date</div>
    <span class="taPdfInfo">#rc.taInfo.getDepartureDate()#</span>
</div>
<div class="grid_8">
    <div class="taInfoHead">To (Destination)</div>
    <span class="taPdfInfo">#rc.taInfo.getDestination()#</span>
</div>
<div class="grid_3">
    <div class="taInfoHead">Return Date</div>
    <span class="taPdfInfo">#rc.taInfo.getReturnDate()#</span>
</div>
<div class="clear"></div>
<div class="grid_2">
    <div class="taInfoHead">Financial Coding</div>
</div>
<div class="grid_16">
    <cfloop array="#rc.fincodes#" index="fc">
    #fc.getFincode()#<br>
    </cfloop>
</div>
<div class="grid_6">
    <div class="taInfoHead">Request Includes</div>
</div>
<div class="clear"></div>
<div class="grid_24">
    <div class="taInfoHead">Purpose of Trip</div>
    <span class="taPdfInfo">#rc.taInfo.getPurpose()#</span>
</div>
</body>
</html>


	</cfoutput>
</cfdocument>


    <cfset strDocTitle = #rc.taInfo.getTaNumber()#/>
    <cfset strDocType = "Other"/>
    <cfset strDocTypeCategory = ""/>
    <cfset strDocTypeSubcategory = ""/>
    <cfset strDocAuthor = "eta"/>
    <cfset strAKSASNum = ""/>
    <cfset strProjectName = ""/>
    <cfset strFedProjectNumber = ""/>
    <cfset strDatum = ""/>
    <cfset strCity = "">
    <cfset strDepartment = "Transportation & Public Facilities">
    <cfset strAgencysection = "">
    <cfset strRegion = "">
    <cfset strBorough = "">
    <cfset strLatitude = "">
    <cfset strLongitude = "">
    <cfset strFolder = "">
    <cfset strDateCreated = ""/>
    <cfset strDateSubmitted = #Now()#>
    <cfset strType = "" />
    <cfset strIsPartOf = "" />
    <cfset strSource = "" />
    <cfset strSubject = "" />
    <cfset strFilePath = "" />
    <cfset strFileLocalPath = "" />
    <cfset strReviewUser = "#session.auth.user.uid#">
    <cfset workflowReviewer = "#rc.reviewerId#">
    <cfset loggedinuser = #session.auth.user.uid#>
    <cfset edocs_password = "#rc.edocsPassword#">
    <cfset uploadFolder = expandPath("temp")>
    <cfset uploadFile = #uploadFolder# & '/' & #rc.taInfo.getTaNumber()# & '.pdf' />

<cffile
    action="write"
    file="#uploadFile#"
    output="#taForApproval#">

    <cfinvoke
        component="services/ProjectCheckin"
        method="southeast_project_checkin_cfhttp"
        returnvariable="statusMessage">
        <cfinvokeargument name="title" value="#strDocTitle#">
        <cfinvokeargument name="type" value="#strDocType#">
        <cfinvokeargument name="typecategory" value="#strDocTypeCategory#">
        <cfinvokeargument name="typesubcategory" value="#strDocTypeSubCategory#">
        <cfinvokeargument name="collectionid" value="709">
        <cfinvokeargument name="author" value="#loggedinuser#">
        <cfinvokeargument name="documentauthor" value="#strDocAuthor#">
        <cfinvokeargument name="AKSAS" value="#strAKSASNum#">
        <cfinvokeargument name="projname" value="#strProjectName#">
        <cfinvokeargument name="fedprojectnum" value="#strFedProjectNumber#">
        <cfinvokeargument name="datum" value="#strDatum#">
        <cfinvokeargument name="statedepartment" value="#strDepartment#">
        <cfinvokeargument name="agencysection" value="#strAgencysection#">
        <cfinvokeargument name="stateregion" value="#strRegion#">
        <cfinvokeargument name="city" value="#strCity#">
        <cfinvokeargument name="borough" value="#strBorough#">
        <cfinvokeargument name="latitude" value="#strLatitude#">
        <cfinvokeargument name="longitude" value="#strLongitude#">
        <cfinvokeargument name="datecreated" value="#strDateCreated#">
        <cfinvokeargument name="datesubmitted" value="#strDateSubmitted#">
        <cfinvokeargument name="ispartof" value="#strIsPartOf#">
        <cfinvokeargument name="source" value="#strSource#">
        <cfinvokeargument name="subject" value="#strSubject#">
        <cfinvokeargument name="group" value="Projects">
        <cfinvokeargument name="workflow" value="eta_workflow">
        <cfinvokeargument name="workflow_entity1" value="#workflowReviewer#">
        <cfinvokeargument name="filePath" value="#uploadFile#">
        <cfinvokeargument name="edocs_user" value="#loggedinuser#">
        <cfinvokeargument name="edocs_password" value="#edocs_password#">
        <cfinvokeargument name="primaryFile" value="#uploadFile#">

    </cfinvoke>
        <!---<cfinvokeargument name="datecreated" value="#strDateCreated#">--->
    <br />
    <cfoutput>#statusMessage#</cfoutput>









