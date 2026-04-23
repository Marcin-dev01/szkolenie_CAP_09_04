const cds = require('@sap/cds')

module.exports = class WeatherService extends cds.ApplicationService {
  init() {

    const { Voivodeships, Cities, Temperatures } = cds.entities('WeatherService')

    this.before('READ', Voivodeships, async (req) => {
      console.log('Before read')
    })

    this.after('READ', Voivodeships, async (voivodeships, req) => {
      console.log('After READ Voivodeships')
    })

    this.before('PATCH', Voivodeships.drafts, async (req) => {
      let { population } = req.data;
      if (parseInt(population) < 0) {
        req.error('population can not be under 0')
      }
    })

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

    this.before('SAVE', Voivodeships.drafts, async (req) => {
      console.log('EVENT SAVE');
    })

    this.on('getInfoBoundAction', Voivodeships, async (req) => {
      console.log('This is bound action')
    })

    this.on('getInfoBoundAction', Voivodeships.drafts, async (req) => {
      console.log('This is bound draft action')
    })

    this.on('getInfoUnboundAction', async (req) => {
      console.log('This is unbound action')
    })

    this.after('READ', Temperatures.drafts, async (temperatures) => {
      if (temperatures.length != 0) {
        let result = await SELECT.one().from(Temperatures.drafts).where({ ID: temperatures[0].ID })
        let { source_code } = result;
        if (source_code != null && source_code == "API") {
          temperatures[0].isButtonApiVisible = true;
        } else if (source_code != null && source_code == "MANUAL") {
          temperatures[0].isButtonApiVisible = false;
        }
      }
    });

    return super.init()
  }
}
