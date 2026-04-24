using {wa_tutorial} from '../db/schema';

service WeatherService {
    @odata.draft.enabled
    entity Voivodeships as
        projection on wa_tutorial.Voivodeships {
            *,
            virtual virtualField : Integer
        }

        actions {
            action getInfoBoundAction();
        };

    action getInfoUnboundAction(counter: Integer);

    entity Cities       as projection on wa_tutorial.Cities;

    entity Temperatures as
        projection on wa_tutorial.Temperatures {
            *,
            virtual isButtonApiVisible : Boolean
        }
        actions {
            @(Common.SideEffects: {TargetEntities: ['in']})
            action getTemperatureFromApi() returns Temperatures;
        }

    entity Sources      as projection on wa_tutorial.Sources;
}
