<cfoutput>

	<div data-ng-controller="ReviewAccordianCtrl">

		<accordion>

		<accordion-group heading="Your TA's in process" is-open="true">
		<div data-ng-controller="ReviewDataTableYoursCtrl as reviewYours">
			<table datatable=""
				data-dt-options="reviewYours.dtOptions"
				data-dt-columns="reviewYours.dtColumns"
				class="row-border hover">
			</table>
		</div>

		</accordion-group>
		<accordion-group heading="TA's you're preparing in process">
		<div data-ng-controller="ReviewDataTablePreparedCtrl as reviewPrepared">
			<table datatable=""
				data-dt-options="reviewPrepared.dtOptions"
				data-dt-columns="reviewPrepared.dtColumns"
				class="row-border hover">
			</table>
		</div>
		</accordion-group>

		<accordion-group heading="Completed TA's">
		<div data-ng-controller="ReviewDataTableCompletedCtrl as reviewCompleted">
			<table datatable=""
				data-dt-options="reviewCompleted.dtOptions"
				data-dt-columns="reviewCompleted.dtColumns"
				class="row-border hover">
			</table>
		</div>
		</accordion-group>
		</accordion>

	</div>

</cfoutput>
