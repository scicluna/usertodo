<cfcomponent persistent="true" table="users">
    <cfproperty name="user_id" type="numeric" fieldtype="id" generator="identity">
    <cfproperty name="first_name" type="string" length="255" required="yes">
    <cfproperty name="last_name" type="string" length="255" required="yes">
    <cfproperty name="email" type="string" length="255" required="yes" unique="true">
    <cfproperty name="role" type="numeric"  fieldtype="many-to-one" cfc="Role"  fkcolumn="role_id" >
    <cfproperty name="todolists" fieldtype="one-to-many" cfc="TodoList" fkcolumn="user_id" cascade="all-delete-orphan" >

    <cffunction name="getFullName" access="public" returntype="string">
        <cfreturn first_name & " " & last_name>
    </cffunction>
</cfcomponent>