<cfcomponent>
    <cfset utilLibrary = new usertable.server.utils.JsonFunctions()>
    <!--- TodoList methods --->

    <cffunction name="getUserTodoLists" access="public"  returntype="Array">
        <cfargument name="user_id" type="numeric" required="true">
        <cfquery name="result" datasource="usertable" result="result">
            SELECT * FROM todolists WHERE user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn utilLibrary.queryToArray(result)>
    </cffunction>
    
    <cffunction name="getTodoList" access="public" returntype="Array" >
        <cfargument name="list_id" type="numeric" required="true" >
        <cfquery name="result" datasource="usertable" result="result">
            SELECT * FROM todolists WHERE list_id = <cfqueryparam value="#arguments.list_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn utilLibrary.queryToArray(result)>
    </cffunction>
    
    <cffunction name="addTodoList" access="public" returntype="boolean">
        <cfargument name="user_id" type="numeric" required="true">
        <cfargument name="list_name" type="string" required="true">
        <cfquery name="result" datasource="usertable">
            INSERT INTO todolists (user_id, list_name) 
            VALUES (
                <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.list_name#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction name="deleteTodoList" access="public" returntype="boolean">
        <cfargument name="list_id" type="numeric" required="true">
        <cfquery name="result" datasource="usertable">
            DELETE FROM todolists WHERE list_id = <cfqueryparam value="#arguments.list_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction name="updateTodoList" access="public"  returntype="boolean">
        <cfargument name="list_id" type="numeric" required="true">
        <cfargument name="listname" type="string" required="true">
        <cfquery name="result" datasource="usertable">
            UPDATE todolists SET list_name = <cfqueryparam value="#arguments.listname#" cfsqltype="cf_sql_varchar">
            WHERE list_id = <cfqueryparam value="#arguments.list_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn true>
    </cffunction>

    <!--- Todo methods --->

    <cffunction name="getTodosFromTodoList" access="public" returntype="Query">
        <cfargument name="list_id" type="numeric" required="true">
        <cfquery name="result" datasource="usertable">
            SELECT * FROM todos WHERE list_id = <cfqueryparam value="#arguments.list_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn result>
    </cffunction>

    <cffunction name="getTodoById" access="public" returntype="Query" >
        <cfargument name="todo_id" type="numeric" required="true">
        <cfquery name="result" datasource="usertable">
            SELECT * FROM todos WHERE todo_id = <cfqueryparam value="#arguments.todo_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn result>
    </cffunction>

    <cffunction name="createTodo" access="public" returntype="boolean">
        <cfargument name="list_id" type="numeric" required="true">
        <cfargument name="title" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="completed" type="boolean"  default="false">
        <cfquery name="result" datasource="usertable">
        INSERT INTO todos (list_id, title, description, due_date, completed) 
        VALUES (
            <cfqueryparam value="#arguments.list_id#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">,
            NOW(),
            <cfqueryparam value="#arguments.completed#" cfsqltype="cf_sql_bit">
        )
        </cfquery>

        <cfreturn true>
    </cffunction>

    <cffunction name="updateTodo"  access="public" returntype="boolean">
        <cfargument name="todo_id" type="numeric" required="true">
        <cfargument name="title" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="completed" type="boolean"  default="false">
        <cfquery name="result" datasource="usertable">
            UPDATE todos SET 
                title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">,
                due_date = NOW(),
                completed = <cfqueryparam value="#arguments.completed#" cfsqltype="cf_sql_bit">
            WHERE todo_id = <cfqueryparam value="#arguments.todo_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction name="deleteTodo" access="public"  returntype="boolean">
        <cfargument name="todo_id" type="numeric" required="true">
        <cfquery name="result" datasource="usertable">
            DELETE FROM todos WHERE todo_id = <cfqueryparam value="#arguments.todo_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn true>
    </cffunction>

</cfcomponent>
