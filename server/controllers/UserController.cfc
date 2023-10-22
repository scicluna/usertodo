<cfcomponent>
    <cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

    <cffunction name="getAllUsers" access="public" returntype="Array">
        <cfquery name="users" datasource="usertable" result="users">
            SELECT * FROM users
        </cfquery>
        <cfreturn utilLibrary.queryToArray(users) >
    </cffunction>

    <cffunction name="getUserById" access="public" returntype="query">
        <cfargument name="user_id" type="numeric" required="true">
        
        <cfquery name="user" datasource="usertable">
            SELECT * FROM users WHERE user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif user.RecordCount>
            <cfreturn user>
        <cfelse>
            <cfthrow message="User with ID #arguments.user_id# not found.">
        </cfif>
    </cffunction>

    <cffunction name="createUser" access="public" returntype="boolean">
        <cfargument name="first_name" type="string" required="true">
        <cfargument name="last_name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="role_id" type="numeric" required="true">

        <cfif emailExists(arguments.email)>
            <cfthrow message="The email #arguments.email# is already in use.">
        </cfif>

        <cfquery datasource="usertable">
            INSERT INTO users (first_name, last_name, email, role_id)
            VALUES (
                <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.role_id#" cfsqltype="cf_sql_integer">
            )
        </cfquery>

        <cfreturn true>
    </cffunction>

    <cffunction name="updateUser" access="public"  returntype="boolean" >
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="first_name" type="string" required="true">
        <cfargument name="last_name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="role_id" type="numeric" required="true">

        <cfif emailExists(arguments.email)>
            <cfthrow message="The email #arguments.email# is already in use.">
        </cfif>

        <cfquery datasource="usertable">
            UPDATE users 
            SET 
            first_name = <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
            last_name = <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
            email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
            role_id = <cfqueryparam value="#arguments.role_id#" cfsqltype="cf_sql_integer">
            WHERE 
            user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn true>
    </cffunction>

    <cffunction name="deleteUser" access="public" returntype="boolean">
        <cfargument name="user_id" type="numeric" required="true">

        <cfquery datasource="usertable">
            DELETE FROM users WHERE user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn true>
    </cffunction>

    <cffunction name="emailExists" access="private" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        
        <cfquery name="users" datasource="usertable">
            SELECT email FROM users WHERE email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfreturn users.RecordCount gt 0>
    </cffunction>
</cfcomponent>
