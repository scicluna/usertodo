<!--- Set the content type for JSON responses --->
<cfcontent type="application/json">
<cfset todoController = new usertable.server.controllers.TodoController()>
<cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

<cftry>
    <!--- Switch based on HTTP method to determine action --->
    <cfswitch expression="#cgi.REQUEST_METHOD#">

        <!--- Get One User's TodoLists --->
        <cfcase value="GET" >
            <!--- Expects fetch url to have a user id param --->
            <cfset userListsQuery = todoController.getUserTodoLists(url.user_id)>
            <cfset todoLists = utilLibrary.queryToArray(userListsQuery)>
            <cfoutput>#serializeJson({success: true, data: todoLists})#</cfoutput>
        </cfcase>

        <!--- Create a new TodoList --->
        <cfcase value="POST" >
            <!--- Expects user_id and list_name in body --->
            <cfset jsonBody = utilLibrary.getRequestJson()>
            <cfset todoListQuery = todoController.addTodoList(jsonBody.user_id,jsonBody.list_name)>
            <cfset todoList = utilLibrary.queryToArray(todoListQuery)>
            <cfoutput>#serializeJson({success: true, data: todoList})#</cfoutput>
        </cfcase>

        <!--- Update a TodoList --->
        <cfcase value="PUT" >
            <!--- Expects list_id and list_name in body --->
            <cfset jsonBody = utilLibrary.getRequestJson()>
            <cfset todoListQuery = todoController.updateTodoList(jsonBody.list_id,jsonBody.list_name)>
            <cfset todoList = utilLibrary.queryToArray(todoListQuery)>
            <cfoutput>#serializeJson({success: true, data: todoList})#</cfoutput>
        </cfcase>

        <!--- Delete a TodoList --->
        <cfcase value="DELETE" >
            <!--- Expects list_id in url --->
            <cfset deleteResult = todoController.deleteTodoList(url.list_id)>
            <cfoutput>#serializeJSON({success: true, message: "List Deleted"})#</cfoutput>
        </cfcase>

        <!--- Unsupported HTTP method --->
        <cfdefaultcase>
            <cfoutput>#serializeJson({success: false, message: "Unsupported HTTP method"})#</cfoutput>
        </cfdefaultcase>
    </cfswitch>

    <!--- Handle any errors that may arise --->
    <cfcatch>
        <cfoutput>#serializeJson({success: false, message: cfcatch.message})#</cfoutput>
    </cfcatch>
</cftry>