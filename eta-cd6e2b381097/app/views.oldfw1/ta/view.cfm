<cfoutput>
<input type="hidden" id="mileageRate" value="#rc.mileageRate#">
<div id="taView" class="" ng-controller="TaViewController">

	<div class="row">
		<div class="col-xs-2 taViewLabel" style="text-align: center">
		Travel Authorization<br>and Expense Report
		</div>
		<div class="col-xs-1">
			<img src="img/Alaska-StateSeal.png"width="32" height="32">
		</div>
		<div class="col-xs-3">
			<span class="soa">State of Alaska</span>
		</div>
		<div class="col-xs-2 view-border-me">
			<span class="taHead">Travel Auth No.</span><br>
			<!--- <span class="taInfo">#rc.ta.getTaNumber()#</span> --->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getTaNumber()#">
		</div>
		<div class="col-xs-2 view-border-me">
			<span class="taHead">Emp No.</span><br>
			<!--- <span class="taInfo">#rc.ta.getEin()#</span> --->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getEin()#">
		</div>
		<div class="col-xs-2 view-border-me">
			<span class="taHead">PVN</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getPvn()#</span> --->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getPvn()#">
		</div>
	</div>
    <hr>
	<div class="row">
		<div class="col-xs-12 taHeader">
			Travel Authorization
		</div>
	</div>
    <hr>
	<div class="row">
		<div class="col-xs-4 view-border-me">
			<span class="taHead">Name of Traveler</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getTravelerName()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getTravelerName()#">
		</div>
		<div class="col-xs-4 view-border-me">
			<span class="taHead">Title</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getTitle()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getTitle()#">
		</div>
		<div class="col-xs-4 view-border-me">
			<span class="taHead">Department</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getDept()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getDept()#">
		</div>
	</div>

	<div class="row">
		<div class="col-xs-3 view-border-me">
			<span class="taHead">Division</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getDiv()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getDiv()#">
		</div>
		<div class="col-xs-3 view-border-me">
			<span class="taHead">Bargaining Unit</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getBu()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getBu()#">
		</div>
		<div class="col-xs-3 view-border-me">
			<span class="taHead">Duty Station</span><br>
			<!--- <span class="taPdfInfo">#rc.ta.getDutyStation()#</span> --->
			<input class="col-xs-12" type="text" readonly="readonly" value="#rc.ta.getDutyStation()#">
		</div>
		<div class="col-xs-3 view-border-me">
			<span class="col-xs-12">Normal Work Schedule (DOT Only)</span>
	<!---   <span class="taHeadSpecific">Days:</span><span class="taHeadSpecificData">#rc.ta.getWorkDays()#</span>
			<span class="taHeadSpecific">Time:</span><span class="taHeadSpecificData">#rc.ta.getWorkTime()#</span>
	--->
			<span class="col-xs-2 taHeadSpecific">Days:</span><input class="col-xs-4" type="text" readonly="readonly" value="#rc.ta.getWorkDays()#">
			<span class="col-xs-2 taHeadSpecific">Time:</span><input class="col-xs-4" type="text" readonly="readonly" value="#rc.ta.getWorkTime()#">
		</div>
	</div>
	<cfif #rc.ta.getPhysAddr()#>
		<div class="row">
			<div class="col-xs-6 view-border-me">
				<div class="taHead">Physical Home Address</div>
				<!---<span class="taPdfInfo">#rc.ta.getHomeAddress()#</span>--->
				<input class="" type="text" readonly="readonly" value="#rc.ta.getHomeAddress()#">
			</div>
			<div class="col-xs-2 view-border-me">
				<div class="taHead">City</div>
				<!---<span class="taPdfInfo">#rc.ta.getHomeCity()#</span>--->
				<input class="" type="text" readonly="readonly" value="#rc.ta.getHomeCity()#">
			</div>
			<div class="col-xs-2 view-border-me">
				<div class="taHead">State</div>
				<!---<span class="taPdfInfo">#rc.ta.getHomeState()#</span>--->
				<input class="" type="text" readonly="readonly" value="#rc.ta.getHomeState()#">
			</div>
			<div class="col-xs-2 view-border-me">
				<div class="taHead">Zip Code</div>
				<!---<span class="taPdfInfo">#rc.ta.getHomeZip()#</span>--->
				<input class="" type="text" readonly="readonly" value="#rc.ta.getHomeZip()#">
			</div>
		</div>
	</cfif>
	<div class="row">
		<div class="col-xs-12 view-border-me">
			<div class="taHead">Purpose of Trip</div>
			<!---<span class="taPdfInfo">#rc.ta.getPurpose()#</span>--->
			<textarea class="col-xs-12" readonly="readonly">#rc.ta.getPurpose()#</textarea>
		</div>
    </div>
	<div class="row">
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Total Not To Exceed</div>
			<!---<span class="taPdfInfo">#rc.ta.getEstCost()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getEstCost()#">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Request Includes Personal Travel</div>
			<!---<span class="taPdfInfo"><cfif rc.ta.getPersTrav() EQ 1>Yes<cfelse>No</cfif></span>--->
			<input class="" type="text" readonly="readonly" value="<cfif rc.ta.getPersTrav() EQ 1>Yes<cfelse>No</cfif>">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Date Begins</div>
			<!---<span class="taPdfInfo">#dateFormat(rc.ta.getPersTravBegin(), "mm/dd/yyyy")#</span>--->
			<input class="" type="text" readonly="readonly" value="#dateFormat(rc.ta.getPersTravBegin(), "mm/dd/yyyy")#">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Date Ends</div>
			<!---<span class="taPdfInfo">#dateFormat(rc.ta.getPersTravEnd(), "mm/dd/yyyy")#</span>--->
			<input class="" type="text" readonly="readonly" value="#dateFormat(rc.ta.getPersTravEnd(), "mm/dd/yyyy")#">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">State Auth Airfare</div>
			<!---<span class="taPdfInfo">#rc.ta.getStateAuthTrv()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getStateAuthTrv()#">
		</div>
    </div>
	<div class="row">
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Itinerary</div>
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">From</div>
			<!---<span class="taPdfInfo">#rc.ta.getDepartureFrom()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getDepartureFrom()#">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Departure Date</div>
			<!---<span class="taPdfInfo">#rc.ta.getDepartureDate()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getDepartureDate()#">
			<!---<view-datepicker type="text" ng-model="ta.departureDate">--->
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">To (Destination)</div>
			<!---<span class="taPdfInfo">#rc.ta.getDestination()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getDestinationTo()#">
		</div>
		<div class="col-xs-15 view-border-me">
			<div class="taHead">Return Date</div>
			<!---<span class="taPdfInfo">#rc.ta.getReturnDate()#</span>--->
			<input class="" type="text" readonly="readonly" value="#rc.ta.getReturnDate()#">
		</div>
    </div>
	<div class="row">
		<div class="col-xs-6 view-border-me">
			<div class="taHead">Financial Coding</div>
			<cfif arrayLen(rc.fincodes) EQ 1 AND rc.fincodes[1].getId() EQ 0>
			<cfelse>
			<cfloop from="1" to="#arrayLen(rc.fincodes)#" index="i">
			#rc.fincodes[i].getCode()#<br>
			</cfloop>
			</cfif>

		</div>

		<div class="col-xs-6 view-border-me">
			<div class="taHead">Request Includes</div>
			<div><input type="checkbox"<cfif rc.ta.getActualsreq()> checked</cfif>>Actuals<br>
				<input type="checkbox"<cfif rc.ta.getTravadv()> checked</cfif>>Travel Advance
			</div>
		</div>

    </div>

	<div class="row">
		<div class="taExpenseHeader col-xs-12">
			Expense Report<span style="display: block; font-size: 50%">Actual Travel, Per Diem and Reimbursable Expenses (No One Card Charges)</span>
		</div>
	</div>
	<div class="row">
		<div class="view-expense-border-me col-xs-1"><span class="vertAlignBtm">Date</span></div>
		<div class="view-expense-border-me col-xs-2"><span class="vertAlignBtm">Explanation</span></div>
		<div class="view-expense-border-me col-xs-1"><span class="vertAlignBtm">Meals Prov</span></div>
		<div class="view-expense-border-me col-xs-1"><span class="vertAlignBtm">Facility</span></div>
		<div class="view-expense-border-me col-xs-1"><span class="vertAlignBtm">## of Miles</span></div>
		<div class="view-expense-border-me col-xs-2">Surface Trans
			<div class="row view-expense-sub">
				<div class="col-xs-6" style="border-right: 1px solid ##D0D0D0">Mileage</div>
				<div class="col-xs-6">Other</div>
			</div>
		</div>
		<div class="view-expense-border-me col-xs-2">Per Diem
			<div class="row view-expense-sub">
				<div class="col-xs-6" style="border-right: 1px solid ##D0D0D0">Lodging</div>
				<div class="col-xs-6">M&amp;IE</div>
			</div>
		</div>
		<div class="view-expense-border-me col-xs-1">Other</div>
	</div>

	<cfif arrayLen(rc.expenseArray) EQ 1 AND rc.expenseArray[1].getId() EQ 0>
	<cfelse>
		<cfloop from="1" to="#arrayLen(rc.expenseArray)#" index="i">
	<div class="row">
		<div><input readonly="readonly" class="col-xs-1" value="#rc.expenseArray[i].getexpensedate()#"></div>
		<div><textarea readonly="readonly" class="col-xs-2">#rc.expenseArray[i].getexplanation()#</textarea></div>
		<div><input readonly="readonly" class="col-xs-1" value="#rc.expenseArray[i].getmeals()#"></div>
		<div><input readonly="readonly" class="col-xs-1" value="#rc.expenseArray[i].getfacility()#"></div>
		<div><input readonly="readonly" class="col-xs-1 miles" value="#rc.expenseArray[i].getmiles()#"></div>
		<div><input readonly="readonly" class="col-xs-1 surfmileageexp" value="#rc.expenseArray[i].getsurfmileage()#"></div>
		<div><input readonly="readonly" class="col-xs-1 surfotherexp" value="#rc.expenseArray[i].getothertrans()#"></div>
		<div><input readonly="readonly" class="col-xs-1 lodgingexp" value="#rc.expenseArray[i].getlodging()#"></div>
		<div><input readonly="readonly" class="col-xs-1 mieexp" value="#rc.expenseArray[i].getmie()#"></div>
		<div><input readonly="readonly" class="col-xs-1 otherexp" value="#rc.expenseArray[i].getother()#"></div>
	</div>
		</cfloop>
	</cfif>

	<div class="row">
		<div class="col-xs-2 col-xs-offset-4" style="border:1px solid ##000; text-align:right">Totals:</div>

		<div class="col-xs-1" style="display:inline-block; border-top:1px solid ##000; border-bottom:1px solid ##000;height: 18px; text-align:center"><span class="topexp" id="surfmileagetotal"></span></div>
		<div class="col-xs-1" style="border-top:1px solid ##000; border-bottom:1px solid ##000;height: 18px; text-align:center"><span class="topexp" id="surfothertotal"></span></div>
		<div class="col-xs-1" style="border-top:1px solid ##000; border-bottom:1px solid ##000;height: 18px; text-align:center"><span class="topexp" id="lodgetotal"></span></div>
		<div class="col-xs-1" style="border-top:1px solid ##000; border-bottom:1px solid ##000;height: 18px; text-align:center"><span class="topexp" id="mietotal"></span></div>
		<div class="col-xs-1" style="border-top:1px solid ##000; border-bottom:1px solid ##000; border-right: 1px solid ##000; height: 18px; text-align:center"><span class="topexp" id="othertotal"></span></div>

	</div>

	<div class="row">
		<div class="col-xs-6">
			<p class="col-xs-9">Claimant certifies by signing that the facts
			contained on this form and supporting documents are correct and
			constitute a valid claim against the State of Alaska.
			</p>
			<p class="col-xs-10 signature-block">Traveler Signature</p>
			<p class="col-xs-10 signature-block">Expense Report Approval Signature</p>
		</div>

		<div class="col-xs-6 form-horizontal expense-block">
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label" for="totoopexp">Total out of pocket expenses</label>
				<div class="col-xs-4">
					<input class="form-control" id="totoopexp" readonly>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">ATM Withdrawal</label>
				<div class="col-xs-4">
					<input class="form-control" id="atmwithdrawal" value="#rc.ta.getatmwithdrawal()#" readonly>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">Travel Advance WN</label>
				<div class="col-xs-4">
					<input class="form-control" readonly="readonly" id="travadvwn" value="#rc.ta.gettravadvwn()#">
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">Travel Advance Amount</label>
				<div class="col-xs-4">
					<input class="form-control" readonly="readonly" id="travadvwnamt" value="#rc.ta.gettravadvwnamt()#">
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">Total Due To/From Traveler</label>
				<div class="col-xs-4">
					<input class="form-control" readonly="readonly" id="totduefromtrvlr">
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">State Paid Expenses (OCA/Direct Bill)</label>
				<div class="col-xs-4">
					<input class="form-control" readonly="readonly" id="statepaidexp">
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-xs-5 col-xs-offset-1 control-label">Total Trip Expense</label>
				<div class="col-xs-4">
					<input class="form-control" readonly="readonly" id="totalTripExpense">
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-xs-5" id="trw-table">
			<h5>Traveler's Reimbursement Warrant</h5>
			<div class="row">
				<div class="col-xs-3">FIN</div>
				<div class="col-xs-3">Type</div>
				<div class="col-xs-3">Amount</div>
				<div class="col-xs-3">Aksas Acct</div>
			</div>

			<div class="trw-body">
				<cfif #arrayLen(rc.trw)# EQ 1 AND #rc.trw[1].getId()# EQ 0>
					<cfelse>
					<cfloop from="1" to="#arrayLen(rc.trw)#" index="i">
				<div class="row">
					<div id="#rc.trw[i].getId()#" class="trw-row">
						<input type="hidden" name="trw.#rc.trw[i].getId()#.isNew" value="0">
						<input type="hidden" name="trw.#rc.trw[i].getId()#.id" value="#rc.trw[i].getId()#">
						<input class="fin col-xs-3" readonly name="trw.#rc.trw[i].getId()#.Fin" value="0">
						<select class="col-xs-3" name="trw.#rc.trw[i].getId()#.Type">
							<option value=""></option>
							<option value="AIR"<cfif #rc.trw[i].getType()# EQ 'AIR'> selected</cfif>>AIR</option>
							<option value="LODG"<cfif #rc.trw[i].getType()# EQ 'LODG'> selected</cfif>>LODG</option>
							<option value="M&IE"<cfif #rc.trw[i].getType()# EQ 'M&amp;IE'> selected</cfif>>M&amp;IE</option>
							<option value="OTHER"<cfif #rc.trw[i].getType()# EQ 'OTHER'> selected</cfif>>OTHER</option>
							<option value="REIMB"<cfif #rc.trw[i].getType()# EQ 'REIMB'> selected</cfif>>REIMB</option>
							<option value="SURF"<cfif #rc.trw[i].getType()# EQ 'SURF'> selected</cfif>>SURF</option>
						</select>
						<input class="col-xs-3" name="trw.#rc.trw[i].getId()#.Amount" value="#rc.trw[i].getAmount()#">
						<input class="trwAksasNum col-xs-3" name="trw.#rc.trw[i].getId()#.Aksasacct" value="#rc.trw[i].getAksasacct()#">
						<div class="delete ui-state-default ui-corner-all" title="delete">
							<span class="ui-icon ui-icon-circle-close"></span>
						</div>
					</div>
						</cfloop>
					</cfif>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="taExpenseHeader col-xs-12"><span style="display: block; font-size: 50%">One Card Charges and Other State Paid Expenses</span></div>
	</div>

	<div class="row">
		<div class="view-expense-border-me col-xs-1">Type</div>
		<div class="view-expense-border-me col-xs-1">Aksas Ref ID</div>
		<div class="view-expense-border-me col-xs-1">Reference / Inv Number</div>
		<div class="view-expense-border-me col-xs-1">Vendor PVN / Vendor Desc</div>
		<div class="view-expense-border-me col-xs-1">Amount</div>
		<div class="view-expense-border-me col-xs-1">Date Paid</div>
		<div class="view-expense-border-me col-xs-1">Aksas Acct</div>
		<div class="view-expense-border-me col-xs-1">Aksas Batch ##</div>
	</div>


    <cfif arrayLen(rc.onecardArray) EQ 1 AND rc.onecardArray[1].getId() EQ 0>
    <cfelse>
        <cfloop from="1" to="#arrayLen(rc.onecardArray)#" index="i">
	<div class="row">
		<div class="col-xs-1"><input readonly="readonly" class="" value="#UCase(rc.onecardArray[i].gettype())#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#rc.onecardArray[i].getaksasrefid()#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#rc.onecardArray[i].getrefinvnumber()#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#rc.onecardArray[i].getvendorpvndesc()#"></div>
		<div class="col-xs-1"><input readonly="readonly" class=" oneCardAmount" value="#rc.onecardArray[i].getamount()#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#dateFormat(rc.onecardArray[i].getdatepaid(), "mm/dd/yyyy")#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#rc.onecardArray[i].getaksasacct()#"></div>
		<div class="col-xs-1"><input readonly="readonly" class="" value="#rc.onecardArray[i].getaksasbatchnum()#"></div>
    </div>
        </cfloop>
    </cfif>
    <hr>
</div>
</cfoutput>
