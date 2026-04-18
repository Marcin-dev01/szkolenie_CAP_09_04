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

    this.before('PATCH', Voivodeships.drafts, async (req) => {
      let { population } = req.data;
      if (parseInt(population) < 0) {
        req.error('population can not be under 0')
      }
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

    return super.init()
  }
}
