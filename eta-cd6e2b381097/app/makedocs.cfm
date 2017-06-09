<cfscript>

docPath = expandPath("./docs/cf");
try {

	if (directoryExists(docPath)) {
		DirectoryDelete(docPath, true);
	}

	colddoc = new colddoc.ColdDoc();

	strategy = new colddoc.strategy.api.HTMLAPIStrategy(docPath, "ETA");

	colddoc.setStrategy(strategy);

	paths = [
		{ inputDir = expandPath("./model/beans"), inputMapping = 'model.beans' },
		{ inputDir = expandPath("./model/dao"), inputMapping = 'model.dao' },
		{ inputDir = expandPath("./model/services"), inputMapping = 'model.services' }
	];
	colddoc.generate(paths);

	/*colddoc.generate(expandPath("/eta"), "eta");*/

	writeOutput('<h1>Done!</h1><a href="../docs/cf/">Documentation</a>');

} catch (any e) {

writeOutput('<p>Creating documentation failed: ' & e & '</p>');

}
</cfscript>
