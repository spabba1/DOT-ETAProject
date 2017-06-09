<!--- <cfparam name="local.ta" default="rc.ta"> --->
<!--- <cfset local.user = rc.user> --->
<cfoutput>
<!---<form novalidate class="formUI" method="post" action="#buildUrl('ta.submit')#">--->
<form name="taform" novalidate>
	<!---<input type="hidden" data-ng-model="ta" name="preparer" value="#session.auth.user.employeeNumber#">--->
	<!---<input type="hidden" data-ng-model="ta.id" name="ta.id" value="#rc.ta.getId()#">--->
	<!---<input type="hidden" data-ng-model="ta.created" name="ta.created" value="#rc.ta.getCreated()#">--->
	<!---<input type="hidden" data-ng-model="ta.updated" name="ta.updated" value="#rc.ta.getUpdated()#">--->
	<!---<input type="hidden" data-ng-model="ta.fk_userid" name="ta.fk_userid" value="#rc.ta.getFk_userid()#">--->
	<!---<input type="hidden" data-ng-model="ta.fk_preparerid" name="ta.fk_preparerid" value="#rc.ta.getFk_preparerid()#">--->
	<!---<fieldset class="reqInfo">--->
	<!---<legend class="ui-widget-header">Required Information</legend>--->

	<h3>Traveler Information</h3>
	<div class="row">
		<div class="list-group">
			<div class="list-group-item col-xs-12">
				<p class="col-xs-9">Is the traveler a State Employee (EE) or a Non-Employee (EE)?</p>
				<div class="col-xs-3">
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.ee" name="ta.ee" data-ng-value="true">
						State EE
					</label>
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.ee" name="ta.ee" data-ng-value="false">
						Non-EE
					</label>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="list-group">
			<div class="list-group-item col-xs-12">
				<p class="col-xs-9 btn-group-sm">Is this form for in-state (intra-Alaska) travel or travel outside of Alaska?
					<button data-ng-hide="ta.instate" type="button" class="btn btn-default ng-cloak" data-ng-click="open()">View Questionnaire</button>
				</p>
				<div class="col-xs-3">
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.instate" name="ta.instate" data-ng-value="true">
						In-State
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.instate" name="ta.instate" data-ng-value="false">
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
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.physaddr" name="ta.physaddr" data-ng-value="true">
						Yes
					</label>
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.physaddr" name="ta.physaddr" data-ng-value="false">
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
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.warrantaddr" name="ta.warrantaddr" data-ng-value="true">
						Yes
					</label>
					<label class="radio-inline">
						<input type="radio" data-ng-model="ta.warrantaddr" name="ta.warrantaddr" data-ng-value="false">
						No
					</label>
				</div>
			</div>
		</div>
	</div>
	<!---<fieldset class="travelerInfo">--->
	<div class="row">
		<div class="col-xs-3 form-group" data-show-errors>
			<label for="ein">Employee ID:</label>
			<input class="form-control" type="text" data-ng-model="ta.ein" name="ein" id="ein" required>
			<p class="help-block" data-ng-if="taform.ein.$error.required">Employee Number Required!</p>
		</div>
		<!---<div class="col-xs-3 form-group"--->
			<!---ng-class="{'has-error': taform.$submitted && taform.ein.$error,--->
			<!---'has-success': taform.$submitted && taform.ein.$valid}">--->
			<!---<label for="ein">Employee ID:</label>--->
			<!---<input class="form-control" type="text" data-ng-model="ta.ein" name="ein" id="ein" required>--->
			<!---<div class="alert alert-danger" ng-show="taform.$submitted && taform.ein.$error.required">Required!</div>--->
		<!---</div>--->
		<div class="col-xs-3 form-group">
			<label for="pvn">Pay Vendor Number (PVN):</label>
			<input class="form-control" data-ng-model="ta.pvn" name="ta.pvn" id="pvn">
		</div>
		<div class="col-xs-3 form-group">
			<label for="travelerName">Name of Traveler:</label>
			<input class="form-control" type="text" data-ng-model="ta.travelername" name="ta.travelername" id="travelername">
		</div>
		<div class="col-xs-3 form-group">
			<label for="empTitle">Title:</label>
			<input class="form-control" type="text" data-ng-model="ta.title" name="ta.title" id="empTitle">
		</div>
	</div>
	<div class="row">
		<div class="col-xs-3 form-group">
			<label for="dept">Department:</label>
			<input class="form-control" type="text" data-ng-model="ta.dept" name="ta.dept" id="dept">
		</div>
		<div class="col-xs-3 form-group">
			<label for="div">Division:</label>
			<input class="form-control" type="text" data-ng-model="ta.div" name="ta.div" id="div">
		</div>
		<div class="col-xs-3 form-group">
			<label for="bu">Bargaining Unit:</label>
			<input class="form-control" type="text" data-ng-model="ta.bu" name="ta.bu" id="bu" required>
		</div>
		<div class="col-xs-3 form-group">
			<label for="dutyStation">Duty Station:</label>
			<input class="form-control" type="text" data-ng-model="ta.dutyStation" name="ta.dutyStation" id="dutyStation">
		</div>
	</div>
	<div id="physAddr" class="ng-cloak" data-ng-show="ta.physaddr">
		<div class="row">
			<div class="col-xs-3">
				<label for="homeAddress">Physical Home Street Address:</label>
				<textarea class="form-control" data-ng-model="ta.homeAddress" name="ta.homeAddress" id="homeAddress"></textarea>
				<!---
					<input type="text" data-ng-model="ta.homeAddress" id="homeAddress" value="#rc.ta.getHomeAddress()#">
				--->
			</div>
			<div class="col-xs-3">
				<label for="homeCity">City:</label>
				<input class="form-control" type="text" data-ng-model="ta.homeCity" name="ta.homeCity" id="homeCity">
			</div>
			<div class="col-xs-3">
				<label for="homeState">State:</label>
				<input class="form-control" type="text" data-ng-model="ta.homeState" name="ta.homeState" id="homeState">
			</div>
			<div class="col-xs-3">
				<label for="homeZip">Zip Code:</label>
				<input class="form-control" type="text" data-ng-model="ta.homeZip" name="ta.homeZip" id="homeZip">
			</div>
		</div>
	</div>
	<!---<h3>The following personal information is required for airline booking</h3>--->
	<!---<div class="inputSpace">
	<label for="dob">Date of birth: (MM/DD/YYYY)</label>
	<input type="text" data-ng-model="ta.dob" id="dob"
		value="#dateFormat(rc.ta.getDob(), "mm/dd/yyyy")#">
