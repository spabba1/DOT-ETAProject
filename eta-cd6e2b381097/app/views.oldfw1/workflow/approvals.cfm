<cfoutput>
	<!---<table id="workflowApprovals" class="display">
		<thead>
			<tr>
				<td>TA</td>
				<td>Traveler</td>
				<td>Date Submitted</td>
				<td>Coordinator</td>
				<td>Approver</td>
				<td>Approval Date</td>
				<td>Approval Path</td>
			</tr>
		</thead>
	</table>--->
<div data-ng-controller="ApprovalPathCtrl">
	<h1>Approval Paths</h1>

	<table class="table table-striped table-condensed table-hover">
		<thead>
			<tr>
				<th class="tanumber" custom-sort order="'tanumber'" sort="sort">TA Number&nbsp;</th>
				<th class="traveler" custom-sort order="'traveler'" sort="sort">Traveler&nbsp;</th>
				<th class="dateSubmitted" custom-sort order="'dateSubmitted'" sort="sort">Date Submitted&nbsp;</th>
				<th class="coordinator" custom-sort order="'coordinator'" sort="sort">Coordinator&nbsp;</th>
				<th class="approver" custom-sort order="'approver'" sort="sort">Approver&nbsp;</th>
				<th class="approvalDate" custom-sort order="'approvalDate'" sort="sort">Approval Date&nbsp;</th>
				<th class="approvalPath" custom-sort order="'approvalPath'" sort="sort">Approval Path&nbsp;</th>
			</tr>
		</thead>
		<tfoot>
			<td colspan="7">
				<div class="pagination pull-right">
					<ul>
						<li data-ng-class="{disabled: currentPage == 0}">
							<a href data-ng-click="prevPage()">&laquo; Prev</a>
						</li>
						<li ng-repeat="n in range(pagedItems.length, currentPage, currentPage + gap)"
								data-ng-class="{active: n == currentPage}" data-ng-click="setPage()">
							<a href data-ng-click="nextPage()">Next &raquo;</a>
						</li>
					</ul>
				</div>
			</td>
		</tfoot>
		<!---<pre>pagedItems.length: {{pagedItems.length|json}}</pre>
		<pre>currentPage: {{currentPage|json}}</pre>
		<pre>currentPage: {{sort|json}}</pre>--->
		<tbody>
			<tr data-ng-repeat="item in pagedItems[currentPage] | orderBy:sort.sortingOrder:sort.reverse">
				<td class="ng-cloak">{{item.tanumber}}</td>
				<td class="ng-cloak">{{item.traveler}}</td>
				<td class="ng-cloak">{{item.dateSubmitted}}</td>
				<td class="ng-cloak">{{item.coordinator}}</td>
				<td class="ng-cloak">{{item.approver}}</td>
				<td class="ng-cloak">{{item.approvalDate}}</td>
				<td class="ng-cloak"><button data-ng-click="open()">View Path</button></td>
			</tr>
		</tbody>
	</table>

		<script type="text/ng-template" id="approvalPath.html">
			<div class="modal-header">
				<h3 class="modal-title">Approval Path</h3>
			</div>
			<div class="modal-body">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>Traveler</th>
							<th>Step</th>
							<th>Date</th>
							<th>Coordinator</th>
							<th>Approved</th>
							<th>Approver</th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="item in items">
							<td><span>{{item.person}}<span></td>
							<td><span>{{item.process}}<span></td>
							<td><span>{{item.created}}<span></td>
							<td><span>{{item.staff}}<span></td>
							<td><span>{{item.approved}}<span></td>
							<td><span>{{item.approver}}<span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-ng-click="ok()">OK</button>
				<!--<button class="btn btn-warning" data-ng-click="cancel()">Cancel</button>-->
			</div>
		</script>
	</div>
</cfoutput>
