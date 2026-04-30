using {
    cuid,
    managed,
    sap.common.Countries
} from '@sap/cds/common';

using {Attachments} from '@cap-js/attachments';

namespace wa_tutorial;

entity Voivodeships : cuid, managed {
    country     : Association to Countries;
    name        : String(120) not null;
    capital     : String(120);
    Cities      : Composition of many Cities
                      on Cities.voivodeship = $self;
    population  : Integer64;
    fileName    : String;
    fileType    : String      @Core.IsMediaType;
    content     : LargeBinary @Core.MediaType           : fileType
                              @Core.AcceptableMediaTypes: ['image/jpeg']
                              @Core.ContentDisposition  : fileName;
    attachments : Composition of many Attachments;
}

entity Cities : cuid, managed {
    name         : String(120);
    postalCode   : String(12);
    population   : Integer64;
    voivodeship  : Association to Voivodeships not null;
    Temperatures : Composition of many Temperatures
                       on Temperatures.city = $self;
}

entity Temperatures : cuid, managed {
    city             : Association to Cities;
    source           : Association to Sources;
    measuredAt       : Timestamp not null;
    pressureHPa      : Integer;
    humidityPct      : Integer;
    windSpeedMps     : Decimal(6, 2);
    windDirectionDeg : Integer;
    visibility       : Integer;
    description      : String;
    temperatureC     : Decimal(5, 2);
    feelsLikeC       : Decimal(5, 2);
    tempMinC         : Decimal(5, 2);
    tempMaxC         : Decimal(5, 2);
    condition        : Association to WeatherConditions;
}

entity Sources {
    key code : source;
        text : String(60);
}

entity WeatherConditions {
    key code        : conditionsCode;
        criticality : Integer;
        displayText : String
}

type conditionsCode : String(1) enum {
    Good = 'G';
    Neutral = 'N';
    Bad = 'B';
}

type source         : String enum {
    API = 'API';
    MANUAL = 'MANUAL';
}
