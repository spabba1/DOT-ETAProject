<cfset rc.title = "Home" /><!--- set a variable to be used in a layout --->
<cfoutput>
<cfif session.auth.isLoggedIn>
	<div class="row text-center">
		<h3 class="">Electronic Travel Authorization (eTA)</h3>
			<a id="createTaBtn" class="btn btn-default" href="#buildUrl('ta.create')#">Create a Travel Authorization request.</a>
	</div>
	<!--- <script>var currentPage="Home";</script> --->
	<cfif session.auth.role is "User">

	<cfelseif session.auth.role is "Supervisor">
	<div class="row">
		<h3 class="col-xs-offset-1">Supervisor Menu</h3>
	</div>
	<div class="row">
		<ul>
			<li><a href="approve/index.cfm">Approve a TA</a></li>
			<!---   <li><a href="approve/review.cfm">Review Outstanding TA's</a></li>
	<li><a href="approve/byMonth.cfm">Show Travelers by Month</a></li>
	--->
		</ul>
	</div>
	<cfelseif session.auth.role is "Division Supervisor">
	<div class="row">
		<h3 class="col-xs-offset-1">Division Supervisor Menu</h3>
	</div>
	<div class="row">
		<ul>
			<li><a href="approve/index.cfm">Approve a TA</a></li>
			<!---   <li><a href="approve/review.cfm">Review Outstanding TA's</a></li>
	<li><a href="approve/byMonth.cfm">Show Travelers by Month</a></li>
	--->
		</ul>
	</div>
	</cfif>
	<div class="row text-center">
		<h3 class="">Your TA's</h3>
			<a class="btn btn-default" href="#buildUrl('ta.review')#">Review/Update your TAs</a>
	</div>
	<!--- <span>Is staff: #rc.isAdmin#</span> --->
	<cfif rc.isAdmin EQ true AND rc.staffRole EQ "Travel Planner">
		<div class="row text-center">
			<h3 class="">Travel Planner Menu</h3>
			<div class="btn-group-vertical" role="group">
				<a class="btn btn-default" href="#buildUrl('travel.default')#">Estimate/Send for Approval</a>
				<a class="btn btn-default" href="#buildUrl('workflow.default')#">Waiting for Approval</a>
				<a class="btn btn-default" href="#buildUrl('workflow.approvals')#">Approved</a>
				<a class="btn btn-default" href="#buildUrl('staff.list')#">Staff Options</a>
			</div>
		</div>
	</cfif>
	<!---<cfdump var="#rc.staffDetails#">--->
</cfif>
</cfoutput>
