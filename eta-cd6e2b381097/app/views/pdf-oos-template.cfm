<cfoutput>
<html>
	<head></head>
	<body>
	<h2 class="oosInfoHead">Out of State Questionnaire</h2>

	<h3 class="oosInfoHead">Training or Conference Name:</h3>
	<span>#oostate.getConfname()#</span>

	<h3 class="oosInfoHead">What is your goal with this travel and how does it specifically benefit the Department in its mission?</h3>
	<span>#oostate.getGoal()#</span>

	<h3 class="oosInfoHead">If the travel is for training, did you check to see if the training was coming to Alaska or a closer destination?</h3>
	<div class="radioButtons">
		<input type="radio" name="localoption" id="localOptionY" value="Y"<cfif #oostate.getLocalOption()# EQ "Y"> checked</cfif>>
		<label for="localOptionY">Yes</label>
		<input type="radio" name="localoption" id="localOptionN" value="N"<cfif #oostate.getLocalOption()# EQ "N"> checked</cfif>>
		<label for="localOptionN">No</label>
	</div>
	<h4 class="oosInfoHead">Please explain:</h4>
	<span>#oostate.getLocalOptionReason()#</span>

	<h3 class="oosInfoHead">How does this trip enhance your ability to perform your duties and help the Department in its mission?</h3>
	<span>#oostate.getBeneficial()#</span>

	<h3 class="oosInfoHead">How will you disseminate the information to your supervisor or peers upon your return? Describe your plan for information sharing. (Who, when, where, how, etc.)</h3>
	<span>#oostate.getSharing()#</span>

	<h3 class="oosInfoHead">Do you know if another employee in the department is attending the same training or conference?</h3>
	<div class="radioButtons">
		<input type="radio" name="groupable" value="Y" id="groupableY"<cfif #oostate.getGroupable()# EQ "Y"> checked</cfif>><label for="groupableY">Yes, another employee is attending.</label>
		<input type="radio" name="groupable" value="N" id="groupableN"<cfif #oostate.getGroupable()# EQ "N"> checked</cfif>><label for="groupableN">No, another employee is not attending</label>
	</div>

	<h3 class="oosInfoHead">If yes, did you discuss the possibility of debriefing other employees together or attending different sessions of the event to bring back more information?</h3>
	<div class="radioButtons">
		<input type="radio" name="debrief" id="debriefY" value="Y"<cfif #oostate.getDebrief()# EQ "Y"> checked</cfif>><label for="debriefY">Yes, we have discussed it.</label>
		<input type="radio" name="debrief" id="debriefN" value="N"<cfif #oostate.getDebrief()# EQ "N"> checked</cfif>><label for="debriefN">No, we have not discussed it.</label>
	</div>

	<h3 class="oosInfoHead">Comments:</h3>
	<span>#oostate.getComments()#</span>
</body>
</html>
</cfoutput>

