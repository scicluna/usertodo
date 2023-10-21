<cfcomponent>
    <cfset utilLibrary = new usertable.server.utils.JsonFunctions()>
    <cffunction name="getAllRoles" access="public" returntype="Array">
        <cfquery name="roles" datasource="usertable" result="roles">
            SELECT * FROM roles
        </cfquery>
        <cfreturn utilLibrary.queryToArray(roles)>
    </cffunction>

    <cffunction name="getRoleById" access="public" returntype="query">
        <cfargument name="roleId" type="numeric" required="true">
        <cfquery name="role" datasource="usertable">
            SELECT * FROM roles WHERE role_id = <cfqueryparam value="#arguments.roleId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn role>
    </cffunction>

    <cffunction name="createRole" access="public" returntype="any">
        <cfargument name="role_name" type="string" required="true">
        <cfargument name="description" type="string" required="false" default="">

        <cftry>
            <cfquery datasource="usertable">
                INSERT INTO roles (role_name, description)
                VALUES (<cfqueryparam value="#arguments.role_name#" cfsqltype="cf_sql_varchar">, 
                        <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">)
            </cfquery>
            <cfreturn true>

            <cfcatch>
                <cfthrow message="Error while creating role: #cfcatch.message#">
            </cfcatch>
        </cftry>
    </cffunction>

    <cffunction name="updateRole" access="public" returntype="any">
        <cfargument name="role_id" type="numeric" required="true">
        <cfargument name="role_name" type="string" required="true">
        <cfargument name="description" type="string" required="false" default="">

        <cfquery datasource="usertable" result="queryResult">
            UPDATE roles 
            SET role_name = <cfqueryparam value="#arguments.role_name#" cfsqltype="cf_sql_varchar">,
                description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
            WHERE role_id = <cfqueryparam value="#arguments.role_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif queryResult.RECORDCOUNT eq 0>
            <cfthrow message="Role not found">
        </cfif>

        <cfreturn true>
    </cffunction>

    <cffunction name="deleteRole" access="public" returntype="any">
        <cfargument name="role_id" type="numeric" required="true">

        <cfquery datasource="usertable" result="queryResult">
            DELETE FROM roles WHERE role_id = <cfqueryparam value="#arguments.role_id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfif queryResult.RECORDCOUNT eq 0>
            <cfthrow message="Role not found">
        </cfif>

        <cfreturn true>
    </cffunction>
</cfcomponent>
