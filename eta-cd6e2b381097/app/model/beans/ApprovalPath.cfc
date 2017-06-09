/**
 * I am an approval path bean. (logging/workflow).
 */
component accessors="true" {

    property name="taid"     type="string";
    property name="process"  type="string";
    property name="status"   type="string";
    property name="etauser"   type="string";
    property name="staff"    type="string";

    property name="created"  type="date";
    property name="details"  type="string";
    property name="approved" type="boolean";
    property name="approver" type="string";


	public any function init(
			taid     = "",
			process  = "",
			status   = "",
			etauser   = "",
			staff    = "",
			created  = "",
			details  = "",
			approved = "",
			approver = ""
	) {
        variables.taid     = arguments.taid;
        variables.process  = arguments.process;
        variables.status   = arguments.status;
        variables.etauser   = arguments.etauser;
        variables.staff    = arguments.staff;
        variables.created  = arguments.created;
        variables.details  = arguments.details;
        variables.approved = arguments.approved;
        variables.approver = arguments.approver;

        return this;
    }
}

