<cfparam name="taid" type="integer">
<cfset ta = new model.services.pdfcreate().getTaByTaid(taid)>

<cfoutput><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>TA #htmleditformat(ta.ta.getTanumber())#</title>
	<link href="../../assets/css/pdfmain.css" rel="stylesheet">
</head>
<body class="container">
<div class="row">
	<div class="col-xs-6" style="">
	   <div class="ta-info-head">
			<strong>Travel Authorization<br>and Expense Report</strong>
		</div>
	</div>
	<div class="col-xs-3 text-center">
		<img src="../../assets/images/Alaska-StateSeal.png" width="64" height="64" alt="Alaska State Seal" class='img-circle'>
	</div>
	<div class="col-xs-5" style="">
		<p class="soa">State of Alaska</p>
    </div>
	<div class="col-xs-10">&nbsp;</div>
</div>
<div class="row">
	<div class="col-xs-13">&nbsp;</div>
	<div class="col-xs-5" style="">
		<div class="ta-info-head"><strong>Travel Auth No.</strong></div>
		<!---<input value="#htmleditformat(ta.ta.getTanumber())#" class="col-xs-24">--->
		<!---<p class="pinput col-xs-24">#htmleditformat(ta.ta.getTanumber())#</p>--->
	</div>
	<div class="col-xs-3" style="">
		<div class="ta-info-head"><strong>Emp No.</strong></div>
	</div>
	<div class="col-xs-3" style="">
		<div class="ta-info-head"><strong>PVN</strong></div>
	</div>
</div>
<div class="row">
		<div class="col-xs-13">&nbsp;</div>
		<p class="col-xs-5 input">#htmleditformat(ta.ta.getTanumber())#</p>
		<p class="col-xs-3 input">#htmleditformat(ta.ta.getTravelerId())#</p>
		<p class="col-xs-3 input">#htmleditformat(ta.ta.getPvn())#</p>
</div>
<div class="row">
	<div class="col-xs-24">
	   <div class="ta-info-head" style="text-align: center;font-size: 150%">
			<strong>Travel Authorization</strong>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-9">
		<div class="ta-info-head"><strong>Name of Traveler</strong></div>
		<p class="pinput">#htmleditformat(ta.ta.getTravelername())#</p>
	</div>
	<div class="col-xs-6">
		<div class="ta-info-head"><strong>Title</strong></div>
		<p class="pinput">#htmleditformat(ta.ta.getTitle())#</p>
	</div>
	<div class="col-xs-9">
		<div class="ta-info-head"><strong>Department</strong></div>
		<p class="pinput">#htmleditformat(ta.ta.getDept())#</p>
	</div>
</div>
<div class="row">
	<div class="col-xs-7">
		<div class="ta-info-head"><strong>Division</strong></div>
	</div>
	<div class="col-xs-5">
		<div class="ta-info-head"><strong>Bargaining Unit</strong></div>
	</div>
	<div class="col-xs-4">
		<div class="ta-info-head"><strong>Duty Station</strong></div>
	</div>
	<div class="col-xs-8">
		<div class="ta-info-head"><strong>Normal Work Schedule (DOT Only)</strong></div>
	</div>
</div>
<div class="row">
		<p class="col-xs-7 pinput">#htmleditformat(ta.ta.getDiv())#</p>
		<p class="col-xs-5 pinput">#htmleditformat(ta.ta.getBu())#</p>
		<p class="col-xs-4 pinput">#htmleditformat(ta.ta.getDutystation())#</p>
		<p class="col-xs-4 input"><strong>Days:</strong>#htmleditformat(ta.ta.getWorkdays())#</p>
		<p class="col-xs-4 input"><strong>Time:</strong>#htmleditformat(ta.ta.getWorktime())#</p>
</div>
<cfif #ta.ta.getPhysAddr()#>
<div class="row">
	<div class="col-xs-24">
		<div class="ta-info-head"><strong>Physical Home Address</strong></div>
		<p class="pinput">#ta.ta.getHomeaddress()#</p>
	</div>
</div>
<div class="row">
	<div class="col-xs-8">
		<div class="ta-info-head"><strong>City</strong></div>
		<p class="pinput">#ta.ta.getHomecity()#</p>
	</div>
	<div class="col-xs-8">
		<div class="ta-info-head"><strong>State</strong></div>
		<p class="pinput">#ta.ta.getHomestate()#</p>
	</div>
	<div class="col-xs-8">
		<div class="ta-info-head"><strong>Zip Code</strong></div>
		<p class="pinput">#ta.ta.getHomezip()#</p>
	</div>
</div>
</cfif>
<div class="row">
	<div class="col-xs-6">
		<p class="ta-info-head"><strong>Total Not To Exceed</strong></p>
	</div>
	<div class="col-xs-5">
		<p class="ta-info-head"><strong>Request Includes Personal Travel</strong></p>
	</div>
	<div class="col-xs-4">
		<p class="ta-info-head"><strong>Date Begins</strong></p>
	</div>
	<div class="col-xs-4">
		<p class="ta-info-head"><strong>Date Ends</strong></p>
	</div>
	<div class="col-xs-5">
		<p class="ta-info-head"><strong>State Auth Airfare</strong></p>
	</div>
</div>
<div class="row">
	<p class="col-xs-6 pinput">#ta.ta.getEstcost()#</p>
	<p class="col-xs-5 pinput">#YesNoformat(ta.ta.getPerstrav())#</p>
	<p class="col-xs-4 pinput">#ta.ta.getPerstravbegin()#</p>
	<p class="col-xs-4 pinput">#ta.ta.getPerstravend()#</p>
	<p class="col-xs-5 pinput">#ta.ta.getStateauthtrv()#</p>
</div>
<div class="row">
	<div class="col-xs-2">
		<div class="ta-info-head"><strong>Itinerary</strong></div>
	</div>
	<div class="col-xs-6">
		<div class="ta-info-head"><strong>From</strong></div>
		<p class="pinput">#ta.ta.getDeparturefrom()#</p>
	</div>
	<div class="col-xs-4">
		<div class="ta-info-head"><strong>Departure Date</strong></div>
		<p class="pinput">#ta.ta.getDeparturedate()#</p>
	</div>
	<div class="col-xs-6">
		<div class="ta-info-head"><strong>To (Destination)</strong></div>
		<p class="pinput">#ta.ta.getDestination()#</p>
	</div>
	<div class="col-xs-4">
		<div class="ta-info-head"><strong>Return Date</strong></div>
		<p class="pinput">#ta.ta.getReturndate()#</p>
	</div>
</div>
<div class="row">
	<div class="col-xs-4">
		<div class="ta-info-head"><strong>Financial Coding</strong></div>
	</div>
	<div class="col-xs-14">
		<cfloop array="#ta.fincodes#" index="fc">
			<p class="pinput">#fc.getCode()#</p>
		</cfloop>
	</div>
	<div class="col-xs-6">
		<div class="ta-info-head"><strong>Request Includes</strong></div>
		<p>Actuals: #yesNoFormat(ta.ta.getActualsreq())#</p>
		<p>Travel Advance: #yesNoFormat(ta.ta.gettravadv())#</p>
	</div>
</div>
<div class="row">
	<div class="col-xs-24">
		<div class="ta-info-head"><strong>Purpose of Trip</strong></div>
		<p class="col-xs-24" style="border: 1px solid ##a0a0a0; min-height: 200px">#ta.ta.getPurpose()#</p>
	</div>
</div>
</body>
</html></cfoutput>
