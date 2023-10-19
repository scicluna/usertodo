<cfcomponent persistent="true" table="todolists">
    <cfproperty name="list_id" type="numeric" fieldtype="id" generator="identity">
    <cfproperty name="list_name" type="string" required="true">
    <cfproperty name="user" type="numeric" fieldtype="many-to-one" cfc="User" fkcolumn="user_id">
    <cfproperty name="todos" fieldtype="one-to-many" cfc="Todo" fkcolumn="list_id" cascade="all-delete-orphan">
</cfcomponent>
