
	<fieldset>
		<legend>Trip Information</legend>
	<div>
		<br>
		<label for="purpose">
			Purpose of trip
		</label>
		<textarea name="ta.purpose" id="purpose">
		</textarea>
	</div>
	<div>
		<label for="estimate">
			Total not to exceed
		</label>
		<input type="text" name="ta.estimate" id="estimate">
	</div>
	<div>
		Request includes personal travel:
		<label for="persTravYes">
			Yes
		</label>
		<input type="radio" name="ta.pesrTrav" id="persTravYes">
		<label for="persTravNo">
			No
		</label>
		<input type="radio" name="ta.pesrTrav" id="persTravNo">
		<label for="persTravDateBegin">
			date begins:
		</label>
		<input type="text" name="ta.persTravDateBegin" id="persTravDateBegin">
	</div>
	<div>
		<label for="persTravDateEnd">
			date ends:
		</label>
		<input type="text" id="persTravDateEnd" name="ta.persTravDateEnd">
	</div>
	<div>
		<label for="persTravStateAirfare">
			state auth airfare:
		</label>
		<input type="text" id="persTravStateAirfare" name="ta.persTravStateAirfare">
	</div>
	itinerary 
	<label for="itinFrom">
		from
	</label>
	<input type="text" name="ta.itinFrom" id="itinFrom">
	<label for="itinDepartDate">
		departure date
	</label>
	<input type="text" name="ta.itinDepartDate" id="itinDepartDate">
	<label for="itinDestination">
		to (destination)
	</label>
	<input type="text" name="ta.itinDestination" id="itinDestination">
	<label for="itinReturnDate">
		return date:
	</label>
	<input type="text" name="ta.itinReturnDate" id="itinReturnDate">
	financial coding:
	<input type="hidden" value="no" name="ta.actualsReq">
	<input type="hidden" value="no" name="ta.travAdv">
	<div> request includes <input type="checkbox" id="actualsReq" name="ta.actualsReq"><label for="actualsReq">Actual Costs</label>
	<input type="checkbox" id="travAdv" name="ta.travAdv"><label for="travAdv">Travel Advance</label></div>
	</fieldset>
