<cfcomponent persistent="true" table="todos">
    <cfproperty name="todo_id" type="numeric"  fieldtype="id" generator="identity">
    <cfproperty name="title" type="string" required="true">
    <cfproperty name="description" type="string">
    <cfproperty name="due_date" type="date" required="true">
    <cfproperty name="completed" type="boolean" required="true" default="false">
    <cfproperty name="list"  type="numeric" fieldtype="many-to-one" cfc="TodoList" fkcolumn="list_id" >
</cfcomponent>