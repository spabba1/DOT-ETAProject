<cfscript>

colddoc = createObject("component", "colddoc.ColdDoc").init();

strategy = createObject("component", "colddoc.strategy.api.HTMLAPIStrategy")
	.init(expandPath("docs/cf"), "eTA Beta");

colddoc.setStrategy(strategy);

paths = [
{
	inputDir = expandPath("framework"),inputmapping =
		"framework"
},
{
	inputDir = expandPath("controllers"),inputmapping =
		"controllers"
},
{
	inputDir = expandPath("model/beans"),inputmapping =
		"model.beans"
},
{
	inputDir = expandPath("model/services"),inputmapping =
		"model.services"
}
];
colddoc.generate(paths);

/*colddoc.generate(expandPath("/eta"), "eta");*/

</cfscript>
<h1>Done!</h1>

<a href="docs/cf/">Documentation</a>
