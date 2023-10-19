<cfcomponent persistent="true" table="roles">
    <cfproperty name="role_id" type="numeric" fieldtype="id" generator="identity">
    <cfproperty name="role_name" type="string" length="255" required="yes">
    <cfproperty name="description" type="string">
</cfcomponent>