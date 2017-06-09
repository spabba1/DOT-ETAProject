<!---
LICENSE
Copyright 2007 Brian Kotek

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->

<cfcomponent name="FormUtilities" hint="Form Utilities">

    <cffunction name="init" access="public" hint="Constructor." output="false">
        <cfargument name="updateFormScope" type="boolean" required="false" default="false" hint="If true, adds the collections to the form scope." />
        <cfargument name="trimFields" type="boolean" required="false" default="true" />
        <cfargument name="cleanFields" type="boolean" required="false" default="true"  />
        <cfset variables.instance.updateFormScope = arguments.updateFormScope />
        <cfset variables.instance.trimFields = arguments.trimFields />
        <cfset variables.instance.cleanFields = arguments.cleanFields />
        <cfreturn this />
    </cffunction>

    <cffunction name="compareLists" access="public" returntype="struct" output="false" hint="Given two versions of a list, I return a struct containing the values that were added, the values that were removed, and the values that stayed the same.">
        <cfargument name="originalList" type="any" required="true" hint="List of original values." />
        <cfargument name="newList" type="any" required="true" hint="List of new values." />
        <cfset var worker = StructNew() />

        <cfset worker.results = StructNew() />
        <cfset worker.results.addedList = "" />
        <cfset worker.results.removedList = "" />
        <cfset worker.results.sameList = "" />

        <cfloop list="#arguments.originalList#" index="worker.thisItem">
            <cfif ListFindNoCase(arguments.newList, worker.thisItem)>
                <cfset worker.results.sameList = ListAppend(worker.results.sameList, worker.thisItem) />
                <cfelse>
                <cfset worker.results.removedList = ListAppend(worker.results.removedList, worker.thisItem) />
            </cfif>
        </cfloop>

        <cfloop list="#arguments.newList#" index="worker.thisItem">
            <cfif not ListFindNoCase(arguments.originalList, worker.thisItem)>
                <cfset worker.results.addedList = ListAppend(worker.results.addedList, worker.thisItem) />
            </cfif>
        </cfloop>

        <cfreturn worker.results />
    </cffunction>

    <cffunction name="buildFormCollections" access="public" returntype="any" output="false" hint="">
        <cfargument name="formScope" type="struct" required="true" />
        <cfargument name="updateFormScope" type="boolean" required="true" default="#variables.instance.updateFormScope#" hint="If true, adds the collections to the form scope." />
        <cfargument name="trimFields" type="boolean" required="true" default="#variables.instance.trimFields#" />
        <cfargument name="cleanFields" type="boolean" required="true" default="#variables.instance.cleanFields#" />
        <cfset var worker = StructNew() />

        <cfset worker.tempStruct = StructNew() />
        <cfset worker.tempStruct['formCollectionsList'] = "" />

        <!--- Loop over the form scope. --->
        <cfloop collection="#arguments.formScope#" item="worker.thisField">
            <cfif arguments.cleanFields>
                <!--- protect from cross site scripting --->
                <cfset arguments.formScope[worker.thisField] = htmlEditFormat( arguments.formScope[worker.thisField] ) />
            </cfif>
            <cfset worker.thisField = Trim(worker.thisField) />

            <!--- If the field has a dot or a bracket... --->
            <cfif hasFormCollectionSyntax(worker.thisField)>

                <!--- Add collection to list if not present. --->
                <cfset worker.tempStruct['formCollectionsList'] = addCollectionNameToCollectionList(worker.tempStruct['formCollectionsList'], worker.thisField) />

                <cfset worker.currentElement = worker.tempStruct />

                <!--- Loop over the field using . as the delimiter. --->
                <cfset worker.delimiterCounter = 1 />
                <cfloop list="#worker.thisField#" delimiters="." index="worker.thisElement">
                    <cfset worker.tempElement = worker.thisElement />
                    <cfset worker.tempIndex = 0 />

                    <!--- If the current piece of the field has a bracket, determine the index and the element name. --->
                    <cfif worker.tempElement contains "[">
                        <cfset worker.tempIndex = ReReplaceNoCase(worker.tempElement, '.+\[|\]', '', 'all') />
                        <cfset worker.tempElement = ReReplaceNoCase(worker.tempElement, '\[.+\]', '', 'all') />
                    </cfif>

                    <!--- If there is a temp element defined, means this field is an array or struct. --->
                    <cfif not StructKeyExists(worker.currentElement, worker.tempElement)>

                        <!--- If tempIndex is 0, it's a Struct, otherwise an Array. --->
                        <cfif worker.tempIndex eq 0>
                            <cfset worker.currentElement[worker.tempElement] = StructNew() />
                            <cfelse>
                            <cfset worker.currentElement[worker.tempElement] = ArrayNew(1) />
                        </cfif>
                    </cfif>

                    <!--- If this is the last element defined by dots in the form field name, assign the form field value to the variable. --->
                    <cfif worker.delimiterCounter eq ListLen(worker.thisField, '.')>

                        <cfif worker.tempIndex eq 0>
                            <cfset worker.currentElement[worker.tempElement] = arguments.formScope[worker.thisField] />
                            <cfelse>
                            <cfset worker.currentElement[worker.tempElement][worker.tempIndex] = arguments.formScope[worker.thisField] />
                        </cfif>

                        <!--- Otherwise, keep going through the field name looking for more structs or arrays. --->
                        <cfelse>

                        <!--- If this field was a Struct, make the next element the current element for the next loop iteration. --->
                        <cfif worker.tempIndex eq 0>
                            <cfset worker.currentElement = worker.currentElement[worker.tempElement] />
                            <cfelse>

                            <!--- If we're on CF8, leverage the ArrayIsDefined() function to avoid throwing costly exceptions. --->
                            <cfif server.coldfusion.productName eq "ColdFusion Server" and ListFirst(server.coldfusion.productVersion) gte 8>

                                <cfif ArrayIsEmpty(worker.currentElement[worker.tempElement])
                                    or ArrayLen(worker.currentElement[worker.tempElement]) lt worker.tempIndex
                                    or not ArrayIsDefined(worker.currentElement[worker.tempElement], worker.tempIndex)>
                                    <cfset worker.currentElement[worker.tempElement][worker.tempIndex] = StructNew() />
                                </cfif>

                                <cfelse>

                                <!--- Otherwise it's an Array, so we have to catch array element undefined errors and set them to new Structs. --->
                                <cftry>
                                    <cfset worker.currentElement[worker.tempElement][worker.tempIndex] />
                                    <cfcatch type="any">
                                        <cfset worker.currentElement[worker.tempElement][worker.tempIndex] = StructNew() />
                                    </cfcatch>
                                </cftry>

                            </cfif>

                            <!--- Make the next element the current element for the next loop iteration. --->
                            <cfset worker.currentElement = worker.currentElement[worker.tempElement][worker.tempIndex] />

                        </cfif>
                        <cfset worker.delimiterCounter = worker.delimiterCounter + 1 />
                    </cfif>

                </cfloop>
            </cfif>
        </cfloop>

        <!--- Done looping. If we've been set to update the form scope, append the created form collections to the form scope. --->
        <cfif arguments.updateFormScope>
            <cfset StructAppend(arguments.formScope, worker.tempStruct) />
        </cfif>

        <cfreturn worker.tempStruct />
    </cffunction>

    <cffunction name="hasFormCollectionSyntax" access="private" returntype="boolean" output="false" hint="I determine if the field has the form collection syntax, meaning it contains a dot or a bracket.">
        <cfargument name="fieldName" type="any" required="true" />
        <cfreturn arguments.fieldName contains "." or arguments.fieldName contains "[" />
    </cffunction>

    <cffunction name="addCollectionNameToCollectionList" access="private" returntype="string" output="false" hint="I add the collection name to the list of collection names if it isn't already there.">
        <cfargument name="formCollectionsList" type="string" required="true" />
        <cfargument name="fieldName" type="string" required="true" />
        <cfif not ListFindNoCase(arguments.formCollectionsList, ReReplaceNoCase(arguments.fieldName, '(\.|\[).+', ''))>
            <cfset arguments.formCollectionsList = ListAppend(arguments.formCollectionsList, ReReplaceNoCase(arguments.fieldName, '(\.|\[).+', '')) />
        </cfif>
        <cfreturn arguments.formCollectionsList />
    </cffunction>

</cfcomponent>
