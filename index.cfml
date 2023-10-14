<cfscript>
</cfscript>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Template</title>
        <cfoutput>
            <link href="#GetDirectoryFromPath(CGI.SCRIPT_NAME)#/ostyles.css" rel="stylesheet" />
        </cfoutput>
    </head>
    <body class="h-[100dvh] w-[100dvw] bg-blue-500">
        <h1><cfoutput>#GetDirectoryFromPath(CGI.SCRIPT_NAME)#</cfoutput></h1>
    </body>
</html>