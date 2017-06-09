<cfoutput>
	<form method='POST' action='#buildUrl("travel.submit")#' class='estimate-form'>
		<input type='hidden' id='taId' name='ta.id' value='#rc.taid#'>
		<input type='hidden' id='userId' name='userId' value='#session.auth.user.uid#'>
		<input type='hidden' id='preparer' name='ta.preparer' value='#rc.ta.getFk_preparerId()#'>
		<input type='hidden' id='fiscalyear' name='ta.fiscalyear' value='#rc.ta.getFiscalyear()#'>
		<input type='hidden' id='tanumber' name='ta.tanumber' value='#rc.ta.getTanumber()#'>
		<input type='hidden' id='created' name='ta.created' value='#rc.ta.getCreated()#'>
		<input type='hidden' id='updated' name='ta.updated' value='#rc.ta.getUpdated()#'>
		<input type='hidden' id='submitted' name='ta.submitted' value='#rc.ta.getSubmitted()#'>
		<div class="row">
			<!---<div class='etravelLogin col-xs-3'><p>E-Travel Online Login</p></div>--->
			<div class='col-xs-3'>
				<button class="etravel-login"><span>E-Travel Online Login</span></button>
			</div>
			<div class='col-xs-3 form-group'>
				<label class='control-label'>Travel Auth Number</label>
				<p class="form-control-static">#rc.ta.getTaNumber()#</p>
			</div>
			<div class='col-xs-3 form-group'>
				<label for='ein'>Employee Number</label>
				<input type='text' class="form-control" name='ta.ein' id='ein' value='#rc.ta.getEin()#'>
			</div>

			<div class='col-xs-3 form-group'>
				<label for='pvn'>PVN</label>
				<input type='text' class="form-control" name='ta.pvn' id='pvn' value='#rc.ta.getPvn()#'>
			</div>
		</div>
		<!---<fieldset class="reqInfo">--->
		<!---<fieldset class="reqInfo">--->
		<!---<legend class="ui-widget-header">Traveller Information</legend>--->
		<h3>Traveler Information</h3>
		<div class="row">
			<div class="list-group">
				<div class="list-group-item col-xs-12">
					<p class="col-xs-9">Is the traveler a State Employee (EE) or a Non-Employee (EE)?</p>
					<div class="col-xs-3">
						<label for="ee" class="radio-inline">
							<cfif NOT isDefined(#rc.ta.getEe()#) || #rc.ta.getEe()# EQ 1 ><input type="radio" name="ta.ee" id="ee" value="yes" checked>
								<cfelse><input type="radio" name="ta.ee" id="ee" value="yes">
							</cfif>
							State EE
						</label>
						<label for="nonee" class="radio-inline">
							<cfif #rc.ta.getEe()# EQ 0>
								<input type="radio" name="ta.ee" id="nonee" value="no" checked>
								<cfelse>
								<input type="radio" name="ta.ee" id="nonee" value="no">
							</cfif>
							Non-EE
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="list-group">
				<div class="list-group-item col-xs-12">
					<p class="col-xs-9">Is this form for in-state (intra-Alaska) travel or travel
					outside of Alaska? <a id="oosLink" href="##">View Questionnaire</a>
					</p>
					<div class="col-xs-3">
						<label for="instate" class="radio-inline">
							<cfif NOT isDefined(#rc.ta.getInState()#) || #rc.ta.getInState()# EQ 1>
								<input type="radio" name="ta.instate" id="instate" value="yes" checked>
								<cfelse>
								<input type="radio" name="ta.instate" id="instate" value="yes">
							</cfif>
							In-State
						</label>

						<label for="outstate" class="radio-inline">
							<cfif #rc.ta.getInState()# EQ 0>
								<input type="radio" name="ta.instate" id="outstate" value="no" checked>
								<cfelse>
								<input type="radio" name="ta.instate" id="outstate" value="no">
							</cfif>
							Out-of-State
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="list-group">
				<div class="list-group-item col-xs-12">
					<p class="col-xs-9">Does the Traveler's Physical Home Address need to be provided on the form?</p>
					<div class="col-xs-3">
						<label for="physAddrYes" class="radio-inline">
							<input type="radio" name="ta.physAddr" id="physAddrYes" value="Yes"
							<cfif NOT isDefined(#rc.ta.getPhysAddr()#) || #rc.ta.getPhysAddr()# EQ 1>
								checked</cfif>
							>
							Yes
						</label>
						<label for="physAddrNo" class="radio-inline">
							<input type="radio" name="ta.physAddr" id="physAddrNo" value="No"
							<cfif #rc.ta.getPhysAddr()# EQ 0>checked</cfif>
							>
							No
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="list-group">
				<div class="list-group-item col-xs-12">
					<p class="col-xs-9">Is the Warrant Mailing Address different than the mailing address on the Traveler's PVN record?</p>
					<div class="col-xs-3">
						<label for="warrantAddrYes" class="radio-inline">
							<input type="radio" name="ta.warrantAddr" id="warrantAddrYes" value="yes"
							<cfif #rc.ta.getWarrantAddr()# EQ 1>
								checked
							</cfif>>
							Yes
						</label>
						<label for="warrantAddrNo" class="radio-inline">
							<input type="radio" name="ta.warrantAddr" id="warrantAddrNo" value="no"
							<cfif NOT isDefined(#rc.ta.getWarrantAddr()#) || #rc.ta.getPhysAddr()# EQ 0>checked</cfif>
							>
							No
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col-xs-3 form-group'>
				<label for='travelerName'>Name of Traveler</label>
				<input class='form-control' type='text' id='travelerName'
				name='ta.travelerName' value='#rc.ta.getTravelerName()#'>
			</div>
			<div class='col-xs-3 form-group'>
				<label for='title'>Title</label>
				<input type='text' class='form-control' name='ta.title' id='title' value='#rc.ta.getTitle()#'>
			</div>
			<div class='col-xs-3 form-group'>
				<label for='dept'>Department</label>
				<input class='form-control' type='text' name='ta.dept' id='dept'	value='#rc.ta.getDept()#'>
			</div>
			<div class='col-xs-3 form-group'>
				<label for='div'>Division</label>
				<input type='text' class='form-control' name='ta.div' id='div'	value='#rc.ta.getDiv()#'>
			</div>
		</div>
		<div class="row">

			<div class='col-xs-3 form-group'>
				<label for='bu'>Bargaining Unit</label>
				<input class="form-control" type='text' name='ta.bu' id='bu' value='#rc.ta.getBu()#'>
			</div>

			<div class='col-xs-3 form-group'>
				<label for='dutyStation'>Duty Station</label>
				<input type='text' name='ta.dutyStation' id='dutyStation' class="form-control"
				value='#rc.ta.getDutyStation()#'>
			</div>

			<div class='col-xs-6 form-inline'>
				<span class=''>Normal Work Schedule (DOT Only)</span>
				<div class='form-group'>
					<label for='workDays'>Days:</label>
					<input type='text' class='form-control' name='ta.workDays' id='workDays' value='#rc.ta.getWorkDays()#'>
					<label for='workTime'>Time:</label>
					<input type='text' class='form-control' name='ta.workTime' id='workTime' value='#rc.ta.getWorkTime()#'>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-3 form-group">
				<label for="departureFrom">Departing From:</label>
				<input class="form-control" type="text" name="ta.departureFrom" id="departureFrom" value="#rc.ta.getDepartureFrom()#">
			</div>
			<div class="col-xs-3 form-group">
				<label for="departureDate">Departure Date:</label>
				<input class="form-control hasDatePicker" type="text" name="ta.departureDate" id="departureDate" value="#rc.ta.getDepartureDate()#">
			</div>
			<div class="col-xs-3 form-group">
				<label for="destinationTo">To (Destination):</label>
				<input class="form-control" type="text" name="ta.destinationTo" id="destinationTo" value="#rc.ta.getDestinationTo()#">
			</div>
			<div class="col-xs-3 form-group">
				<label for="returnDate">Return Date:</label>
				<input class="form-control hasDatePicker" type="text" name="ta.returnDate" id="returnDate" value="#rc.ta.getReturnDate()#">
			</div>
		</div>
		<div class='row'>
			<div id="physAddr">
				<div class='form-group'>
					<label for='homeAddress'>Physical Home Address</label><br>
					<input type='text' class='' name='ta.homeAddress'
					id='homeAddress' value='#rc.ta.getHomeAddress()#'>
				</div>

				<div class=' form-group'>
					<label for='homeCity'>City</label><br>
					<input type='text' class='' name='ta.homeCity' id='homeCity'
					value='#rc.ta.getHomeCity()#'>
				</div>

				<div class='form-group'>
					<label for='homeState'>State</label><br>
					<input type='text' class='' name='ta.homeState' id='homeState'
					value='#rc.ta.getHomeState()#'>
				</div>

				<div class=' form-group'>
					<label for='homeZip'>Zip Code</label><br>
					<input type='text' class='' name='ta.homeZip' id='homeZip'
					value='#rc.ta.getHomeZip()#'>
				</div>
			</div>
		</div>
		<div class='row'>

			<!---<div class='col-xs-12'>
			<label for='destination'>Destination(s):</label><br>
			<textarea class='' id='destination' name='ta.destination'>#rc.ta.getDestination()#</textarea>
		</div>--->

			<div class='col-xs-12 form-group'>
				<label for='purpose'>Purpose of trip</label><br>
				<textarea class='form-control' id='purpose' name='ta.purpose'>#rc.ta.getPurpose()#</textarea>
			</div>

			<!---<div class='col-xs-12'>
			<label for='travPref'>Travel Preferences:</label><br>
			<textarea class='' id='travPref' name='ta.travPref'>#rc.ta.getTravPref()#</textarea>
		</div>--->

		</div>
		<div class='row'>

			<div class='col-xs-3 form-group'>
				<span class=''>Request Includes Personal Travel</span><br>
				<label for='persTravYes'>
					<input type='radio' name='ta.persTrav' id='persTravYes' value='yes'
					<cfif #rc.ta.getPersTrav()# EQ 1>checked</cfif>
					>
					Yes
				</label>
				<label for='persTravNo'>
					<input type='radio' name='ta.persTrav' id='persTravNo' value='no'
					<cfif #rc.ta.getPersTrav()# EQ 0>checked</cfif>
					>
					No
				</label>
			</div>

			<div id='persTravDetails'>
				<div class='col-xs-3 form-group'>
					<label for='persTravBegin'>Date Begins</label><br>
					<input type='text' class='form-control' name='ta.persTravBegin' id='persTravBegin'
					value='#dateFormat(rc.ta.getPersTravBegin(), "mm/dd/yyyy")#'>
				</div>

				<div class='col-xs-3 form-group'>
					<label for='persTravEnd'>Date Ends</label><br>
					<input type='text' class='form-control' name='ta.persTravEnd' id='persTravEnd'
					value='#dateFormat(rc.ta.getPersTravEnd(), "mm/dd/yyyy")#'>
				</div>

				<div class='col-xs-3 form-group'>
					<label for='persTravAirfare'>State Authorized Airfare</label><br>
					<input type='text' class='form-control' name='ta.persTravAirfare' id='persTravAirfare'
					value='#rc.ta.getPersTravAirfare()#'>
				</div>
			</div>
		</div>
		<div class='row'>

			<div class="col-xs-3 financial-code-table">
				<div class="">Financial Coding</div>
				<div class="financial-code-body">
					<div class="row-master hidden">
						<input type="hidden" name="fincode.0.isNew" value="1">
						<input class="fincodedata" type="text" name="fincode.0.code">
						<div title='delete' class='delete'>
							<span class='glyphicon glyphicon-remove-circle'></span>
						</div>
					</div>
					<cfif #arrayLen(rc.fincodes)# EQ 1 AND #rc.fincodes[1].getId()# EQ 0>
						<cfelse>
						<cfloop from="1" to="#arrayLen(rc.fincodes)#" index="i">
							<div id="#rc.fincodes[i].getId()#">
								<input type="hidden" name="fincode.#rc.fincodes[i].getId()#.isNew" value="0">
								<input class="fincodedata" type="text" value="#rc.fincodes[i].getCode()#" name="fincode.#rc.fincodes[i].getId()#.code">
								<div title='delete' class='delete'>
									<span class='glyphicon glyphicon-remove-circle'></span>
								</div>
							</div>
						</cfloop>
					</cfif>
				</div>
				<div class="financial-code-footer">
					<!--- this hidden input holds a javascript array that says which
				fincode are to be deleted (if any) --->
					<input type="hidden" id="delFincode" name="delFincode.toDelete" value="">
					<button id="addFincode">Add Financial Code</button>
				</div>
			</div>



			<div class='onethirdSpace reqInc'>
				<span>Request Includes:</span>
				<label for='actualsreq'>Actuals
					<input type='checkbox' name="ta.actualsreq" id='actualsreq' value="1"
					<cfif #rc.ta.getActualsReq()# EQ 1>checked</cfif>
					>
				</label>
				<label for='travadv'>Travel Advance
					<input type='checkbox' name="ta.travadv" id='travadv' value="1"
					<cfif #rc.ta.getTravadv()# EQ 1>checked</cfif>
					>
				</label>

				<hr>

				<span>Hotel Required:</span>
				<label for='hotelNeededYes'>Yes
					<input type='radio' name='ta.hotelInc' value='yes' id='hotelNeededYes'
					<cfif #rc.ta.getHotelInc()# EQ 1>checked</cfif>
					>
				</label>
				<label for='hotelNeededNo'>No
					<input type='radio' name='ta.hotelInc' id='hotelNeededNo' value='no'
					<cfif #rc.ta.getHotelInc()# EQ 0>checked</cfif>
					>
				</label>

				<hr>

				<span>Rental Car Required:</span>
				<label for='vehicleNeededYes'>Yes
					<input type='radio' name='ta.carInc' id='vehicleNeededYes' value='yes'
					<cfif #rc.ta.getCarInc()# EQ 1>checked</cfif>
					>
				</label>
				<label for='vehicleNeededNo'>No
					<input type='radio' name='ta.carInc' id='vehicleNeededNo' value='no'
					<cfif #rc.ta.getCarInc()# EQ 0>checked</cfif>
					>
				</label>
			</div>
		</div>
		<h3>Expense Report</h3>
		<div class="row">
			<h4 class="col-xs-9">Actual Travel, Per Diem, and Reimbursable Expenses (No One Card Charges)</h4>
			<div class="col-xs-3">
				<label for='mileageRate'>Mileage Rate: </label>
				<input type='text' id='mileageRate' value='#rc.mileageRate#' />
			</div>
		</div>

		<div class="row" id="expenseTable">
			<div class="col-xs-1"><span>Date</span></div>
			<div class="col-xs-2"><span>Explanation</span></div>
			<div class="col-xs-1"><span>Meals Prov</span></div>
			<div class="col-xs-1"><span>Facility</span></div>
			<div class="col-xs-1"><span>No. of Miles</span></div>
			<div class="col-xs-2"><span style="display: block; text-align: center">Surface Trans</span>
				<div class="row">
					<div class="col-xs-6" style="border-right: 1px solid ##D0">
						Mileage
					</div>
					<div class="col-xs-6">
						Other
					</div>
				</div>
			</div>
			<div class="col-xs-2"><span style="display: block; text-align: center">Per Diem</span>
				<div class="row">
					<div class="col-xs-6" style="border-right: 1px solid ##D0">
						Lodging
					</div>
					<div class="col-xs-6">
						M&amp;IE
					</div>
				</div>
			</div>

			<div class="col-xs-1"><span>Other</span></div>
		</div>

		<div class="expense-master hidden expenseRow row">
			<input type="hidden" name="expense.0.isNew" value="1">
			<input class="col-xs-1 smaller-form-text" type="text" name="expense.0.expensedate">
			<textarea class="col-xs-2 expenseData smaller-form-text" name="expense.0.explanation"></textarea>
			<select class="col-xs-1" name="expense.0.meals">
				<option value=''>&nbsp;</option>
				<option value='B'>B</option>
				<option value='L'>L</option>
				<option value='D'>D</option>
				<option value='BL'>B/L</option>
				<option value='BD'>B/D</option>
				<option value='LD'>L/D</option>
				<option value='BLD'>B/L/D</option>
			</select>
			<select class="col-xs-1" name="expense.0.facility">
				<option value=''>&nbsp;</option>
				<option value='COMM'>COMM</option>
				<option value='FIELD'>FIELD</option>
				<option value='STATE'>STATE</option>
				<option value='NONC'>NONC</option>
			</select>
			<input class="col-xs-1 expenseData miles" type="text" name="expense.0.miles">
			<input class="col-xs-1 expenseData surfmileageexp" type="text" name="expense.0.surfMileage">
			<input class="col-xs-1 expenseData surfotherexp" type="text" name="expense.0.otherTrans">
			<input class="col-xs-1 expenseData lodgingexp" type="text" name="expense.0.lodging">
			<input class="col-xs-1 expenseData mieexp" type="text" name="expense.0.mie">
			<input class="col-xs-1 expenseData otherexp" type="text" name="expense.0.other">
			<div title="delete" class="delete">
				<span class="glyphicon glyphicon-remove-circle"></span>
			</div>
		</div>
		<div class="expenseTableBody">
			<cfif #arrayLen(rc.expenses)# EQ 1 AND #rc.expenses[1].getId()# EQ 0>
				<cfelse>
				<cfloop from='1' to='#arrayLen(rc.expenses)#' index='i'>
					<div class="row expenseRow" id='#rc.expenses[i].getid()#'>
						<input type="hidden" name="expense.#rc.expenses[i].getid()#.isNew" value="0">
						<input class='col-xs-1 smaller-form-text expenseData' value='#rc.expenses[i].getexpensedate()#' type='text' name='expense.#rc.expenses[i].getid()#.expensedate'>
						<textarea class='col-xs-2 expenseData smaller-form-text' rows='3' name='expense.#rc.expenses[i].getid()#.explanation'>#rc.expenses[i].getexplanation()#</textarea>
						<select class="col-xs-1" name='expense.#rc.expenses[i].getid()#.meals' value='#rc.expenses[i].getmeals()#'>
							<option value=''>&nbsp;</option>
							<option value='B'<cfif #rc.expenses[i].getMeals()# EQ 'B'> selected='selected'</cfif>>B</option>
							<option value='L'<cfif #rc.expenses[i].getMeals()# EQ 'L'> selected='selected'</cfif>>L</option>
							<option value='D'<cfif #rc.expenses[i].getMeals()# EQ 'D'> selected='selected'</cfif>>D</option>
							<option value='BL'<cfif #rc.expenses[i].getMeals()# EQ 'BL'> selected='selected'</cfif>>B/L</option>
							<option value='BD'<cfif #rc.expenses[i].getMeals()# EQ 'BD'> selected='selected'</cfif>>B/D</option>
							<option value='LD'<cfif #rc.expenses[i].getMeals()# EQ 'LD'> selected='selected'</cfif>>L/D</option>
							<option value='BLD'<cfif #rc.expenses[i].getMeals()# EQ 'BLD'> selected='selected'</cfif>>B/L/D</option>
						</select>
						<select class="col-xs-1" name='expense.#rc.expenses[i].getid()#.facility' value='#rc.expenses[i].getfacility()#'>
							<option value=''>&nbsp;</option>
							<option value='COMM'<cfif #rc.expenses[i].getFacility()# EQ 'COMM'> selected='selected'</cfif>>COMM</option>
							<option value='FIELD'<cfif #rc.expenses[i].getFacility()# EQ 'FIELD'> selected='selected'</cfif>>FIELD</option>
							<option value='STATE'<cfif #rc.expenses[i].getFacility()# EQ 'STATE'> selected='selected'</cfif>>STATE</option>
							<option value='NONC'<cfif #rc.expenses[i].getFacility()# EQ 'NONC'> selected='selected'</cfif>>NONC</option>
						</select>

						<input class='col-xs-1 expenseData miles' type='text' value='#rc.expenses[i].getmiles()#' name='expense.#rc.expenses[i].getid()#.miles'>
						<input class='col-xs-1 expenseData surfmileageexp' type='text' value='#decimalFormat(rc.expenses[i].getsurfmileage())#' name='expense.#rc.expenses[i].getid()#.surfMileage' readonly="readonly" />
						<input class='col-xs-1 expenseData surfotherexp' type='text' value='#decimalFormat(rc.expenses[i].getothertrans())#' name='expense.#rc.expenses[i].getid()#.otherTrans'>
						<input class='col-xs-1 expenseData lodgingexp' type='text' value='#decimalFormat(rc.expenses[i].getlodging())#' name='expense.#rc.expenses[i].getid()#.lodging'>
						<input class='col-xs-1 expenseData mieexp' type='text' value='#decimalFormat(rc.expenses[i].getmie())#' name='expense.#rc.expenses[i].getid()#.mie'>
						<input class='col-xs-1 expenseData otherexp' type='text' value='#decimalFormat(rc.expenses[i].getother())#' name='expense.#rc.expenses[i].getid()#.other'>
						<div title="delete" class="delete">
							<span class="glyphicon glyphicon-remove-circle"></span>
						</div>
					</div>
				</cfloop>
			</cfif>
			<!--- this hidden input holds a javascript array that says which expenses are to be deleted (if any) --->
			<input type="hidden" id="delExpense" name="expensedel.toDelete" value="">
		</div>

		<div class="row" id="expenseTotals">
			<div class="col-xs-4"><button id='addExpense'>Add Another Expense</button></div>
			<div class="col-xs-1">TOTALS:</div>
			<div class="col-xs-1"><span class="float-right" id='milestotal'></span></div>
			<div class="col-xs-1"><span class="float-right" id='surfmileagetotal'></span></div>
			<div class="col-xs-1"><span class="float-right" id='surfothertotal'></span></div>
			<div class="col-xs-1"><span class="float-right" id='lodgetotal'></span></div>
			<div class="col-xs-1"><span class="float-right" id='mietotal'></span></div>
			<div class="col-xs-1"><span class="float-right" id='othertotal'></span></div>
		</div>

		<div class="row">
			<div class='col-xs-4 not-exceed'>
				<label for='est-cost' class="col-sm-2 control-label">Total Not to Exceed</label> (~+20%)<br>
				<input type='text' name='ta.estCost' id='est-cost' value='#rc.ta.getEstCost()#'>
				<button class="estimate">Estimate</button>
			</div>
			<div class="col-xs-5 col-xs-offset-3 form-horizontal">
				<div class="form-group row">
					<label for='totoopexp' class="col-sm-7 control-label">Total Out Of Pocket Expenses:</label>
					<input class="col-sm-3" id='totoopexp' disabled />
				</div>
				<div class="form-group row">
					<label for='atmwithdrawal' class="col-sm-7 control-label">ATM Withdrawal:</label>
					<input class='expenseData col-sm-3' name="ta.atmwithdrawal" id='atmwithdrawal' value="#rc.ta.getAtmwithdrawal()#">
				</div>
				<div class="travadvData">
					<div class="form-group row">
						<label for="travadvwn" class="col-sm-7 control-label">Travel Advance Warrant Number:</label>
						<input class='expenseData col-sm-3' name="ta.travadvwn" id="travadvwn" value="#rc.ta.getTravadvwn()#">
					</div>
					<div class="form-group row">
						<label for="travadvwnamt" class="col-sm-7 control-label">Travel Advance Amount:</label>
						<input class='expenseData col-sm-3' name="ta.travadvwnamt" id='travadvwnamt' value="#rc.ta.getTravadvwnamt()#">
					</div>
				</div>
				<div class="form-group row">
					<label for='totduefromtrvlr' class="col-sm-7 control-label">Total Due From Traveler:</label>
					<input class="col-sm-3" id='totduefromtrvlr' disabled>
				</div>
				<div class="form-group row">
					<label for="statepaidexp" class="col-sm-7 control-label">State Paid Exp (OCA/Direct Bill):</label>
					<input class="col-sm-3" type='text' disabled id='statepaidexp'>
				</div>
				<div class="form-group row">
					<label for="totalTripExpense" class="col-sm-7 control-label">Total Trip Expense:</label>
					<input class="col-sm-3" type='text' disabled id='totalTripExpense'>
				</div>
			</div>
		</div>

		<div class="row">
			<div id="trw-table" class="col-xs-6">
				<div class="row">
					<h4>Traveler's Reimbursement Warrant</h4>
					<div class="col-xs-2">FIN</div>
					<div class="col-xs-2">Type</div>
					<div class="col-xs-2">Amount</div>
					<div class="col-xs-2">Aksas Acct</div>
				</div>
				<div class="row">

					<div id="trw-body">

						<div class="trw-master hidden">
							<input type="hidden" name="trw.0.isNew" value="1">
							<input class="col-xs-2 fin" readonly name="trw.0.Fin" value="0">
							<select class="col-xs-2" name="trw.0.Type">
								<option value=""></option>
								<option value="AIR">AIR</option>
								<option value="LODG">LODG</option>
								<option value="M&amp;IE">M&amp;IE</option>
								<option value="OTHER">OTHER</option>
								<option value="REIMB">REIMB</option>
								<option value="SURF">SURF</option>
							</select>
							<input class="col-xs-2" name="trw.0.Amount">
							<input class="trw-aksas-num col-xs-2" name="trw.0.Aksasacct">
							<div title="delete" class="delete">
								<span class="glyphicon glyphicon-remove-circle"></span>
							</div>
						</div>


						<cfif #arrayLen(rc.trw)# EQ 1 AND #rc.trw[1].getId()# EQ 0>
							<cfelse>

							<cfloop from="1" to="#arrayLen(rc.trw)#" index="i">

								<div id="#rc.trw[i].getId()#" class="trw-row">
									<input type="hidden" name="trw.#rc.trw[i].getId()#.isNew" value="0">
									<input type="hidden" name="trw.#rc.trw[i].getId()#.id" value="#rc.trw[i].getId()#">
									<input class="col-xs-1 fin" readonly name="trw.#rc.trw[i].getId()#.Fin" value="0">
									<select class="col-xs-1" name="trw.#rc.trw[i].getId()#.Type">
										<option value=""></option>
										<option value="AIR"<cfif #rc.trw[i].getType()# EQ 'AIR'> selected</cfif>>AIR</option>
										<option value="LODG"<cfif #rc.trw[i].getType()# EQ 'LODG'> selected</cfif>>LODG</option>
										<option value="M&amp;IE"<cfif #rc.trw[i].getType()# EQ 'M&amp;IE'> selected</cfif>>M&amp;IE</option>
										<option value="OTHER"<cfif #rc.trw[i].getType()# EQ 'OTHER'> selected</cfif>>OTHER</option>
										<option value="REIMB"<cfif #rc.trw[i].getType()# EQ 'REIMB'> selected</cfif>>REIMB</option>
										<option value="SURF"<cfif #rc.trw[i].getType()# EQ 'SURF'> selected</cfif>>SURF</option>
									</select>
									<input class="col-xs-1" name="trw.#rc.trw[i].getId()#.Amount" value="#rc.trw[i].getAmount()#">
									<input class="trwAksasNum col-xs-1" name="trw.#rc.trw[i].getId()#.Aksasacct" value="#rc.trw[i].getAksasacct()#">
									<div title="delete" class="delete">
										<span class="glyphicon glyphicon-remove-circle"></span>
									</div>
								</div>
							</cfloop>
						</cfif>
					</div>
				</div>

				<div class="row">
					<div class="trwFoot">
						<input type="hidden" name="delTrw.toDelete" id="delTRW" value="">
						<button id="add-trw">Add Reimbursement Warrant</button>
					</div>
				</div>

			</div>

			<div class="col-xs-6 form-horizontal">
				<h4>Taxable Travel Reporting</h4>
				<div class="form-group row">
					<label for="taxtravtotal" class="col-xs-3 control-label">Total</label>
					<input name="ta.taxtravtotal" id="taxtravtotal" class="expenseData col-xs-2" type="text" value="#rc.ta.getTaxTravTotal()#">
				</div>
				<div class="form-group row">
					<label for="taxtravnontax" class="col-xs-3 control-label">NonTax</label>
					<input name="ta.taxtravnontax" id="taxtravnontax" class="expenseData col-xs-2" type="text" value="#rc.ta.getTaxTravNonTax()#">
				</div>
				<div class="form-group row">
					<label for="taxtravtaxable" class="col-xs-3 control-label">Taxable</label>
					<input name="ta.taxtravtaxable" id="taxtravtaxable" class="expenseData col-xs-2" type="text" value="#rc.ta.getTaxTravTaxable()#">
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xs-offset-8 col-xs-4 preparer-space">
				<span class="col-xs-6">Prepared By:</span>
				<span class="col-xs-6">#rc.preparedBy#</span>
			</div>
			<div class="col-xs-offset-8 col-xs-4 preparer-space">
				<span class="col-xs-7">Preparers Phone Number:</span>
				<span class="col-xs-5">#rc.preparersPhone#</span>
			</div>
		</div>


		<div class="row">
			<h4>One Card Charges and Other State Paid Expenses</h4>
			<div id="akExpType" class="col-xs-1">Type</div>
			<div id="akExpAksasRefId" class="col-xs-1">AKSAS Ref ID</div>
			<div id="akExpInvNum" class="col-xs-2">Reference / INV Number</div>
			<div id="akExpVendor" class="col-xs-2">Vendor PVN / Vendor Desc</div>
			<div id="akExpAmount" class="col-xs-1">Amount</div>
			<div id="akExpDatePd" class="col-xs-1">Date Paid</div>
			<div id="akExpTypeAksasAcct" class="col-xs-1">AKSAS ACCT</div>
			<div id="akExpTypeAksasBatch" class="col-xs-2">AKSAS Batch ##</div>
		</div>

		<div class="state-exp-body">
			<div class='row onecardrow hidden'>
				<input type="hidden" name="onecard.0.isNew" value="1">
				<select name='onecard.0.type' class="col-xs-1">
					<option value=''>&nbsp;</option>
					<option value='AIR'>AIR</option>
					<option value='ATM'>ATM</option>
					<option value='COMM'>COMM</option>
					<option value='LODG'>LODG</option>
					<option value='OTHER'>OTHER</option>
					<option value='SURF'>SURF</option>
				</select>

				<select name='onecard.0.aksasrefid' class="col-xs-1">
					<option value=''>&nbsp;</option>
					<option value='ACC'>ACC</option>
					<option value='CAR'>CAR</option>
					<option value='CO'>CO</option>
					<option value='CUS'>CUS</option>
					<option value='DO'>DO</option>
					<option value='INV'>INV</option>
					<option value='LOD'>LOD</option>
					<option value='MCC'>MCC</option>
					<option value='TKT'>TKT</option>
					<option value='UDR'>UDR</option>
				</select>
				<input type='text' name='onecard.0.refinvnumber' class="col-xs-2">
				<input type='text' name='onecard.0.vendorpvndesc' class="col-xs-2">
				<input type='text' class='col-xs-1 oneCardAmount expenseData' name='onecard.0.amount'>
				<input class='col-xs-1 onecardexpense smaller-form-text' type='text' name='onecard.0.datepaid'>
				<input type='text' name='onecard.0.aksasacct' class="col-xs-1">
				<input type='text' name='onecard.0.aksasbatchnum' class="col-xs-2">
				<div title="delete" class="delete col-xs-1">
							<span class="glyphicon glyphicon-remove-circle"></span>
						</div>
			</div>
			<cfif #arrayLen(rc.onecard)# EQ 1 AND #rc.onecard[1].getid()# EQ 0>
				<cfelse>
				<cfloop from='1' to='#arrayLen(rc.onecard)#' index='i'>
					<div class="row state-exp-row" id='#rc.onecard[i].getid()#'>
						<input type="hidden" name="onecard.#rc.onecard[i].getid()#.isNew" value="0">
						<select class="col-xs-1" name='onecard.#rc.onecard[i].getid()#.type'>
							<option value=''>&nbsp;</option>
							<option value='AIR'<cfif #rc.onecard[i].gettype()# EQ 'AIR'> selected='selected'</cfif>>AIR</option>
							<option value='ATM'<cfif #rc.onecard[i].gettype()# EQ 'ATM'> selected='selected'</cfif>>ATM</option>
							<option value='COMM'<cfif #rc.onecard[i].gettype()# EQ 'COMM'> selected='selected'</cfif>>COMM</option>
							<option value='LODG'<cfif #rc.onecard[i].gettype()# EQ 'LODG'> selected='selected'</cfif>>LODG</option>
							<option value='OTHER'<cfif #rc.onecard[i].gettype()# EQ 'OTHER'> selected='selected'</cfif>>OTHER</option>
							<option value='SURF'<cfif #rc.onecard[i].gettype()# EQ 'SURF'> selected='selected'</cfif>>SURF</option>
						</select>

						<select class="col-xs-1" name='onecard.#rc.onecard[i].getid()#.aksasrefid'>
							<option value=''>&nbsp;</option>
							<option value='ACC'<cfif #rc.onecard[i].getAksasRefId()# EQ 'ACC'> selected='selected'</cfif>>ACC</option>
							<option value='CAR'<cfif #rc.onecard[i].getAksasRefId()# EQ 'CAR'> selected='selected'</cfif>>CAR</option>
							<option value='CO'<cfif #rc.onecard[i].getAksasRefId()# EQ 'CO'> selected='selected'</cfif>>CO</option>
							<option value='CUS'<cfif #rc.onecard[i].getAksasRefId()# EQ 'CUS'> selected='selected'</cfif>>CUS</option>
							<option value='DO'<cfif #rc.onecard[i].getAksasRefId()# EQ 'DO'> selected='selected'</cfif>>DO</option>
							<option value='INV'<cfif #rc.onecard[i].getAksasRefId()# EQ 'INV'> selected='selected'</cfif>>INV</option>
							<option value='LOD'<cfif #rc.onecard[i].getAksasRefId()# EQ 'LOD'> selected='selected'</cfif>>LOD</option>
							<option value='MCC'<cfif #rc.onecard[i].getAksasRefId()# EQ 'MCC'> selected='selected'</cfif>>MCC</option>
							<option value='TKT'<cfif #rc.onecard[i].getAksasRefId()# EQ 'TKT'> selected='selected'</cfif>>TKT</option>
							<option value='UDR'<cfif #rc.onecard[i].getAksasRefId()# EQ 'UDR'> selected='selected'</cfif>>UDR</option>
						</select>
						<input class="col-xs-2" type='text' value='#rc.onecard[i].getrefinvnumber()#' name='onecard.#rc.onecard[i].getId()#.refinvnumber'>
						<input class="col-xs-2" type='text' value='#rc.onecard[i].getvendorpvndesc()#' name='onecard.#rc.onecard[i].getId()#.vendorpvndesc'>
						<input class="col-xs-1 oneCardAmount expenseData" type='text' value='#decimalFormat(rc.onecard[i].getamount())#' name='onecard.#rc.onecard[i].getId()#.amount'>
						<input class='col-xs-1 onecardexpense smaller-form-text' value='#dateFormat(rc.onecard[i].getdatepaid(), "mm/dd/yyyy")#' type='text' name='onecard.#rc.onecard[i].getId()#.datepaid'>
						<input class="col-xs-1" type='text' value='#rc.onecard[i].getaksasacct()#' name='onecard.#rc.onecard[i].getId()#.aksasacct'>
						<input class="col-xs-2" type='text' value='#rc.onecard[i].getaksasbatchnum()#' name='onecard.#rc.onecard[i].getId()#.aksasbatchnum'>
						<div title="delete" class="delete col-xs-1">
							<span class="glyphicon glyphicon-remove-circle"></span>
						</div>

					</div>
				</cfloop>
			</cfif>
			<div>
				<!--- this hidden input holds a javascript array that says
						which onecard expenses are to be deleted (if any)
					--->
				<input type="hidden" name="delOnecard.toDelete" id="delOnecard" value="">
				<button id='addAkExpense'>Add Another Expense</button>
			</div>
		</div>

	<div class="btm-buttons row" data-ng-controller="DeleteTaCtrl">

		<input type='submit' name='action.saveEstimate' value='Save' class="btn btn-default col-xs-1">
		<input type='button' id='cancelEstimate' name='action.cancelEstimate'
		value='Cancel' class="btn btn-default col-xs-1">


		<button type="button" class="btn btn-default delete-ta col-xs-1 col-xs-offset-9" ng-click="open()">Delete</button>
	</div>

	#view('ta/oostate')#


	</form>

		<script type="text/ng-template" id="delete-confirmation.html">
			<form name="confirmDelete" class="form-group" novalidate>
				<div class="modal-header">
					<p class="modal-title"><strong>Are you sure you want to permanently delete TA #rc.ta.getTaNumber()#?</strong></p>
{{confirmDelete.todelete.taid}}
				</div>
				<div class="modal-body">
					<div class="form-group" data-ng-class="{'has-error': confirmDelete.yesDelete.$invalid}">
						<label for="yesDelete">Type DELETE in the box below:</label>
						<input type="text" data-ng-model="todelete.yesdelete" class="form-control" yes-delete required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" ng-click="cancel()">No, don't delete.</button>
					<!---<button type="button" data-ng-disabled="confirmDelete.$invalid" class="btn btn-danger" ng-click="delete(#rc.taid#)">Yes, delete forever.</button>--->
					<button type="button" class="btn btn-danger" ng-click="delete(#rc.taid#, #rc.ta.getFk_preparerId()#)">Yes, delete forever.</button>
				</div>
			</form>
		</script>

</cfoutput>
