<cfcomponent >
    <cffunction name="queryToArray" returntype="array">
        <cfargument name="query" type="query" required="true">
        <cfset var dataArray = []>
        <cfloop query="query">
            <cfset var dataStruct = {}>
            <cfloop list="#query.columnList#" index="col">
                <cfset dataStruct[col] = query[col][query.CurrentRow]>
            </cfloop>
            <cfset arrayAppend(dataArray, dataStruct)>
        </cfloop>
        <cfreturn dataArray>
    </cffunction>
</cfcomponent>