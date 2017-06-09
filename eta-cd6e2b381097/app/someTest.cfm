<cfdbinfo datasource="etadev" type="dbnames" name="dbnames" />
<cfdbinfo datasource="etadev" type="tables" name="tables" />
<cfdbinfo datasource="etadev" type="columns" name="columns" table="staff" />
<cfdbinfo datasource="etadev" type="version" name="version" />
<cfdbinfo datasource="etadev" type="procedures" name="procedures" />
<cfdbinfo datasource="etadev" type="foreignkeys" name="foreignkeys" table="staff" />
<cfdbinfo datasource="etadev" type="index" name="index" table="staff" />

<cfdump var="#dbnames#">
<cfdump var="#tables#">
<cfdump var="#columns#">
<cfdump var="#version#">
<cfdump var="#procedures#">
<cfdump var="#foreignkeys#">
<cfdump var="#index#">
