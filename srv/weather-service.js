const cds = require('@sap/cds')

module.exports = class WeatherService extends cds.ApplicationService {
  init() {

    const { Voivodeships } = cds.entities('WeatherService')

    this.before('READ', Voivodeships, async (req) => {
      console.log('Before read')
    })

    this.after('READ', Voivodeships, async (voivodeships, req) => {
      console.log('After READ Voivodeships')
    })


    return super.init()
  }
}
