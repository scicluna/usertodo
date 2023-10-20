<cfcomponent >
    <!--- TodoList methods --->
    <cffunction name="getUserTodoLists" access="public"  returntype="Query" >
        <cfargument name="user_id" type="numeric" required="true" >
        <cfset var todolists = entityLoad("TodoList", {user_id = arguments.user_id}) >
        
        <cfif todolists IS NOT null>
            <cfreturn todolists >
        </cfif>

        <cfthrow message="User with ID #arguments.user_id# not found.">
    </cffunction>

    <cffunction name="addTodoList" access="public"  returntype="boolean" > 
        <cfargument name="user_id" type="numeric" required="true" >
        <cfargument name="list_name" type="string" required="true" >
        <cfset var user = entityLoadByPK("User", arguments.user_id) >

        <cfif user IS NOT null>
            <cfset var todolist = entityNew("TodoList") >
            <cfset todolist.user = user>
            <cfset todolist.list_name = arguments.list_name>
            <cfset entitySave(todolist)>
            <cfreturn true>
        </cfif>

        <cfthrow message="User with ID #arguments.user_id# not found.">
    </cffunction>

    <cffunction name="deleteTodoList" access="public" returntype="boolean">
        <cfargument name="list_id" type="numeric" required="true">
        <cfset var todolist = entityLoadByPK("TodoList", arguments.list_id)>
        
        <cfif todolist IS NOT null>
            <cfset entityDelete(todolist)>
            <cfreturn true>
        </cfif>
            
        <cfthrow message="TodoList with ID #arguments.list_id# not found.">
    </cffunction>

    <cffunction name="updateTodoList" access="public"  returntype="boolean" > 
        <cfargument name="list_id" type="numeric" required="true" >
        <cfargument name="listname" type="string" required="true" >
        <cfset var todolist = entityLoadByPK("TodoList",arguments.list_id)>

        <cfif todolist IS NOT null>
            <cfset todolist.list_name = arguments.listname>
            <cfset entitySave(todolist)>
            <cfreturn true>
        </cfif>

        <cfthrow message="TodoList with ID #arguments.list_id# not found.">
    </cffunction>

    <!--- Todo methods --->
    <cffunction name="getTodosFromTodoList" access="public" returntype="Query" >
        <cfargument name="list_id" type="numeric" required="true" >
        <cfset var todolist = entityLoad("Todo", {list_id = arguments.list_id}) >
        
        <cfif todolist IS NOT null>
            <cfreturn todolist >
        </cfif>
        
        <cfthrow message="TodoList with ID #arguments.list_id# not found.">
    </cffunction>

    <cffunction name="getTodoById" access="public" returntype="Query" >
        <cfargument name="todo_id" type="numeric" required="true" >
        <cfset var todo = entityLoad("Todo", arguments.todo_id) >
        <cfreturn todo >
    </cffunction>

    <cffunction name="createTodo" access="public" returntype="boolean" >
        <cfargument name="list_id" type="numeric" required="true" >
        <cfargument name="title" type="string" required="true" >
        <cfargument name="description" type="string" required="true" >
        <cfargument name="due_date" type="date" required="true" >
        <cfargument name="completed" type="boolean"  default="false">
        <cfset var todo = entityNew("Todo") >
        <cfset var todolist = entityLoadByPK("TodoList", arguments.list_id) >

        <cfif todolist IS NOT null>
            <cfset todo.list = todolist>
            <cfset todo.title = arguments.title>
            <cfset todo.description = arguments.description>
            <cfset todo.due_date = arguments.due_date>
            <cfset todo.completed = arguments.completed>
            <cfset entitySave(todo)>
            <cfreturn true>
        </cfif>

        <cfthrow message="TodoList with ID #arguments.todolistid# not found.">
    </cffunction>

    <cffunction name="updateTodo"  access="public" returntype="boolean">
        <cfargument name="todo_id" type="numeric" required="true" >
        <cfargument name="title" type="string" required="true" >
        <cfargument name="description" type="string" required="true" >
        <cfargument name="due_date" type="date" required="true" >
        <cfargument name="completed" type="boolean"  default="false">
        <cfset var todo = entityLoadByPK("Todo", arguments.todo_id) >

        <cfif todo IS NOT null>
            <cfset todo.title = arguments.title>
            <cfset todo.description = arguments.description>
            <cfset todo.due_date = arguments.due_date>
            <cfset todo.completed = arguments.completed>
            <cfset entitySave(todo)>
            <cfreturn true>
        </cfif>

        <cfthrow message="Todo with ID #arguments.todo_id# not found.">
    </cffunction>

    <cffunction name="deleteTodo" access="public"  returntype="boolean" >
        <cfargument name="todo_id" >
        <cfset var todo = entityLoadByPK("Todo", arguments.todo_id) >

        <cfif todo IS NOT null>
            <cfset entityDelete(todo)>
            <cfreturn true>
        </cfif>
            
        <cfthrow message="Todo with ID #arguments.todo_id# not found.">
    </cffunction>
</cfcomponent>