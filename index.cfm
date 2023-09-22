<cfscript>
    variables.apiKey = createObject("java", "java.lang.System").getProperty("OPEN_WEATHER_API_KEY");
    forecasts = []
    error = ""

    if (structKeyExists(form, "city")) {
        variables.targetURL = 'https://api.openweathermap.org/data/2.5/forecast?q=' & form.city & '&cnt=45&appid=' & variables.apiKey & '&units=imperial';
    }
</cfscript>

<!-- Only make the HTTP request if targetURL is defined -->
<cfif structKeyExists(variables, "targetURL")>
    <cfhttp url="#variables.targetURL#" method="get" result="httpResult">
    </cfhttp>

    <cfscript>
        if (httpResult.statusCode == "200 OK") {
            responseContent = httpResult.fileContent;
            weatherData = deserializeJSON(responseContent)
            if (structKeyExists(weatherData, "list") AND isArray(weatherData.list)) {
                forecasts = weatherData.list;
            } else {
                // Handle the case where the expected 'list' key doesn't exist or isn't an array
                forecasts = [];
            }
        } else {
            error = "No city matches #form.city#"
        }
    </cfscript>
</cfif>


<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>5-Day Weather</title>
    <link href="/weatherapp/ostyles.css" rel="stylesheet" />
</head>

<body class="h-[100dvh] w-full bg-slate-200 flex flex-col">
    <nav class="bg-slate-400 bg-opacity-50 p-2">
        <h1 class="text-3xl font-extrabold">OPENWEATHER</h1>
    </nav>
    <main>
        <form class="p-2 flex gap-2" action="index.cfm" method="POST">
            <input name="city" type="text" class="p-2 sm:w-[40%]" placeholder="Enter your city..." />
            <button class="p-2 bg-gray-400 hover:bg-gray-300 rounded-full cursor-pointer" type="submit">Search</button>
        </form>
        <div class="flex gap-2 flex-col items-center">
            <cfoutput>
                <cfif structKeyExists(form, "city") && error EQ "">
                    <h1 class="text-3xl font-extrabold">#form.city#</h1>
                    <div class="flex flex-col sm:flex-row sm:flex-wrap gap-2 justify-center w-full">
                        <cfloop array="#forecasts#" index="forecast">
                            <div class="border border-1 p-2 sm:w-1/5 w-full shadow shadow-md shadow-black">
                                <h4>#forecast.dt_txt#</h4>
                                <p>Temperature: #forecast.main.temp#°F</p>
                                <p>Feels Like: #forecast.main.feels_like#°F</p>
                                <p>Condition: #forecast.weather[1].description#</p>
                                <img src="http://openweathermap.org/img/w/#forecast.weather[1].icon#.png" alt="#forecast.weather[1].description#">
                            </div>
                        </cfloop>
                    </div>
                </cfif>
                <cfif error NEQ "">
                    <p class="text-3xl font-extrabold">#error#</p>
                </cfif>
            </cfoutput>
        </div>
    </main>
</body>

</html>