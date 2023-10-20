<!--- Set the content type for JSON responses --->
<cfcontent type="application/json">
<cfset todoController = new usertable.server.controllers.TodoController()>
<cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

<cftry>
    <!--- Switch based on HTTP method to determine action --->
    <cfswitch expression="#cgi.REQUEST_METHOD#">

        <!--- Get all todos from a list OR a singular todo --->
        <cfcase value="GET">
            <cfif structKeyExists(url, "todo_id")>
                <!--- Get a singular todo --->
                <cfset todoQuery = todoController.getTodoById(url.todo_id)>
                <cfset todos = utilLibrary.queryToArray(todoQuery)>
                <cfoutput>#serializeJson({success: true, data: todos})#</cfoutput>
            <cfelseif structKeyExists(url, "list_id")>
                <!--- Get all todos from a list --->
                <cfset todoQuery = todoController.getTodosFromTodoList(url.list_id)>
                <cfset todos = utilLibrary.queryToArray(todoQuery)>
                <cfoutput>#serializeJson({success: true, data: todos})#</cfoutput>
            <cfelse>
                <cfoutput>#serializeJSON({success: false, message: "Incorrect Parameters" })#</cfoutput>
            </cfif>
        </cfcase>

        <!--- Create a new todo --->
        <cfcase value="POST" >
            <!--- Expects list_id, title, description, due_date, completed in body  --->
            <cfset jsonBody = utilLibrary.getRequestJson()>
            <cfset todoQuery = todoController.createTodo(
                jsonBody.list_id,
                jsonBody.title,
                jsonBody.description,
                jsonBody.due_date,
                jsonBody.completed
            )>
            <cfset todo = utilLibrary.queryToArray(todoQuery)>
            <cfoutput>#serializeJson({success: true, data: todo})#</cfoutput>
        </cfcase>

        <!--- Update a todo --->
        <cfcase value="PUT" >
            <!--- Expects todo_id, title, description, due_date, completed in body  --->
            <cfset jsonBody = utilLibrary.getRequestJson()>
            <cfset todoQuery = todoController.updateTodo(
                jsonBody.todo_id,
                jsonBody.title,
                jsonBody.description,
                jsonBody.due_date,
                jsonBody.completed
            )>
            <cfset todo = utilLibrary.queryToArray(todoQuery)>
            <cfoutput>#serializeJson({success: true, data: todo})#</cfoutput>
        </cfcase>

        <!--- Delete a todo --->
        <cfcase value="DELETE" >
            <!--- Expects todo_id in url --->
            <cfset deleteResult = todoController.deleteTodo(url.todo_id)>
            <cfoutput>#serializeJSON({success: true, message: "Todo Deleted"})#</cfoutput>       
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