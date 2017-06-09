<div data-ng-controller="StaffListCtrl">
	<h1>Staff</h1>
	<table class="table table-striped table-condensed table-hover">
		<thead>
			<tr>
				<th class="id" custom-sort order="'id'" sort="sort">Staff ID &nbsp;</th>
				<th class="first" custom-sort order="'first'" sort="sort">First Name &nbsp;</th>
				<th class="last" custom-sort order="'last'" sort="sort">Last Name &nbsp;</th>
				<th class="role" custom-sort order="'role'" sort="sort">Staff Role &nbsp;</th>
				<th class="email" custom-sort order="'email'" sort="sort">Email Notifications &nbsp;</th>
				<th class="other" custom-sort order="'other'" sort="sort">Other Details &nbsp;</th>
			</tr>
		</thead>
		<tfoot>
			<td colspan="6">
				<div class="pagination pull-right">
					<ul>
						<li data-ng-class="{disabled: currentPage == 0}">
							<a href data-ng-click="prevPage()">&laquo; Prev</a>
						</li>
						<li ng-repeat="n in range(pagedStaffers.length, currentPage, currentPage + gap)"
							data-ng-class="{active: n == currentPage}" data-ng-click="setPage()">
							<a href data-ng-click="nextPage()">Next &raquo;</a>
						<li>
					</ul>
				</div>
			</td>
		</tfoot>
		<tbody>
			<tr data-ng-repeat="staff in pagedStaffers[currentPage] | orderBy:sort.sortingOrder:sort.reverse">
				<td class="ng-cloak">{{staff.id}}</td>
				<td class="ng-cloak">{{staff.first}}</td>
				<td class="ng-cloak">{{staff.last}}</td>
				<td class="ng-cloak">{{staff.role}}</td>
				<td class="ng-cloak">{{staff.email}}</td>
				<td class="ng-cloak">{{staff.other}}</td>
			</tr>
		</tbody>
	</table>






<!---<table id="staffListDataTable" class="display">--->
<!---<thead>--->
    <!---<tr>--->
        <!---<th>Staff ID</th>--->
        <!---<th>First Name</th>--->
        <!---<th>Last Name</th>--->
        <!---<th>Staff Role</th>--->
        <!---<th>Email Notifications</th>--->
        <!---<th>Other Details</th>--->
    <!---</tr>--->
<!---</thead>--->
<!---</table>--->

<!---[> See assets/js/main.js $('#staffCn').autocomplete(); <]--->
<!---<form name="formAddNewRow" id="formAddNewRow" action="##" title="Add new staff member">--->
    <!---<input type="hidden" name="id" value="DATAROWID" rel="0">--->

    <!---<input type="hidden" id="einStaff" name="ein">--->
    <!---<input type="hidden" id="email" name="email">--->
    <!---<input type="hidden" id="firstName" name="firstName" rel="1">--->
    <!---<input type="hidden" id="lastName" name="lastName" rel="2">--->
    <!---<label for="staffCn">Name:</label>--->
    <!---<input type="text" id="staffCn" name="staffCn"><br>--->
    <!---<label for="staffRole">Staff Role:</label>--->
    <!---<select id="staffRole" name="staffRole" rel=3>--->
    <!---<cfoutput query="rc.staffRoles">--->
        <!---<option value="#id#">#description#</option>--->
    <!---</cfoutput>--->
    <!---</select><br>--->
    <!---<label for="notify">Email notification?</label>--->
        <!---<input type="radio" value="N" name="notify" rel="4">No--->
        <!---<input type="radio" value="Y" name="notify" checked rel="4">Yes<br>--->
    <!---<label for="otherDetails">Other Details:</label>--->
    <!---<textarea name="otherDetails" id="otherDetails" rel="5"></textarea>--->
<!---</form>--->
