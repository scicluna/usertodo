<cfcomponent >
    <cffunction name="getAllUsers" access="public"  returntype="Query" >
        <cfset var users = entityLoad("User")>  
        <cfreturn users>      
    </cffunction>

    <cffunction name="getUserById" access="public"  returntype="Query" >
        <cfargument name="user_id" type="numeric" required="true">
        <cfset var user = entityLoadByPk("User",arguments.user_id)>  

        <cfif NOT user == null>
            <cfreturn user>       
        </cfif>
        
        <cfthrow message="User with ID #arguments.user_id# not found.">
    </cffunction>

    <cffunction name="createUser" access="public" returntype="boolean" >
        <cfargument name="first_name" type="string" required="true" >
        <cfargument name="last_name" type="string" required="true" >
        <cfargument name="email" type="string" required="true" >
        <cfargument name="role_id" type="numeric" required="true" >

        <cfset var user = entityNew("User")>
        <cfset var role = entityLoadByPK("Role", arguments.role_id)>

        <cfif emailExists(arguments.email)>
            <cfthrow message="The email #arguments.email# is already in use.">
        </cfif>

        <cfif role IS NOT null>
            <cfset user.first_name = arguments.first_name>
            <cfset user.last_name = arguments.last_name>
            <cfset user.email = arguments.email>
            <cfset user.role = role>
            <cfset entitySave(user)>
            <cfreturn true>
        </cfif>

        <cfthrow message="Role with ID #arguments.role_id# not found.">
    </cffunction>

    <cffunction name="updateUser" access="public"  returntype="boolean" >
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="first_name" type="string" required="true" >
        <cfargument name="last_name" type="string" required="true" >
        <cfargument name="email" type="string" required="true" >
        <cfargument name="role_id" type="numeric" required="true" >

        <cfset var user = entityLoad("User",arguments.user_id)>  
        <cfset var role = entityLoadByPK("Role", arguments.role_id)>
        <cfset var existingUserWithEmail = entityLoad("User", {email=arguments.email})>

        <cfif ArrayLen(existingUserWithEmail) AND existingUserWithEmail[1].user_id != arguments.user_id>
            <cfthrow message="The email #arguments.email# is already in use by another user.">
        </cfif>

        <cfif user IS NOT null AND role IS NOT null>
            <cfset user.first_name = arguments.first_name>
            <cfset user.last_name = arguments.last_name>
            <cfset user.email = arguments.email>
            <cfset user.role = role>
            <cfset entitySave(user)>
            <cfreturn true>
        </cfif>

        <cfif user IS NULL>
            <cfthrow message="User with ID #arguments.user_id# not found.">
        </cfif>
        <cfif role IS NULL>
            <cfthrow message="Role with ID #arguments.role_id# not found.">
        </cfif>       

        <cfthrow message="Failed to Update" >
    </cffunction>

    <cffunction name="deleteUser" access="public" returntype="boolean" >
        <cfargument name="user_id" type="numeric" required="true">
        <cfset var user = entityLoad("User",arguments.user_id)>  

        <cfif user IS NOT null>
            <cfset entityDelete(user)>
            <cfreturn true>
        </cfif>

        <cfthrow message="User with ID #arguments.user_id# not found.">
    </cffunction> 

    <cffunction name="emailExists" access="private" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        
        <cfset var users = entityLoad("User", {email=arguments.email})>
        
        <cfif ArrayLen(users)>
            <cfreturn true>
        </cfif>
        
        <cfreturn false>
    </cffunction>
</cfcomponent>