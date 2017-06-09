<cfoutput>
	<h1>Workflow Queue</h1>
	<table id="workflowTable" class="display">
		<thead>
			<tr>
				<td>TA</td>
				<td>Traveler</td>
				<td>Date Submitted</td>
				<td>Coordinator</td>
				<td>Status</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div id="workflowPdf">
		<div id="pdfRenderer"></div>
	</div>
	<div id="rejectDialog">
		<span>Please describe why this TA is rejected, then hit 'Submit Rejection.'</span>
		<textarea id="rejectionReason" name="rejectionReason"></textarea>
	</div>
</cfoutput>
