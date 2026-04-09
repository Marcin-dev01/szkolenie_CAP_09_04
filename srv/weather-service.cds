using {wa_tutorial} from '../db/schema';

service WeatherService {
    entity Voivodeships as projection on wa_tutorial.Voivodeships;
    entity Cities        as projection on wa_tutorial.Cities;
    entity Temperatures  as projection on wa_tutorial.Temperatures;
    entity Sources       as projection on wa_tutorial.Sources;
}
