component {

	public function configure() {
		logBox = {
			appenders = {
				etaLog = {
					class = "logbox.system.logging.appenders.DBAppender",
					properties = {
						dsn = 'etadev'
					}
				},
				errorEmailer = {
					class = "logbox.system.logging.appenders.EmailAppender",
					properties = {
						subject = "ETA Error",
						from = "noreply@alaska.gov",
						to   = "jeremey.hustman@alaska.gov"
					}
				},
				root = {
					appenders = '*'
				}
			}
		};
	}
}
