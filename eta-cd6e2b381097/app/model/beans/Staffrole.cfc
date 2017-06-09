component accessors="true" output="false" {

	property name="id";
	property name="description";

	public any function init(
		id = "",
		description = ""
	) {

		variables.id = arguments.id;
		variables.description = arguments.description;

		return this;
	}
}
