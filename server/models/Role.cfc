<cfcomponent persistent="true" table="roles">
    <cfproperty name="role_id" type="numeric" fieldtype="id" generator="identity">
    <cfproperty name="role_name" type="string"  required="true">
    <cfproperty name="description" type="string" default="">
    <cfproperty name="users" fieldtype="one-to-many" cfc="User" fkcolumn="role_id">
</cfcomponent>