</div>--->
	<!---<div class="inputSpace">
	<label for="gender">Gender:</label>
	<input type="text" data-ng-model="ta.gender" id="gender" value="#rc.ta.getGender()#">
</div>--->
	<!---<div class="inputSpace">
	<label for="fullName">Full name on ID card:</label>
	<input type="text" data-ng-model="ta.fullName" id="fullName" value="#rc.ta.getFullName()#">
</div>--->
	<!---<div class="row" data-ng-controller="DatepickerCtrl">--->
	<div class="row">
		<div class="col-xs-4 form-group">
			<label for="workDays">Normal Work Days:</label>
			<input class="form-control" type="text" data-ng-model="ta.workDays" name="ta.workDays" id="workDays">
			<label for="workTime">Normal Work Time:</label>
			<input class="form-control" type="text" data-ng-model="ta.workTime" name="ta.workTime" id="workTime">
		</div>
		<div class="col-xs-4">
			<label for="departurefrom">Departing From:</label>
			<input class="form-control" type="text" data-ng-model="ta.departurefrom" id="departurefrom">

			<label for="departuredate">Departure Date:</label>
			<div class="input-group" show-errors>
				<input type="text" class="form-control" name="departuredate"
						id="departuredate" placeholder="mm/dd/yyyy"
						data-datepicker-popup="MM/dd/yyyy"
						data-is-open="depart.opened"
						data-max-date="ta.returndate"
						data-datepicker-options="dateOptions"
						date-disabled="disabled(date, mode)"
						data-close-text="Close"
						data-ng-model="ta.departuredate"
				>
				<span class="input-group-btn">
					<button type="button" class="btn btn-default"
							data-ng-click="depart.opened = true">
						<i class="glyphicon glyphicon-calendar"></i>
					</button>
				</span>
			</div>
			<p class="help-block" data-ng-if="taform.departuredate.$error.date">Not a valid date format.</p>
		</div>
		<div class="col-xs-4">
			<label for="destinationto">To (Destination):</label>
			<input class="form-control" type="text" data-ng-model="ta.destinationto" name="ta.destinationto" id="destinationto">

			<label for="returndate">Return Date:</label>
			<div class="input-group" show-errors>
			<input type="text" class="form-control" name="returndate"
					id="returndate" placeholder="mm/dd/yyyy"
				   	data-datepicker-popup="MM/dd/yyyy"
					data-is-open="return.opened"
					data-min-date="ta.departuredate"
					data-datepicker-options="dateOptions"
					data-date-disabled="disabled(date, mode)"
					data-close-text="Close"
					data-ng-model="ta.returndate"
			>
			<span class="input-group-btn">
				<button type="button" class="btn btn-default"
						data-ng-click="return.opened = true">
					<i class="glyphicon glyphicon-calendar"></i>
				</button>
			</span>
		</div>
			<p class="help-block" data-ng-if="taform.returndate.$error.date">Not a valid date format.</p>
		</div>
	</div>
	<!---<div class="longTextarea ">
		<label for="destination">Describe what destination(s) you are traveling to, when? (please include car and hotel requirements)</label>
		<textarea data-ng-model="ta.destination" id="destination">#rc.ta.getDestination()#</textarea>
	</div>
	<div class="tripDateRange">
		<div id="tripRangeDatepicker"></div>

	</div>--->

	<div class="row">
		<div class="col-xs-12">
			<label for="purpose">What is the purpose of your trip?</label>
			<textarea class="form-control" data-ng-model="ta.purpose" name="ta.purpose" id="purpose"></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<label for="travPref">What are your flight preferences (departure times, flight numbers, seating, etc.) (Note: Fulfillments are based on availability)</label>
			<textarea class="form-control" data-ng-model="ta.travPref" name="ta.travPref" id="travPref"></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-3">
			<div class="radio">
				<p>Do you need a hotel?</p>
				<label>
					<input type="radio" data-ng-model="ta.hotelinc" name="ta.hotelinc" value="yes" id="hotelIncYes" data-ng-value="true">
					Yes
				</label>
				<label>
					<input type="radio" data-ng-model="ta.hotelinc" name="ta.hotelinc" value="no" id="hotelIncNo" data-ng-value="false">
					No
				</label>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-3">
			<div class="radio">
				<p>Do you need a rental car?</p>
				<label>
					<input type="radio" data-ng-model="ta.carinc" name="ta.carinc" value="yes" id="carIncYes" data-ng-value="true">
					Yes
				</label>
				<label>
					<input type="radio" data-ng-model="ta.carinc" name="ta.carinc" value="no" id="carIncNo" data-ng-value="false">
					No
				</label>
			</div>
		</div>
	</div>

	<!---
	<cfif structKeyExists(rc, "aeId")>
		<input type="hidden" data-ng-model="actualEvent.id" value="#rc.aeId#">
	</cfif>
	--->
	<div class="row" data-ng-controller="DeleteTaCtrl">
		<div class="btn-group col-xs-3" role="group">
			<button type="submit" class="btn btn-default" data-ng-click="submit()">Submit</button>
			<!---<button class="btn btn-default" type="submit" name="submitTa" id="submitTa">Submit</button>--->
			<!---<button class="btn btn-default" type="submit" id="submitTa" data-ng-model="ta.action" value="Submit">Submit</button>--->


			<cfif getItem() EQ "update">
				<button class="btn btn-default" type="submit" name="updateTa" id="updateTa" data-ng-model="ta.action" value="Update">Save</button>
				<!---<input class="btn btn-default" type="submit" id="updateTa" data-ng-model="ta.action.updateTa" value="Save" />--->
			<cfelse>
			<button type="submit" class="btn btn-default" data-ng-click="save()">Save</button>
				<!---<input class="btn btn-default" type="submit" id="saveTa" data-ng-model="ta.action.saveTa" value="Save" />--->
			</cfif>
			<button class="btn btn-default" data-ng-click="cancel()">Cancel</button>
			<!---<input class="btn btn-default" type="button" id="cancelTa" data-ng-model="ta.action.cancelTa" value="Cancel" />--->

		</div>
		<div class="col-xs-3">
			<span class="errors" data-ng-if="taform.$submitted && taform.$invalid">Please check for errors.</span>
		</div>
		<cfif NOT getItem() EQ "create">
			<button class="btn btn-default col-xs-1 deleteTa">Delete</button>
		</cfif>
	</div>

	<script type="text/ng-template" id="ooStateModalContent.html">
		#view('ta/oostate')#
	</script>

	<script type="text/ng-template" id="cancelDialog.html">
		<div class="modal-header">
			<h3 class="modal-title">Cancel This TA</h3>
		</div>
		<div class="modal-body">
			<b>Close this TA withough saving?</b>
		</div>
		<div class="modal-footer">
			<button class="btn btn-default" ng-click="cancelYes()">Yes, cancel it.</button>
			<button class="btn btn-default" ng-click="cancelNo()">No, Return to TA</button>
		</div>
	</script>
</form>
<!---<cfdump var="#rc#">--->
<div id='cancel-dialog' title='Cancel this TA?'>
	<p>This will close this TA without saving, are you sure?</p>
</div>
</cfoutput>
<!--- vim: set foldlevel=3: --->
