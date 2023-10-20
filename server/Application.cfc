<cfcomponent>
    <!--- Application settings --->
    <cfset THIS.Name = "YourAppName">
    <cfset THIS.ApplicationTimeout = CreateTimeSpan(0,1,0,0)>
    <cfset THIS.SessionManagement = true>
    <cfset THIS.SessionTimeout = CreateTimeSpan(0,0,30,0)>
    <cfset THIS.ormEnabled = true>
    <cfset THIS.datasource = "usertable">

    <!--- Handle CORS and Preflight Requests --->
    <cffunction name="onRequestStart">
        <!--- Set CORS headers --->
        <cfheader name="Access-Control-Allow-Origin" value="http://localhost:3000">
        <cfheader name="Access-Control-Allow-Methods" value="GET,POST,PUT,DELETE,OPTIONS">
        <cfheader name="Access-Control-Allow-Headers" value="Content-Type,Authorization">

        <!--- Handle preflight requests --->
        <cfif CGI.REQUEST_METHOD IS "OPTIONS">
            <cfheader statuscode="204" statustext="No Content">
            <cfabort>
        </cfif>
    </cffunction>
</cfcomponent>
