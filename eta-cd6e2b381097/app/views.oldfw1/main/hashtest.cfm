<cfscript>

validChars = "abcdefghijklmnopqrstuvwxyz0123456789";

randomChars = [1];

for (i=1; i <= 6; i++) {
	randomChars[i] = mid( // extracts a substring from a string
		validChars, // string from which the substring will be extracted
		RandRange(1,Len(validChars)), // position of the first character to retrieve
		1 // the number of characters to retrieve
	);
};

randomString = ArrayToList(randomChars,"");

writeOutput(randomString);



</cfscript>
