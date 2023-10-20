<cfcomponent >
    <!--- TodoList methods --->
    <cffunction name="getUserTodoLists" access="public"  returntype="Query" >
        <cfargument name="userid" type="numeric" required="true" >
        <cfset var todolists = entityLoad("TodoList", {user_id = arguments.userid}) >
        
        <cfif todolists IS NOT null>
            <cfreturn todolists >
        </cfif>

        <cfthrow message="User with ID #arguments.userid# not found.">
    </cffunction>

    <cffunction name="addTodoList" access="public"  returntype="boolean" > 
        <cfargument name="userid" type="numeric" required="true" >
        <cfargument name="listname" type="string" required="true" >
        <cfset var user = entityLoadByPK("User", arguments.userid) >

        <cfif user IS NOT null>
            <cfset var todolist = entityNew("TodoList") >
            <cfset todolist.user = user>
            <cfset todolist.list_name = arguments.listname>
            <cfset entitySave(todolist)>
            <cfreturn true>
        </cfif>

        <cfthrow message="User with ID #arguments.userid# not found.">
    </cffunction>

    <cffunction name="deleteTodoList" access="public" returntype="boolean">
        <cfargument name="todolistid" type="numeric" required="true">
        <cfset var todolist = entityLoadByPK("TodoList", arguments.todolistid)>
        
        <cfif todolist IS NOT null>
            <cfset entityDelete(todolist)>
            <cfreturn true>
        </cfif>
            
        <cfthrow message="TodoList with ID #arguments.todolistid# not found.">
    </cffunction>

    <cffunction name="updateTodoList" access="public"  returntype="boolean" > 
        <cfargument name="todolistid" type="numeric" required="true" >
        <cfargument name="listname" type="string" required="true" >
        <cfset var todolist = entityLoadByPK("TodoList",arguments.todolistid)>

        <cfif todolist IS NOT null>
            <cfset todolist.list_name = arguments.listname>
            <cfset entitySave(todolist)>
            <cfreturn true>
        </cfif>

        <cfthrow message="TodoList with ID #arguments.todolistid# not found.">
    </cffunction>

    <!--- Todo methods --->
    <cffunction name="getTodosFromTodoList" access="public" returntype="Query" >
        <cfargument name="todolistid" type="numeric" required="true" >
        <cfset var todolist = entityLoad("Todo", {list_id = arguments.todolistid}) >
        
        <cfif todolist IS NOT null>
            <cfreturn todolist >
        </cfif>
        
        <cfthrow message="TodoList with ID #arguments.todolistid# not found.">
    </cffunction>

    <cffunction name="getTodoById" access="public" returntype="Query" >
        <cfargument name="todoid" type="numeric" required="true" >
        <cfset var todo = entityLoad("Todo", arguments.todoid) >
        <cfreturn todo >
    </cffunction>

    <cffunction name="createTodo" access="public" returntype="boolean" >
        <cfargument name="list_id" type="numeric" required="true" >
        <cfargument name="title" type="string" required="true" >
        <cfargument name="description" type="string" required="true" >
        <cfargument name="duedate" type="date" required="true" >
        <cfargument name="completed" type="boolean"  default="false">
        <cfset var todo = entityNew("Todo") >
        <cfset var todolist = entityLoadByPK("TodoList", arguments.list_id) >

        <cfif todolist IS NOT null>
            <cfset todo.list = todolist>
            <cfset todo.title = arguments.title>
            <cfset todo.description = arguments.description>
            <cfset todo.due_date = arguments.duedate>
            <cfset todo.completed = arguments.completed>
            <cfset entitySave(todo)>
            <cfreturn true>
        </cfif>

        <cfthrow message="TodoList with ID #arguments.todolistid# not found.">
    </cffunction>

    <cffunction name="updateTodo"  access="public" returntype="boolean">
        <cfargument name="todoid" type="numeric" required="true" >
        <cfargument name="title" type="string" required="true" >
        <cfargument name="description" type="string" required="true" >
        <cfargument name="duedate" type="date" required="true" >
        <cfargument name="completed" type="boolean"  default="false">
        <cfset var todo = entityLoadByPK("Todo", arguments.todoid) >

        <cfif todo IS NOT null>
            <cfset todo.title = arguments.title>
            <cfset todo.description = arguments.description>
            <cfset todo.due_date = arguments.duedate>
            <cfset todo.completed = arguments.completed>
            <cfset entitySave(todo)>
            <cfreturn true>
        </cfif>

        <cfthrow message="Todo with ID #arguments.todoid# not found.">
    </cffunction>

    <cffunction name="deleteTodo" access="public"  returntype="boolean" >
        <cfargument name="todoid" >
        <cfset var todo = entityLoadByPK("Todo", arguments.todoid) >

        <cfif todo IS NOT null>
            <cfset entityDelete(todo)>
            <cfreturn true>
        </cfif>
            
        <cfthrow message="Todo with ID #arguments.todoid# not found.">
    </cffunction>
</cfcomponent>