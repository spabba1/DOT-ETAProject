/**
 * I control the page that is used for modifying staff (administrative users).
 */
component accessors="true" output="false" {

   property staffroleService;

    public void function init(required struct fw) output="false" {
        variables.fw = fw;
    }

    public void function list(required struct rc) output="false" {
		rc.pagetitle = "Staff List | ";
		rc.breadcrumb.3 = "<a href='#fw.buildUrl('staff.list')#'>Staff List</a>";
        rc.staffroles = variables.staffroleService.getStaffRoles();
    }

}
