component accessors="true" {

    property name="IdcService"          hint="The content server service.";

    // Required Workflow fields
    property name="dDocAuthor"          hint="The content item author (contributor).";
    property name="dDocTitle"           hint="The content item title.";
    property name="dDocType"            hint="The content item Type.";
    property name="dSecurityGroup"      hint="The security group such as Public or Secure.";
    property name="primaryFile"         hint="The absolute path to the location of the file as seen from the server.  Use the forward slash as the file separator.";
    property name="dDocName"            hint="The content item identifier (Content ID).";
    property name="dID"                 hint="The generated content item revision ID.";

    // Workflow meta-data fields
    property name="xTransaction"        hint="Adding the value 'eta_workflow' into this field starts the workflow process.";
    property name="xCollectionID"       hint="Folder identification number.";
    property name="dWfName"             hint="The workflow name.";
    property name="dWfDescription"      hint="The workflow description.";
    property name="dWfType"             hint="The workflow type such as Basic or Criteria.";
    property name="dWfCriteriaName"     hint="The workflow criteria field.";
    property name="dWfCriteriaOperator" hint="The workflow criteria operator matches.";
    property name="dWfCriteriaValue"    hint="The workflow criteria value.";
    property name="wfMessage"           hint="The message that will be included in the Workflow Started notification e-mail.";
    property name="xPrimaryParty1"      hint="This is the 'token' where the approver UID is entered so eDocs knows where to send for approval.";


    // Required meta-data fields
    property name="dRevLabel"           hint="The content item revision label.";

    // Optional meta-data fields
    property name="xStateDepartment";

    public function init(
            dDocAuthor          = "ETA",
            dDocTitle           = "",
            dDocType            = "Other",
            dSecurityGroup      = "Projects",
            primaryFile         = "",
            dDocName            = "",
            dID                 = "",

            xTransaction        = request.thisWorkflowName,
            xCollectionID       = "",
            dWfName             = "",
            dWfDescription      = "",
            dWfType             = "",
            dWfCriteriaName     = "",
            dWfCriteriaOperator = "",
            dWfCriteriaValue    = "",
            wfMessage           = "This is a test wfMessage set in the Stellent bean.",
            xPrimaryParty1      = "",

            dRevLabel           = "1",
            xStateDepartment    = "Transportation & Public Facilities"
                ) {

                    variables.dDocAuthor          = arguments.dDocAuthor;
                    variables.dDocTitle           = arguments.dDocTitle;
                    variables.dDocType            = arguments.dDocType;
                    variables.dSecurityGroup      = arguments.dSecurityGroup;
                    variables.primaryFile         = arguments.primaryFile;
                    variables.dDocName            = arguments.dDocName;
                    variables.dID                 = arguments.dID;
                    variables.xTransaction        = arguments.xTransaction;
                    variables.xCollectionID       = arguments.xCollectionID;
                    variables.dWfName             = arguments.dWfName;
                    variables.dWfDescription      = arguments.dWfDescription;
                    variables.dWfType             = arguments.dWfType;
                    variables.dWfCriteriaName     = arguments.dWfCriteriaName;
                    variables.dWfCriteriaOperator = arguments.dWfCriteriaOperator;
                    variables.dWfCriteriaValue    = arguments.dWfCriteriaValue;
                    variables.wfMessage           = arguments.wfMessage;
                    variables.xPrimaryParty1      = arguments.xPrimaryParty1;
                    variables.dRevLabel           = arguments.dRevLabel;
                    variables.xStateDepartment    = arguments.xStateDepartment;

                    return this;
                }
}
