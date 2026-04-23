pakiety do destination
```js
"@sap-cloud-sdk/connectivity": "^4.5.1",
"@sap-cloud-sdk/http-client": "^4.5.1",
```

url destination
```
https://api.openweathermap.org/data/2.5/weather
```

url query
```
URL.queries.appid
```

api key
```
b921176d3b0a85dfe476164576a78cd7
```

package.json
```js
      "cds": {
        "requires": {
          "Weather": {
            "kind": "rest",
            "credentials": {
              "destination": "Weather"
            }
          }
        }
  }
```

plik launch.json

```js
        {
          "type": "node",
          "request": "launch",
          "name": "Debug in hybrid mode",
          "runtimeExecutable": "cds",
          "args": [
            "watch",
            "--profile",
            "hybrid"
          ],
          "cwd": "${workspaceFolder}",
          "console": "integratedTerminal",
          "skipFiles": [
            "<node_internals>/**"
          ]
    }
```


handler getTemperatureFromApi

```js
 this.on('getTemperatureFromApi', Temperatures.drafts, async (req) => {
          let city = await SELECT.columns(['name']).from(Cities.drafts).where({ ID: req.params[1].ID });
          const weather = await cds.connect.to('weather')
          const cityName = city[0].name
          const weatherPath = `?q=${cityName}&units=metric&lang=pl`
          const response = await weather.send("GET", weatherPath)
          const data = response;
          const temperatureC = data.main?.temp;
          const feelsLikeC = data.main?.feels_like;
          const tempMinC = data.main?.temp_min;
          const tempMaxC = data.main?.temp_max;
          const pressureHPa = data.main?.pressure;
          const humidityPct = data.main?.humidity;
          const windSpeedMps = data.wind?.speed;
          const windDirectionDeg = data.wind?.deg;
          const visibility = data.visibility;
          const description = data.weather?.[0]?.description;
          const dt = data.dt;
          const entityPayload = {
              measuredAt: new Date(dt * 1000).toISOString(),
              temperatureC,
              feelsLikeC,
              tempMinC,
              tempMaxC,
              pressureHPa,
              humidityPct,
              windSpeedMps,
              windDirectionDeg,
              visibility,
              description
          };
          await UPDATE(Temperatures.drafts)
              .set(entityPayload)
              .where({ ID: req.params[2].ID });
    })
```

zapasowy klucz
```
7b03cc19159619004b1eac800fe4e390
```