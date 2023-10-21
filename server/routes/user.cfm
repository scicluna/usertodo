<!--- Set the content type for JSON responses --->
<cfcontent type="application/json">
<cfset userController = new usertable.server.controllers.UserController()>
<cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

<cftry>
    <!--- Switch based on HTTP method to determine action --->
    <cfswitch expression="#cgi.REQUEST_METHOD#">

        <!--- Retrieve user data --->
        <cfcase value="GET">
            <!--- If an ID is provided, get a single role; else, get all roles --->
            <cfif structKeyExists(url, "user_id")>
                <cfset userQuery = userController.getUserById(url.user_id)>
            <cfelse>
                <cfset userQuery = userController.getAllUsers()>
            </cfif>
            <cfoutput>#serializeJson({success: true, data: userQuery})#</cfoutput>
        </cfcase>

        <!--- Create a new user --->
        <cfcase value="POST">
            <!--- Expect first_name, last_name, email, role_id --->
            <cfset jsonData = utilLibrary.getRequestJson()>
            <cfset newUser = userController.createUser(jsonData.first_name,jsonData.last_name,jsonData.email,jsonData.role_id)>
            <cfoutput>#serializeJson({success: true, message: "User Created"})#</cfoutput>
        </cfcase>

        <!--- Update an existing user --->
        <cfcase value="PUT">
            <!--- Expect user_id, first_name, last_name, email, role_id --->
            <cfset jsonData = utilLibrary.getRequestJson()>
            <cfset updatedUser = userController.updateUser(jsonData.user_id, jsonData.first_name,jsonData.last_name,jsonData.email,jsonData.role_id)>
            <cfset updatedUserArray = utilLibrary.queryToArray(updatedUser)>
            <cfoutput>#serializeJson({success: true, message: "User Updated"})#</cfoutput>
        </cfcase>

        <!--- Delete an existing user --->
        <cfcase value="DELETE">
            <!--- Expect user_id --->
            <cfset jsonData = utilLibrary.getRequestJson()>
            <cfset deleteResult = userController.deleteUser(jsonData.user_id)>
            <cfoutput>#serializeJson({success: true, message: "User Deleted"})#</cfoutput>
        </cfcase>

        <!--- If the HTTP method is not supported, return an error --->
        <cfdefaultcase>
            <cfoutput>#serializeJson({success: false, message: "Unsupported HTTP method"})#</cfoutput>
        </cfdefaultcase>
    </cfswitch>
    
    <!--- Handle any errors that may arise --->
    <cfcatch>
        <cfoutput>#serializeJson({success: false, message: cfcatch.message})#</cfoutput>
    </cfcatch>
</cftry>