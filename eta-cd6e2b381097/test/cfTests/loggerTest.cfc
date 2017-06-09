component extends="testbox.system.BaseSpec" {

	public void function setUp() {
		this.nowStamp = now();
		this.logger = new model.services.logger();

	}

	public void function logProcessTest() {

		var taid = 999999;
		var processid = 1;
		var statusid = 1;
		var travelerid = 321333;
		var preparerid = 321333;
		var created = this.nowStamp;
		var details = "Test details";
		var loggerBean = new model.beans.logger(
				taid = taid,
				processid = processid,
				statusid = statusid,
				travelerid = travelerid,
				preparerid = preparerid,
				created = created,
				details = details
				);

		var dolog = this.logger.logProcess(loggerBean);

debug(dolog);



	}



}

