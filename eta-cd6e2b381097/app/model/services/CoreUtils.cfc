component output="false" hint="A collection of helper functions to make some things easier." {

	public CoreUtils function init() {
	   return this;
	}

	/**queryToArray
	*  utility method to keep the code dry.
	*  @hint does exactly what the name says, take a query, makes it an array of stucts
	*  @hint columnLabels pass in a list of columnLabels to just return those columns
	 */
	public array function queryToArray(required query data, boolean columnLabels=false){
		var columns = listToArray(data.columnList);
        var columnName = "";

		if(columnLabels){
			columns = listToArray(columnLabels);
		}

		var queryArray = [];

		for(var rowNum = 1; rowNum <= data.recordCount; rowNum += 1){
			var row = {};
			for (var columnNum = 1; columnNum <= ArrayLen(columns); columnNum += 1){
				columnName = columns[columnNum];
				row[columnName] = data[columnName][rowNum];
			}
			arrayAppend(queryArray, row);
		}

		return queryArray;
	}

	function struct2Query(required struct astruct) {
		if (NOT isStruct(arguments.astruct)) {
            return false;
        }

		var i = {};
		var myQuery = new Query(structKeyList(arguments.astruct));

		queryAddRow(myQuery, 1);
		for (i in arguments.astruct) {
			querySetCell(myQuery, i, arguments.astruct[i]);
		};
		return myQuery;
	}

	public function soapToStruct(required xml stellentSoap) {
		var returnStruct = {};
		var cfxmlFull = XmlParse(stellentSoap);
		var arrayNodes = xmlSearch(cfxmlFull,"//*[local-name()='field' and namespace-uri()='http://www.stellent.com/IdcService/']");

		for (var i = 1; i LTE arrayLen(arrayNodes); i += 1) {
		   structInsert(returnStruct, arrayNodes[i].XmlAttributes.name, arrayNodes[i].XmlText);
		};

		return returnStruct;
	}

	public function soapToArrayNodes(required xml stellentSoap, type = "") {
		//  Strip out the tag prefixes.  This will convert tags from the
		//  form of soap:nodeName to JUST nodeName.  This works for both
		//  opening and closing tags.
		stellentSoap = stellentSoap.ReplaceAll("(</?)(\w+:)","$1");

		//  Remove all references to XML name spaces.  These are node
		//  attributes that begin with "xmlns:".
		stellentSoap = stellentSoap.ReplaceAll("xmlns(:\w+)?=""[^""]*""","");

		//  Parse the XStandard SOAP request XML into a ColdFusion XML
		//  document object.  Be sure to trim the XML so that it
		//  parses properly.
		var xmlRequest = XmlParse(stellentSoap.Trim());
		/*writeDump(xmlRequest);*/
		if (type EQ "resultset") {
			var arrNodes = xmlSearch(xmlRequest, "//resultset");
		} else if (type EQ "document") {
			var arrNodes = xmlSearch(xmlRequest, "//document");
		} else {
			var arrNodes = xmlRequest;
		}
		/*writeDump(arrNodes);*/

		return arrNodes;
	}

	/**
	 * Returns the number of seconds since January 1, 1970, 00:00:00
	 *
	 * @param DateTime      Date/time object you want converted to Epoch time.
	 * @return Returns a numeric value.
	 * @author Chris Mellon (mellan@mnr.org)
	 * @version 1, February 21, 2002
	 */
	function GetEpochTime() {
		var datetime = 0;
		if (ArrayLen(Arguments) is 0) {
			datetime = Now();
		} else {
			if (IsDate(Arguments[1])) {
				datetime = Arguments[1];
			} else {
				return NULL;
			}
		}
		return DateDiff("s", "January 1 1970 00:00", datetime);
	}

	/**
	 * Loops through a bean to see if a row is populated from the form.
	 * @param struct estimateBean Beans come from the form rows on travel.estimate
	 * @param numeric numStruct The number of elements in the bean.
	 * @param numeric thisKeyLength The number of characters in the struct element.
	 * @return Returns true if bean is empty.
	 */
	public boolean function checkEmptyBean(required struct estimateBean) {
		var isEmpty = false;
		var numStruct = structCount(estimateBean);
		var thisKeyLength = 0;
		for (key in estimateBean) {
			thisKeyLength = 0;
			if (NOT (key EQ "ISNEW" OR key EQ "FIN")) {
				thisKeyLength = len(trim(estimateBean[key]));
				if (NOT thisKeyLength) {
					isEmpty = true;
				} else {
					return false;
				};
			};
		};
		return isEmpty;
	}

	public function taidFromRowid(required string rowid) {
var getId = new Query();
            getId.setSQL("
                    select id from TA
                    where rowid = :ROWID
                    ");
            getId.addParam(name='ROWID', value='#arguments.rowid#', cfsqltype="CF_SQL_VARCHAR");
            var result = getId.execute().getResult();
		return result.id;
	}

	public function randomString(numeric chars = 6) {
		var validChars = "abcdefghijklmnopqrstuvwxyz0123456789";

		var randomChars = [1];

		for (var i=1; i <= chars; i++) {
			randomChars[i] = mid( // extracts a substring from a string
					validChars, // string from which the substring will be extracted
					RandRange(1,Len(validChars)), // position of the first character to retrieve
					1 // the number of characters to retrieve
					);
		};

		var randomString = ArrayToList(randomChars,"");

		return randomString;
	}

    public string function getRealSql(required any qryResult) {
		try {
        var realSQL = qryResult.getSql();
		writeoutput(realSQL);
		writeDump(qryResult.where);abort;
        for (a in qryResult.where) {
            if (NOT isNumeric(a)) a = "'#a#'";
            realSQL = replace(realSQL, "?", a);
        }
        return realSQL;
		} catch (any e) {
			return e;
		}
    }

	/**
	  * Converts date returned from Angular datepicker to a usable date
	  * @ngDate Angular DatePicker date looks like '2015-02-22T00:00:00.000Z'
	  * @return string Date looks like 'February, 02 2016 00:00:00'
	  */
	public date function fromDatepickerConvert(required string ngDate) {
		var oraDate = Left(ngDate, 10);
		return CreateODBCDate(oraDate);
	};

	/**
	  * Converts date returned from Oracle into an Angular Datepicker date
	  * @oraDate string Date looks like 'February, 02 2016 00:00:00'
	  * @return Angular DatePicker date looks like '2015-02-22T00:00:00.000Z'
	  */
	public date function toDatePickerConvert(required string oraDate) {
		var datePickerDate = dateFormat(oraDate, 'yyyy-mm-dd') & 'T' & timeFormat(oraDate, 'HH:mm:ss.lll') & 'Z';
		return datePickerDate;
	};

	public array function decodeAuthData(required string strBase64Value) {
		var authDataDecoded = ToString(ToBinary(strBase64Value));
		var authdata = listToArray(authDataDecoded, ":");
		return authdata;
	}

	public numeric function getIdFromRowid(rowid, primarykey, table) {
		var getId = new Query();
            getId.setSQL("
                    select #primarykey# as id from #table#
                    where rowid = :ROWID
                    ");
            getId.addParam(name='ROWID', value='#arguments.rowid#', cfsqltype="CF_SQL_VARCHAR");
            var result = getId.execute().getResult();

		return result.id;
	}

}
