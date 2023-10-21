<cfcomponent >
    <cffunction name="queryToArray" returntype="array">
   <cfargument name="query" type="query" required="true">
    
    <cfset var resultArray = []>
    <cfset var rowObject = {}>
    
    <cfloop query="query">
        <cfset rowObject = {}>
        <cfloop list="#query.columnList#" index="column">
            <cfset rowObject[column] = query[column][query.currentRow]>
        </cfloop>
        <cfset arrayAppend(resultArray, rowObject)>
    </cfloop>
    
    <cfreturn resultArray>
    </cffunction>

    <cffunction name="getRequestJson" access="public" returntype="struct">
        <cfreturn deserializeJson(toString(getHttpRequestData().content))>
    </cffunction>
</cfcomponent>