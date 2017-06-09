/**
 * I am the staff member in the workflow process.
 */
component
{

    property name="ta_id" type="int";
    property name="process_id" type="int";
    property name="staff_id" type="int";
    property name="datestarted" type="date";
    property name="datefinished" type="date";

    public any function init(
                             numeric ta_id = "",
                             numeric process_id = "",
                             numeric staff_id = "",
                             date datestarted = "",
                             date datefinished = "")
    {
        variables.ta_id = arguments.ta_id;
        variables.process_id = arguments.process_id;
        variables.status = arguments.status;
        variables.datestarted = arguments.datestarted;
        variables.datefinished = arguments.datefinished;

        return this;

    }



}
