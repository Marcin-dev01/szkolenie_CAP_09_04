using WeatherService as service from '../../srv/weather-service';
annotate service.Voivodeships with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'country_code',
                Value : country_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'capital',
                Value : capital,
            },
            {
                $Type : 'UI.DataField',
                Label : 'population',
                Value : population,
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'WeatherService.EntityContainer/getInfoUnboundAction',
                Label : 'getInfoUnboundAction',
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'WeatherService.getInfoBoundAction',
                Label : 'getInfoBoundAction',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Cities Information',
            ID : 'CitiesInformation',
            Target : 'Cities/@UI.LineItem#CitiesInformation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'country_code',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'capital',
            Value : capital,
        },
        {
            $Type : 'UI.DataField',
            Label : 'population',
            Value : population,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'WeatherService.EntityContainer/getInfoUnboundAction',
            Label : 'getInfoUnboundAction',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'WeatherService.getInfoBoundAction',
            Label : 'getInfoBoundAction',
        },
    ],
    UI.SelectionFields : [
        name,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Voivodeships with {
    name @Common.Label : 'name'
};

annotate service.Cities with @(
    UI.LineItem #CitiesInformation : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : population,
            Label : 'population',
        },
        {
            $Type : 'UI.DataField',
            Value : postalCode,
            Label : 'postalCode',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Cities Information',
            ID : 'CitiesInformation',
            Target : '@UI.FieldGroup#CitiesInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Weather',
            ID : 'Weather',
            Target : 'Temperatures/@UI.LineItem#Weather',
        },
    ],
    UI.FieldGroup #CitiesInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : population,
                Label : 'population',
            },
            {
                $Type : 'UI.DataField',
                Value : postalCode,
                Label : 'postalCode',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Temperatures with @(
    UI.LineItem #Weather : [
        {
            $Type : 'UI.DataField',
            Value : condition_code,
            Label : 'condition_code',
        },
        {
            $Type : 'UI.DataField',
            Value : measuredAt,
            Label : 'measuredAt',
        },
        {
            $Type : 'UI.DataField',
            Value : pressureHPa,
            Label : 'pressureHPa',
        },
        {
            $Type : 'UI.DataField',
            Value : temperatureC,
            Label : 'temperatureC',
        },
        {
            $Type : 'UI.DataField',
            Value : windSpeedMps,
            Label : 'windSpeedMps',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Source',
            ID : 'Source',
            Target : '@UI.FieldGroup#Source',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Measurement',
            ID : 'Measurement',
            Target : '@UI.FieldGroup#Measurement',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'History',
            ID : 'History',
            Target : '@UI.FieldGroup#History',
        },
    ],
    UI.FieldGroup #Source : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : source_code,
                Label : 'source_code',
            },
            {
                $Type : 'UI.DataField',
                Value : measuredAt,
                Label : 'measuredAt',
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : city.name,
                Label : 'name',
            },
        ],
    },
    UI.FieldGroup #Measurement : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : temperatureC,
                Label : 'temperatureC',
            },
            {
                $Type : 'UI.DataField',
                Value : tempMaxC,
                Label : 'tempMaxC',
            },
            {
                $Type : 'UI.DataField',
                Value : tempMinC,
                Label : 'tempMinC',
            },
            {
                $Type : 'UI.DataField',
                Value : pressureHPa,
                Label : 'pressureHPa',
            },
            {
                $Type : 'UI.DataField',
                Value : visibility,
                Label : 'visibility',
            },
            {
                $Type : 'UI.DataField',
                Value : windDirectionDeg,
                Label : 'windDirectionDeg',
            },
            {
                $Type : 'UI.DataField',
                Value : windSpeedMps,
                Label : 'windSpeedMps',
            },
            {
                $Type : 'UI.DataField',
                Value : condition_code,
                Label : 'condition_code',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : measuredAt,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.FieldGroup #History : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
);

