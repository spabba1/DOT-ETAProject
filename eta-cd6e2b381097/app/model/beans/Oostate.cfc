/**
* I model the Out Of State information.
 */
component accessors="true" {

	property numeric id;
	property string confname;
	property string goal;
	property boolean localoption;
	property string localoptionreason;
	property string beneficial;
	property string sharing;
	property boolean groupable;
	property boolean debrief;
	property string comments;
	property numeric taid;

	public any function init(
			id                = '',
			confname          = '',
			goal              = '',
			localoption       = false,
			localoptionreason = '',
			beneficial        = '',
			sharing           = '',
			groupable         = false,
			debrief           = false,
			comments          = '',
			taid              = '')

	{

		variables.id = arguments.id;
		variables.confname = arguments.confname;
		variables.goal = arguments.goal;
		variables.localoption = arguments.localoption;
		variables.localoptionreason = arguments.localoptionreason;
		variables.beneficial = arguments.beneficial;
		variables.sharing = arguments.sharing;
		variables.groupable = arguments.groupable;
		variables.debrief = arguments.debrief;
		variables.comments = arguments.comments;
		variables.taid = arguments.taid;

		return this;


	}







}
