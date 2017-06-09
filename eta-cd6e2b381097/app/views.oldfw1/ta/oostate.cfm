<cfoutput>
<!---<input type="hidden" id="hiddenconfname" name="oostate.confname" value="#rc.oostate.getConfname()#">--->
<!---<input type="hidden" id="hiddengoal" name="oostate.goal" value="#rc.oostate.getGoal()#">--->
<!---<input type="hidden" id="hiddenlocaloption" name="oostate.localoption" value="#rc.oostate.getLocalOption()#">--->
<!---<input type="hidden" id="hiddenlocaloptionreason" name="oostate.localoptionreason" value="#rc.oostate.getLocalOptionReason()#">--->
<!---<input type="hidden" id="hiddenbeneficial" name="oostate.beneficial" value="#rc.oostate.getBeneficial()#">--->
<!---<input type="hidden" id="hiddensharing" name="oostate.sharing" value="#rc.oostate.getSharing()#">--->
<!---<input type="hidden" id="hiddengroupable" name="oostate.groupable" value="#rc.oostate.getGroupable()#">--->
<!---<input type="hidden" id="hiddendebrief" name="oostate.debrief" value="#rc.oostate.getDebrief()#">--->
<!---<input type="hidden" id="hiddencomments" name="oostate.comments" value="#rc.oostate.getComments()#">--->

<div id="ooStateDialog" class="oo-state-dialog longTextarea">
    <h2 class="">Out of State Questionnaire</h2>
	<div class="form-group">
		<label for="confName">Training or Conference Name:</label>
		<!---<input class="form-control" id="confName" value="#rc.oostate.getConfname()#">--->
		<input class="form-control" data-ng-model="oos.confname" id="confName">
	</div>
	<div class="form-group">
		<label for="goal">What is your goal with this travel and how does it specifically benefit the Department in its mission?</label>
		<textarea class="form-control" rows="3" id="goal" data-ng-model="oos.goal"></textarea>
	</div>
	<div class="form-group panel panel-default">
		<strong>If the travel is for training, did you check to see if the training was coming to Alaska or a closer destination?</strong>
		<div class="radio">
			<label for="localOptionY">
				<input type="radio" name="localoption" id="localOptionY" data-ng-model="oos.localoption" data-ng-value="true" value="Y">
				Yes
			</label>
			<label for="localOptionN">
				<input type="radio" name="localoption" id="localOptionN" data-ng-model="oos.localoption" data-ng-value="false" value="N">
				No
			</label>
		</div>
		<label for="localoptionreason">Please explain:</label>
		<textarea class="form-control" rows="3" id="localoptionreason" data-ng-model="oos.localoptionreason"></textarea>
	</div>
	<div class="form-group">
		<label for="beneficial">How does this trip enhance your ability to perform your duties and help the Department in its mission?</label>
		<textarea class="form-control" rows="3" id="beneficial" data-ng-model="oos.beneficial"></textarea>
	</div>
	<div class="form-group">
		<label for="sharing">How will you disseminate the information to your supervisor or peers upon your return? Describe your plan for information sharing. (Who, when, where, how, etc.)</label>
		<textarea class="form-control" rows="3" id="sharing" data-ng-model="oos.sharing"></textarea>
	</div>
	<div class="form-group">
		<strong>Do you know if another employee in the department is attending the same training or conference?</strong>
		<div class="radio">
			<label for="groupableY">
				<input type="radio" name="groupable" value="Y" id="groupableY" data-ng-model="oos.groupable" data-ng-value="true">
				Yes, another employee is attending.
			</label>
			<label for="groupableN">
				<input type="radio" name="groupable" value="N" id="groupableN" data-ng-model="oos.groupable" data-ng-value="false">
				No, another employee is not attending
			</label>
		</div>

		<strong>If yes, did you discuss the possibility of debriefing other employees together or attending different sessions of the event to bring back more information?</strong>
		<div class="radio">
			<label for="debriefY">
				<input type="radio" name="debrief" id="debriefY" value="Y" data-ng-model="oos.debrief" data-ng-value="true">
				Yes, we have discussed it.
			</label>
			<label for="debriefN">
				<input type="radio" name="debrief" id="debriefN" value="N" data-ng-model="oos.debrief" data-ng-value="true">
				No, we have not discussed it.
			</label>
		</div>
	</div>
	<div class="form-group">
		<label for="comments">Comments:</label>
		<textarea class="form-control" rows="3" id="comments" data-ng-model="oos.comments"></textarea>
	</div>

	<div class="modal-footer">
		<button class="btn btn-default" ng-click="ok(oos)">Save/Close</button>
	</div>
</div>
</cfoutput>
