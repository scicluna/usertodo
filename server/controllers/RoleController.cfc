<cfcomponent >

    <cffunction name="getAllRoles" access="public" returntype="query">
            <cfset var roles = entityLoad("Role")>
            <cfreturn roles>
    </cffunction>

    <cffunction name="getRoleById" access="public" returntype="query">
        <cfargument name="roleId" type="numeric" required="true">
        <cfset var role = entityLoadByPK("Role", roleId)>
        <cfreturn role>
    </cffunction>

    <cffunction name="createRole" access="public" returntype="any" >
        <cfargument name="roleName" type="string" required="true">
        <cfargument name="description" type="string" required="false" default="" >
        <cfset var role = entityNew("Role")>

        <cfset role.setRoleName(arguments.roleName)>
        <cfset role.setDescription(arguments.description)>

        <cfset entitySave(role)>
        <cfreturn true>
    </cffunction>

    <cffunction name="updateRole"  access="public" returntype="any" >
        <cfargument name="roleId" type="numeric" required="true">
        <cfargument name="roleName" type="string" required="true">
        <cfargument name="description" type="string" required="false" default="" >

        <cfset var role = entityLoadByPK("Role", arguments.roleId)>

        <cfif NOT isDefined("role")>
            <cfthrow message="Role not found">
        </cfif>

        <cfset role.setRoleName(arguments.roleName)>
        <cfset role.setDescription(arguments.description)>

        <cfset entitySave(role)>
        <cfreturn true>    
    </cffunction>

    <cffunction name="deleteRole" access="public" returntype="any" >
        <cfargument name="roleId" type="numeric" required="true">

        <cfset var role = entityLoadByPK("Role", arguments.roleId)>

        <cfif NOT isDefined("role")>
            <cfthrow message="Role not found">
        </cfif>

        <cfset entityDelete(role)>
        <cfreturn true>
    </cffunction>

</cfcomponent>