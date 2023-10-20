<!--- Set the content type for JSON responses --->
<cfcontent type="application/json">
<cfset roleController = new usertable.server.controllers.RoleController()>
<cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

<cftry>
    <!--- Switch based on HTTP method to determine action --->
    <cfswitch expression="#cgi.REQUEST_METHOD#">

        <!--- GET: Retrieve roles --->
        <cfcase value="GET">
            <!--- If an ID is provided, get a single role; else, get all roles --->
            <cfif structKeyExists(url, "role_id")>
                <cfset roleQuery = roleController.getRoleById(url.role_id)>
                <cfset roleData = utilLibrary.queryToArray(roleQuery)>
            <cfelse>
                <cfset roleQuery = roleController.getAllRoles()>
                <cfset roleData = utilLibrary.queryToArray(roleQuery)>
            </cfif>
            <cfoutput>#serializeJson(roleData)#</cfoutput>
        </cfcase>

        <!--- POST: Create a new role --->
        <cfcase value="POST">
            <!--- Assuming request body is in JSON format; Deserialize to CF structure --->
            <cfset requestBody = utilLibrary.getRequestJson()>
            <cfset newRole = roleController.createRole(requestBody.role_name)>
            <cfoutput>#serializeJson({success: true})#</cfoutput>
        </cfcase>

        <!--- PUT: Update a role --->
        <cfcase value="PUT">
            <!--- Assuming request body is in JSON format; Deserialize to CF structure --->
            <cfset requestBody = utilLibrary.getRequestJson()>
            <cfset updatedRole = roleController.updateRole(requestBody.role_id, requestBody.role_name)>
            <cfoutput>#serializeJson({success: true})#</cfoutput>
        </cfcase>

        <!--- DELETE: Delete a role --->
        <cfcase value="DELETE">
            <cfset deleteResult = roleController.deleteRole(url.role_id)>
            <cfoutput>#serializeJson({success: true})#</cfoutput>
        </cfcase>

        <!--- Unsupported HTTP method --->
        <cfdefaultcase>
            <cfoutput>#serializeJson({success: false, message: "Unsupported HTTP method"})#</cfoutput>
        </cfdefaultcase>

    </cfswitch>

    <cfcatch>
        <!--- Handle any errors that may arise --->
        <cfoutput>#serializeJson({success: false, message: cfcatch.message})#</cfoutput>
    </cfcatch>
</cftry>
