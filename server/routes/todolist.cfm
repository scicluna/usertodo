<!--- Set the content type for JSON responses --->
<cfcontent type="application/json">
<cfset roleController = new usertable.server.controllers.TodoController()>
<cfset utilLibrary = new usertable.server.utils.JsonFunctions()>

<cftry>
    <!--- Switch based on HTTP method to determine action --->
    <cfswitch expression="#cgi.REQUEST_METHOD#">
        <cfcase value="GET" >
                    
        </cfcase>

        <cfcase value="POST" >
                    
        </cfcase>

        <cfcase value="PUT" >
                    
        </cfcase>

        <cfcase value="DELETE" >
                    
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