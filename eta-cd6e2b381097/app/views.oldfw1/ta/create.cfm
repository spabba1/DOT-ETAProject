<div data-ng-controller="CreateTaFormCtrl">

<cfoutput>
	<div style="padding:6px 0;" class="row">
		<h5 class="col-xs-2">Auto-fill information: </h5>
		<div class="btn-group" role="group">
			<button class="btn btn-default" ng-click="openForYou(#session.auth.user.employeeNumber#)">For You</button>
			<button class="btn btn-default" ng-click="openForSomeone()">For Someone Else</button>
			<button class="btn btn-default" ng-click="clear()">Clear Form</button>
			<!---<button class="btn btn-default autofillForYou" id="#session.auth.user.employeeNumber#">For You</button>--->
			<!---<button class="btn btn-default autofillForSomeone">For Someone Else</button>--->
			<!---<button class="btn btn-default" id="clearTaForm">Clear Form</button>--->
		</div>
	</div>
#view("ta/taform")#
</div>
<script type="text/ng-template" id="customTemplate.html">
	<a><span bind-html-unsafe="match.label | typeaheadHighlight:query"></span></a>
</script>
<script type="text/ng-template" id="taAutofill.html">
<div class="modal-header">
		<h3 class="modal-title">Who is the TA for?</h3>
	</div>
	<div class="modal-body">
		<p>Enter the name or EIN of the traveler</p>
		<form>
			<div class="form-group">
				<label for="cn">Name:</label>
				<input type="text" data-ng-model="selectedUser" class="form-control"
						typeahead="name as name.CN for name in getNames($viewValue)"
						typeahead-loading="loadingNames"
						typeahead-min-length="2"
						typeahead-on-select="onSelect($item, $model, $label)">
				<i ng-show="loadingNames" class="glyphicon glyphicon-refresh"></i>
				<!---<input type="hidden" name="uid" id="uid">--->
				<!---<input type="hidden" name="other" id="other" value="true">--->
				<!---<input type="hidden" name="preparer" value="#session.auth.user.employeeNumber#"><]--->
				<!---<br>--->
				<small>(try their username, email address, 'lastname, firstname' etc.)</small>
				<br>
				<b ng-show="message">{{message}}</b>
			</div>
		</form>
	</div>
	<div class="modal-footer">

		<button class="btn btn-default" ng-click="autofill(selectedUser.EMPLOYEENUMBER)">Auto Fill</button>
		<button class="btn btn-default" ng-click="cancel()">Cancel</button>
</div>
</script>
</cfoutput>
