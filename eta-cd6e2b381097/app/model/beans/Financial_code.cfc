component accessors="true" {

    property name="id" type="numeric";
    property name="code" type="string";
    property name="taid" type="numeric";

    public any function init(
			id = 0,
			string code = "",
			taid = ""
	) {

        variables.id = arguments.id;
        variables.code = arguments.code;
        variables.taid = arguments.taid;

        return this;

    }

}
