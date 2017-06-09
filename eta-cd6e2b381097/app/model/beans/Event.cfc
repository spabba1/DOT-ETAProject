/**
 * I am the Event table
 */
component accessors="true" {

    property name="id" type="int";

    property name="name" type="string" length="45";
    property name="description" type="string" length="255";
    property name="details" type="string" length="255";

    property name="fk_nexteventid" type="int";

    public any function init(
                                numeric id = "0",
                                string name = "",
                                string description = "",
                                string details = "",
                                numeric fk_nexteventid = "0")
    {
        variables.id             = arguments.id;
        variables.name           = arguments.name;
        variables.description    = arguments.description;
        variables.details        = arguments.details;
        variables.fk_nexteventid = arguments.fk_nexteventid;

        return this;

    }

}
