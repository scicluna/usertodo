<!--- Main Template --->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Template</title>
        <cfoutput>
            <!--- Dynmamically linked css file --->
            <link href="/#ListFirst(CGI.SCRIPT_NAME, "/")#/assets/css/ostyles.css" rel="stylesheet" />
        </cfoutput>
    </head>
    <body class="min-h-[100dvh] bg-slate-200">
        <!--- header --->
        <nav class="w-full">

        </nav>
        
        <!--- Content from nested layouts or pages will go here --->
        <section>
            <cfoutput>#includes.contentBlock#</cfoutput>
        </section>

        <!--- footer --->
        <footer class="w-full">

        </footer>
    </body>
</html>