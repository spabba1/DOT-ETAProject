<cfoutput>
#view("ta/view")#
<button class="genPdf">Send to eDocs for Approval</button>
<div class="eDocsForm">
	<form>
		<fieldset>
			<label class="dialog-label" for="reviewer">Who is the Approver?</label>
			<small>Click the name in the drop-down to activate "Send To eDocs" button.</small>
			<input type="text" name="reviewer" id="reviewer"><br>
			<input type="hidden" name="reviewerid" id="reviewerid">
			<input type="hidden" name="taid" id="taid" value="#rc.taid#">
		</fieldset>
	</form>
</div>
</cfoutput>
