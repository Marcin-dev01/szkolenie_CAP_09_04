using {wa_tutorial} from '../db/schema';

service WeatherService {
    @odata.draft.enabled
    entity Voivodeships as projection on wa_tutorial.Voivodeships

        actions {
            action getInfoBoundAction();
        };

    action getInfoUnboundAction(counter : Integer);

    entity Cities       as projection on wa_tutorial.Cities;
    entity Temperatures as projection on wa_tutorial.Temperatures
    actions {
        action getTemperatureFromApi() returns Temperatures;
    }
    entity Sources      as projection on wa_tutorial.Sources;
}
