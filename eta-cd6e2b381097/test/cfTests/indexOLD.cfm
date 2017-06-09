<cfscript>
testSuite = new mxunit.framework.TestSuite();

testSuite.addAll("loginTest");
testSuite.addAll("deleteTaTest");

results = testSuite.run();
writeOutput(results.getResultsOutput('html'));

</cfscript>

