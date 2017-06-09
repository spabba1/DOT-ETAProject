<cfoutput>
	<h2>You must login to use Electronic Travel Authorization.</h2>
	<h3>Use your LDAP username and password.</h3>
	<div class="row" data-ng-controller="LoginCtrl">
		<form novalidate name="login" class="form-horizontal col-sm-offset-3 col-sm-6 login" action="#buildURL('login.login')#" method="post">
			<fieldset>
				<legend>Login</legend>
				<div class="form-group" data-ng-class="{ 'has-error': login.username.$dirty && login.username.$error.required }">
					<label for="username" class="col-sm-2 control-label">Username</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" placeholder="Username" name="username" id="username" maxlength="25" data-ng-model="username" required>
						<span data-ng-show="login.username.$dirty && login.username.$error.required" class="help-block ng-cloak">Username is required</span>
					</div>
				</div>
				<div class="form-group" data-ng-class="{ 'has-error': login.password.$dirty && login.password.$error.required }">
					<label for="password" class="col-sm-2 control-label">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" placeholder="Password" name="password" id="password" data-ng-model="password" required>
						<span data-ng-show="login.password.$dirty && login.password.$error.required" class="help-block ng-cloak">Password is required</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" data-ng-disabled="login.$invalid" class="btn btn-default" id="sign-in">Sign in</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</cfoutput>
