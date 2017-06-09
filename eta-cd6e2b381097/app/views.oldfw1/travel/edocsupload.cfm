<!---
Name:       edocsupload.cfm
Author:     Jeremey Hustman
Description: This creates the page that gets uploaded into eDocs.
Created:    10/01/2013
--->
<!---<cfparam name="taInfo" default="#rc.taInfo#">--->
<!---<cfparam name="fincodes" default="#rc.fincodes#">--->
<!---<cfparam name="expenseArray" default="#rc.expenseArray#">--->
<!---<cfparam name="onecardArray" default="#rc.onecardArray#">--->
<!---<cfparam name="outofstate" default="#rc.outofstate#">--->
<!---<cfparam name="trwArray" default="#rc.trwArray#">--->
<cfoutput><!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>TA #taInfo.getTaNumber()#</title>
<meta charset="utf-8">
<style>
html {
	color: rgb(34, 34, 34);
	font-family: sans-serif;
	font-size: 1em;
	line-height: 1.4;
}
body {
	margin: 0;
	font-size: 0.75em;
}
b, strong {
	font-weight: bold;
}
h1 {
  font-size: 2em;
  margin: 0.67em 0;
}
small {
  font-size: 80%;
}
img {
  border: 0;
  vertical-align: middle;
}
hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid rgb(204, 204, 204);
    margin: 1em 0;
    padding: 0;
}
fieldset {
/*  border: 1px solid rgb(192, 192, 192);
  margin: 0 2px;
  padding: 0.35em 0.625em 0.75em;
  */
	border: 0;
	margin: 0;
	padding: 0;
}
legend {
  border: 0; /* 1 */
  padding: 0; /* 2 */
}
textarea {
  overflow: auto;
  resize: vertical;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

td,
th {
  padding: 0;
}
.clear {
  clear: both;
  display: block;
  overflow: hidden;
  visibility: hidden;
  width: 0;
  height: 0;
}
.clearfix:before,
.clearfix:after {
    content: " "; /* 1 */
    display: table; /* 2 */
}

.clearfix:after {
    clear: both;
}

.soa {
	/*  font-size: 130%; */
	/*  font-weight: bold; */
	padding-top: 21px;
}
.sectionLabel {
	font-weight: bold;
	background-color: rgb(238, 232, 213);
	border-bottom: 1px solid rgb(88, 110, 117);
	border-top: 1px solid rgb(88, 110, 117);
	text-align: center;
}
.taInfoHead {
	font-weight: bold;
	background-color: rgb(238, 232, 213);
}
.blockFloat {
	display: block;
	float: left;
}
.oosInfoHead {
	/*	font-weight: bold; */
	background-color: rgb(238, 232, 213);
}
.dayTime {
display: inline-block;
width: 57px;
}
.wideInput {
width: 100%;
}
.expenseDate {
	display: block;
	width: 100px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseExplanation {
	display: block;
	width: 100px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseMeals {
	display: block;
	width: 50px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseFacility {
	display: block;
	width: 50px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseNumMiles {
	display: block;
	width: 50px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseSurfaceTrans, .expensePerDiem {
	display: block;
	width: 150px;
	float: left;
	text-align: center;
}
.expenseSurfMileage {
	display: block;
	width: 75px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseOtherTrans {
	display: block;
	width: 75px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseLodging {
	display: block;
	width: 75px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseMie {
	display: block;
	width: 75px;
	float: left;
	border-right: 1px solid rgb(102, 102, 102);
}
.expenseOther {
	display: block;
	width: 50px;
	float: left;
}
.onecard {
	font-size: 1em;
	border-left: 1px solid rgb(102, 102, 102);
}
.ocbody td, .ocbody th {
	border-right: 1px solid rgb(102, 102, 102);

}
</style>
</head>
<body>
<div class="taInfoHead blockFloat" style="width: 175px; text-align: center;">
	<h3>Travel Authorization<br>and Expense Report</h3>
</div>
<div class="blockFloat" style="margin-left:8px; width:64px;margin-right:8px;">
	<img src="img/Alaska-StateSeal.png" width="64" height="64" alt="Alaska State Seal">
</div>
<div class="blockFloat" style="width:130px;">
	<h3>State of Alaska</h3>
</div>
<div class="blockFloat" style="width:115px;">
	<div class="taInfoHead">Travel Auth No.</div>
	<span class="taPdfInfo">#taInfo.getTaNumber()#</span>
</div>
<div class="blockFloat" style="margin-left:8px;width:75px;">
	<div class="taInfoHead">Emp No.</div>
	<span class="taPdfInfo">#taInfo.getEin()#</span>
</div>
<div class="blockFloat" style="margin-left:8px;width:75px;">
	<div class="taInfoHead">PVN</div>
	<span class="taPdfInfo">#taInfo.getPvn()#</span>
</div>
<div class="clear"></div>
<div class="sectionLabel">
	<h3>Travel Authorization</h3>
</div>
<div class="clear"></div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">Name of Traveler</div>
	<span class="taPdfInfo">#taInfo.getTravelerName()#</span>
</div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">Title</div>
	<span class="taPdfInfo">#taInfo.getTitle()#</span>
</div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">Department</div>
	<span class="taPdfInfo">#taInfo.getDept()#</span>
</div>
<div class="clear"></div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">Division</div>
	<span class="taPdfInfo">#taInfo.getDiv()#</span>
</div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">BU</div>
	<span class="taPdfInfo">#taInfo.getBu()#</span>
</div>
<div class="blockFloat" style="width: 33%;">
	<div class="taInfoHead">Duty Station</div>
	<span class="taPdfInfo">#taInfo.getDutyStation()#</span>
</div>
<div class="blockFloat" style="width: 300px;">
	<div class="taInfoHead">Normal Work Schedule (DOT Only)</div>
	<div style="border-bottom: 1px solid rgb(238, 232, 213);"><span class="dayTime taInfoHead">Days:</span><span class="taPdfInfo">#taInfo.getWorkDays()#</span></div>
	<div><span class="dayTime taInfoHead">Time:</span><span class="taPdfInfo">#taInfo.getWorkTime()#</span></div>
</div>
<div class="clear"></div>
<div class="blockFloat" style="width: 100%">
	<div class="taInfoHead">Purpose of Trip</div>
	<span class="taPdfInfo">#taInfo.getPurpose()#</span>
</div>
<div class="clear"></div>
<cfif taInfo.getPhysaddr()>
<div class="blockFloat" style="width: 25%">
	<div class="taInfoHead">Physical Home Address</div>
	<span class="taPdfInfo">#taInfo.getHomeAddress()#</span>
</div>
<div class="blockFloat" style="width: 25%">
	<div class="taInfoHead">City</div>
	<span class="taPdfInfo">#taInfo.getHomeCity()#</span>
</div>
<div class="blockFloat" style="width: 25%">
	<div class="taInfoHead">State</div>
	<span class="taPdfInfo">#taInfo.getHomeState()#</span>
</div>
<div class="blockFloat" style="width: 25%">
	<div class="taInfoHead">Zip Code</div>
	<span class="taPdfInfo">#taInfo.getHomeZip()#</span>
</div>
<div class="clear"></div>
</cfif>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Total Not To Exceed</div>
	<span class="taPdfInfo">#dollarFormat(taInfo.getEstCost())#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Request Includes Personal Travel</div>
	<span class="taPdfInfo"><cfif #taInfo.getPersTrav()# EQ 1>Yes<cfelse>No</cfif></span>
</div>
<cfif #taInfo.getPersTrav()# EQ 1>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Date Begins</div>
	<span class="taPdfInfo">#taInfo.getPersTravBegin()#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Date Ends</div>
	<span class="taPdfInfo">#taInfo.getPersTravEnd()#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">State Auth Airfare</div>
	<span class="taPdfInfo">#taInfo.getStateAuthTrv()#</span>
</div>
</cfif>
<div class="clear"></div>
<div class="blockFloat" style="width: 15%">
	<div class="taInfoHead">Itinerary</div>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">From</div>
	<span class="taPdfInfo">#taInfo.getDepartureFrom()#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Departure Date</div>
	<span class="taPdfInfo">#taInfo.getDepartureDate()#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">To (Destination)</div>
	<span class="taPdfInfo">#taInfo.getDestinationTo()#</span>
</div>
<div class="blockFloat" style="width: 20%">
	<div class="taInfoHead">Return Date</div>
	<span class="taPdfInfo">#taInfo.getReturnDate()#</span>
</div>
<div class="clear"></div>

<div class="blockFloat" style="width:50%">
	<div class="taInfoHead">Financial Coding</div>
	<cfif NOT (arrayLen(fincodes) EQ 1 AND fincodes[1].getId() EQ 0)>
		<cfloop from="1" to="#arrayLen(fincodes)#" index="i">
			#fincodes[i].getCode()#<br>
		</cfloop>
	</cfif>
</div>
<div class="blockFloat" style="width:50%">
	<div class="taInfoHead">Request Includes</div>
	<div><input type="checkbox" name="actuals" id="actuals" disabled<cfif #taInfo.getActualsReq()#> checked</cfif>><label for="actuals">Actuals</label><br>
		 <input type="checkbox" name="trvadv" id="trvadv" disabled<cfif #taInfo.getTravAdv()#> checked</cfif>><label for="trvadv">Travel Advance</label>
	</div>
</div>
<div class="clear"></div>
<div class="sectionLabel">
	<h3>Expense Report</h3>
	<span style="display: block; font-size: 0.75em; font-weight: normal;">Actual Travel, Per Diem and Reimbursable Expenses (No One Card Charges)</span>
</div>
<div class="clear"></div>
<div class="expenseDate"><span>Date</span></div>
<div class="expenseExplanation"><span>Explanation</span></div>
<div class="expenseMeals"><span>Meals Prov</span></div>
<div class="expenseFacility"><span>Facility</span></div>
<div class="expenseNumMiles"><span>## of Miles</span></div>
<!---<div class="blockFloat">Surface Trans<br>--->
<div class="expenseSurfaceTrans"><span>Surface Trans<br>Mileage | Other</span></div>
<div class="expensePerDiem"><span>Per Diem<br>Lodging | M&amp;IE</span></div>
	<!---<div class="blockFloat" style="border-right: 1px solid rgb(208, 208, 208); margin-left: 0px;">Mileage</div>--->
	<!---<div class="blockFloat" style="margin: 0px;">Other</div>--->
<!---</div>--->
<!---<div class="blockFloat">Per Diem<br>--->
	<!---<div class="blockFloat" style="border-right: 1px solid rgb(208, 208, 208); margin-left: 0px;">Lodging</div>--->
	<!---<div class="blockFloat" style="margin: 0px;">M&amp;IE</div>--->
<!---</div>--->
<div class="expenseOther">Other</div>
<div class="clear"></div>
<hr>
<div class="clear"></div>
	<cfset totalMiles = 0>
	<cfset totalMiles = 0>
	<cfset totalSMiles = 0>
	<cfset totalOMiles = 0>
	<cfset totalLodging = 0>
	<cfset totalMie = 0>
	<cfset totalOther = 0>

<cfif NOT (arrayLen(expenseArray) EQ 1 AND expenseArray[1].getId() EQ 0)>
	<cfloop from="1" to="#arrayLen(expenseArray)#" index="i">

		<div class="expenseDate">
			<span>&nbsp;#expenseArray[i].getexpensedate()#</span>
		</div>
		<div class="expenseExplanation">
			<span>&nbsp;#expenseArray[i].getexplanation()#</span>
		</div>
		<div class="expenseMeals">
			<span>&nbsp;#expenseArray[i].getmeals()#</span>
		</div>
		<div class="expenseFacility">
			<span>&nbsp;#expenseArray[i].getfacility()#</span>
		</div>
		<div class="expenseNumMiles">
			<span>&nbsp;#expenseArray[i].getmiles()#</span>
		</div>
		<div class="expenseSurfMileage">
			<span>&nbsp;#dollarFormat(expenseArray[i].getsurfmileage())#</span>
		</div>
		<div class="expenseOtherTrans">
			<span>&nbsp;#dollarFormat(expenseArray[i].getothertrans())#</span>
		</div>
		<div class="expenseLodging">
			<span>&nbsp;#dollarFormat(expenseArray[i].getlodging())#</span>
		</div>
		<div class="expenseMie">
			<span>&nbsp;#dollarFormat(expenseArray[i].getmie())#</span>
		</div>
		<div class="expenseOther">
			<span>&nbsp;#dollarFormat(expenseArray[i].getother())#</span>
		</div>
		<div class="clear"></div>
		<hr>
		<cfif expenseArray[i].getmiles() NEQ ""><cfset totalMiles += expenseArray[i].getmiles()></cfif>
		<cfif expenseArray[i].getsurfmileage() NEQ ""><cfset totalSMiles += expenseArray[i].getsurfmileage()></cfif>
		<cfif expenseArray[i].getothertrans() NEQ ""><cfset totalOMiles += expenseArray[i].getothertrans()></cfif>
		<cfif expenseArray[i].getlodging() NEQ ""><cfset totalLodging += expenseArray[i].getlodging()></cfif>
		<cfif expenseArray[i].getmie() NEQ ""><cfset totalMie += expenseArray[i].getmie()></cfif>
		<cfif expenseArray[i].getother() NEQ ""><cfset totalOther += expenseArray[i].getother()></cfif>
	</cfloop>
</cfif>
<div class="clear"></div>
<div class="blockFloat" style="width:250px;height:250px;border: 1px solid rgb(0, 0, 0)">
	Claimant certifies by signing that the facts contained on this form
		and supporting documents are correct and constitute a valid claim
		against the State of Alaska.
	<span style="border-top: 1px solid rgb(0, 0, 0);display: block;margin-top: 40px;width: 50px;">Traveler Signature</span>
	<span style="border-top: 1px solid rgb(0, 0, 0);display: block;margin-top: 40px;width: 50px;">Approval Signature</span>
</div>

<div class="blockfloat"
   	style="text-align: right;
		   font-weight: bold;
		   border-bottom: 1px solid rgb(0, 0, 0);
		   border-top: 1px solid rgb(0, 0, 0);">totals:</div>

<div class="blockfloat expensenummiles"
	style="display:inline-block;
		   border-top:1px solid rgb(0, 0, 0);
		   border-bottom:1px solid rgb(0, 0, 0);
		   height: 18px;
		   text-align:center">
	<span class="topexp" id="mileagetotal">#totalMiles#</span>
</div>
<div class="blockfloat expensesurfmileage"
     style="display:inline-block;
			border-top:1px solid rgb(0, 0, 0);
		   	border-bottom:1px solid rgb(0, 0, 0);
			height: 18px;
		   	text-align:center">
	<span class="topexp" id="surfmileagetotal">#dollarformat(totalsmiles)#</span>
</div>
<div class="blockfloat expenseothertrans"
     style="border-top:1px solid rgb(0, 0, 0);
			border-bottom:1px solid rgb(0, 0, 0);height: 18px; text-align:center">
	<span class="topexp" id="surfothertotal">#dollarformat(totalomiles)#</span>
</div>
<div class="blockfloat expenselodging" style="border-top:1px solid rgb(0, 0, 0); border-bottom:1px solid rgb(0, 0, 0);height: 18px; text-align:center">
	<span class="topexp" id="lodgetotal">#dollarformat(totallodging)#</span>
</div>
<div class="blockfloat expensemie" style="border-top:1px solid rgb(0, 0, 0); border-bottom:1px solid rgb(0, 0, 0);height: 18px; text-align:center">
	<span class="topexp" id="mietotal">#dollarformat(totalmie)#</span>
</div>
<div class="blockfloat expenseother" style="border-top:1px solid rgb(0, 0, 0); border-bottom:1px solid rgb(0, 0, 0); border-right:1px solid rgb(0, 0, 0);height: 18px; text-align:center">
	<span class="topexp" id="othertotal">#dollarformat(totalother)#</span>
</div>

<cfset totalexpenses = (totalsmiles + totalomiles + totallodging + totalmie + totalother)>
<cfif tainfo.getatmwithdrawal() eq "">
	<cfset atmwithdrawal = 0>
<cfelse>
	<cfset atmwithdrawal = tainfo.getatmwithdrawal()>
</cfif>
<cfif tainfo.gettravadvwnamt() eq "">
	<cfset travadvamt = 0>
<cfelse>
	<cfset travadvamt = tainfo.gettravadvwnamt()>
</cfif>
<cfset statepaid=0>
<cfset totaltrip=0>
<cfset totaldue = totalexpenses - atmwithdrawal - travadvamt>

<table class="" style="display: block; float: right; font-size: 1em; margin-top: 25px; margin-right: 75px;">
	<tr>
		<td>
			<div class="" style=""><span>Total Out of Pocket Expenses</span></div>
		</td>
		<td>
			<div class="" style=""><span>#dollarformat(totalexpenses)#</span></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="" style=""><span>ATM Withdrawal</span></div>
		</td>
		<td>
			<div class="" style=""><span>#dollarformat(atmwithdrawal)#</span></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="" style=""><span>Travel Advance (wrnt num, amt)</span></div>
			<!---<div class="" style="border-bottom: 1px solid ##aaa;padding:3px;"><span>#tainfo.gettravadvwn()#</span><span>, #dollarformat(travadvamt)#</span></div>--->
		</td>
		<td>
			<span>&nbsp;#taInfo.getTravadvwn()#</span>
			<span>:&nbsp;#dollarFormat(travadvamt)#</span>
		</td>
	</tr>
	<tr>
		<td>
			<div class="" style=""><span>Total Due To/From Traveler</span></div>
		</td>
		<td>
			<div class="" style=""><span>#dollarFormat(totalDue)#</span></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="" style=""><span>State Paid Expenses (OCA/Direct Bill)</span></div>
		</td>
		<td>
			<div class="" style=""><span>#dollarFormat(statepaid)#</span></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="" style=""><span>Total Trip Expense</span></div>
		</td>
		<td>
			<div class="" style=""><span>#dollarFormat(totaltrip)#</span></div>
		</td>
	</tr>
</table>
<div class="clear"></div>

<table class="blockFloat" style="font-size: 1em; width:400px">
	<tr>
		<td colspan="4" style="background-color: rgb(238, 232, 213);font-size:1em;font-weight:bold;white-space:none">Traveler's Reimbursement Warrant</td>
	</tr>
	<tr>
		<th style="width:20px">FIN</th>
		<th style="width:50px">TYPE</th>
		<th style="width:75px">AMOUNT</th>
		<th style="width:75px">AKSAS ACCT</th>
	</tr>
	<cfif NOT (arrayLen(trwArray) EQ 1 AND trwArray[1].getId() EQ 0)>
		<cfloop from="1" to="#arrayLen(trwArray)#" index="i">
			<tr>
				<td style="text-align: center">#trwArray[i].getFin()#</td>
				<td style="text-align: center">#trwArray[i].getType()#</td>
				<td style="text-align: left">#dollarFormat(trwArray[i].getAmount())#</td>
				<td style="text-align: center">#trwArray[i].getAksasacct()#</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
		</cfloop>
	</cfif>
</table>


<div class="blockFloat">
	<span class="taInfoHead">AKSAS BATCH(ES)</span>
	<div class="clear"></div>

</div>

<div class="blockFloat">
	<span class="taInfoHead">Taxable Travel Reporting</span>
		<div class="clear"></div>
		<div class="blockFloat">
			<label for="taxtravtotal">Total</label>
			<span>#tainfo.getTaxTravTotal()#</span>
		</div>
		<div class="blockFloat">
			<label for="taxtravnontax">NonTax</label>
			<span>#tainfo.getTaxTravNonTax()#</span>
		</div>
		<div class="blockFloat">
			<label for="taxtravtaxable">Taxable</label>
			<span>#tainfo.getTaxTravTaxable()#</span>
		</div>
		<hr class="blockFloat" style="position: relative; top: 7px;">
		<div class="preparerSpace">
			<span class="label">Prepared By:</span>
			<span class="input">#rc.preparedBy#</span>
		</div>
		<div class="preparerSpace">
			<span class="label">Preparers Phone Number:</span>
			<span class="input">#rc.preparersPhone#</span>
		</div>
	</div> <!--- } --->


	<div class="clear"></div>

	<table class="onecard">
		<tr>
			<td colspan="8" style="background-color: rgb(238, 232, 213);font-size:1em;font-weight:bold;white-space:none">
				One Card Charges and Other State Paid Expenses
			</td>
		</tr>
		<tr class="ocbody">
			<th>Type</th>
			<th>Aksas<br>Ref ID</th>
			<th>Reference /<br>Inv Number</th>
			<th>Vendor PVN / Vendor Desc</th>
			<th>Amount</th>
			<th>Date Paid</th>
			<th>Aksas Acct</th>
			<th>Aksas Batch ##</th>
		</tr>

		<cfif NOT (arrayLen(onecardArray) EQ 1 AND onecardArray[1].getId() EQ 0)>
			<cfloop from="1" to="#arrayLen(onecardArray)#" index="i">
		<tr class="ocbody">
			<td>#UCase(onecardArray[i].gettype())#</td>
			<td>#onecardArray[i].getaksasrefid()#</td>
			<td>#onecardArray[i].getrefinvnumber()#</td>
			<td>#onecardArray[i].getvendorpvndesc()#</td>
			<td>#onecardArray[i].getamount()#</td>
			<td>#dateFormat(onecardArray[i].getdatepaid(), "mm/dd/yyyy")#</td>
			<td>#onecardArray[i].getaksasacct()#</td>
			<td>#onecardArray[i].getaksasbatchnum()#</td>
		</tr>
			</cfloop>
		</cfif>
<cfif NOT OutOfState>
	</body>
</html>
</cfif>
</cfoutput>
