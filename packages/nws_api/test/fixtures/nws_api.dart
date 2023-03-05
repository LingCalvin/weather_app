const dailyForecastResponseBody = '''{
  "@context": [
    "https://geojson.org/geojson-ld/geojson-context.jsonld",
    {
      "@version": "1.1",
      "wx": "https://api.weather.gov/ontology#",
      "geo": "http://www.opengis.net/ont/geosparql#",
      "unit": "http://codes.wmo.int/common/unit/",
      "@vocab": "https://api.weather.gov/ontology#"
    }
  ],
  "type": "Feature",
  "geometry": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -73.9830679,
          40.7887016
        ],
        [
          -73.9875421,
          40.767019000000005
        ],
        [
          -73.9589182,
          40.763629400000006
        ],
        [
          -73.954438,
          40.78531160000001
        ],
        [
          -73.9830679,
          40.7887016
        ]
      ]
    ]
  },
  "properties": {
    "updated": "2023-03-02T02:26:00+00:00",
    "units": "us",
    "forecastGenerator": "BaselineForecastGenerator",
    "generatedAt": "2023-03-02T07:24:39+00:00",
    "updateTime": "2023-03-02T02:26:00+00:00",
    "validTimes": "2023-03-01T20:00:00+00:00/P7DT11H",
    "elevation": {
      "unitCode": "wmoUnit:m",
      "value": 24.9936
    },
    "periods": [
      {
        "number": 1,
        "name": "Overnight",
        "startTime": "2023-03-02T02:00:00-05:00",
        "endTime": "2023-03-02T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 5
        },
        "temperatureTrend": "rising",
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 60
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 4.444444444444445
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 89
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 3.704
        },
        "windGust": null,
        "windDirection": "NE",
        "icon": "https://api.weather.gov/icons/land/night/rain,60?size=medium",
        "shortForecast": "Light Rain Likely",
        "detailedForecast": "Rain likely and patchy drizzle and patchy fog. Cloudy. Low around 41, with temperatures rising to around 43 overnight. Northeast wind around 2 mph. Chance of precipitation is 60%."
      },
      {
        "number": 2,
        "name": "Thursday",
        "startTime": "2023-03-02T06:00:00-05:00",
        "endTime": "2023-03-02T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 13.333333333333334
        },
        "temperatureTrend": "falling",
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 60
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 6.111111111111111
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 89
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 24.076,
          "minValue": 1.852
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/day/rain,60/rain,30?size=medium",
        "shortForecast": "Light Rain Likely",
        "detailedForecast": "Rain likely and patchy fog before 1pm. Partly sunny. High near 56, with temperatures falling to around 52 in the afternoon. Northwest wind 1 to 15 mph. Chance of precipitation is 60%. New rainfall amounts less than a tenth of an inch possible."
      },
      {
        "number": 3,
        "name": "Thursday Night",
        "startTime": "2023-03-02T18:00:00-05:00",
        "endTime": "2023-03-03T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 1.6666666666666667
        },
        "temperatureTrend": "rising",
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 0
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 64
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 24.076,
          "minValue": 11.112
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/night/sct?size=medium",
        "shortForecast": "Partly Cloudy",
        "detailedForecast": "Partly cloudy. Low around 35, with temperatures rising to around 37 overnight. Northwest wind 7 to 15 mph."
      },
      {
        "number": 4,
        "name": "Friday",
        "startTime": "2023-03-03T06:00:00-05:00",
        "endTime": "2023-03-03T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 7.222222222222222
        },
        "temperatureTrend": "falling",
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 50
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -3.888888888888889
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 64
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 14.816,
          "minValue": 9.26
        },
        "windGust": null,
        "windDirection": "NE",
        "icon": "https://api.weather.gov/icons/land/day/bkn/rain,50?size=medium",
        "shortForecast": "Mostly Cloudy then Chance Light Rain",
        "detailedForecast": "A chance of rain after 1pm. Mostly cloudy. High near 45, with temperatures falling to around 42 in the afternoon. Northeast wind 6 to 9 mph. Chance of precipitation is 50%. New rainfall amounts less than a tenth of an inch possible."
      },
      {
        "number": 5,
        "name": "Friday Night",
        "startTime": "2023-03-03T18:00:00-05:00",
        "endTime": "2023-03-04T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 5
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 100
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 2.7777777777777777
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 82
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 37.04,
          "minValue": 18.52
        },
        "windGust": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 57.412
        },
        "windDirection": "E",
        "icon": "https://api.weather.gov/icons/land/night/rain,90/rain,100?size=medium",
        "shortForecast": "Rain",
        "detailedForecast": "Rain. Cloudy, with a low around 41. East wind 12 to 23 mph, with gusts as high as 36 mph. Chance of precipitation is 100%. New rainfall amounts between 1 and 2 inches possible."
      },
      {
        "number": 6,
        "name": "Saturday",
        "startTime": "2023-03-04T06:00:00-05:00",
        "endTime": "2023-03-04T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 8.333333333333334
        },
        "temperatureTrend": "falling",
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 100
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 2.7777777777777777
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 79
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 27.78,
          "minValue": 16.668
        },
        "windGust": null,
        "windDirection": "N",
        "icon": "https://api.weather.gov/icons/land/day/rain,100/rain,60?size=medium",
        "shortForecast": "Rain",
        "detailedForecast": "Rain. Mostly cloudy. High near 47, with temperatures falling to around 44 in the afternoon. Chance of precipitation is 100%. New rainfall amounts between a half and three quarters of an inch possible."
      },
      {
        "number": 7,
        "name": "Saturday Night",
        "startTime": "2023-03-04T18:00:00-05:00",
        "endTime": "2023-03-05T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 2.7777777777777777
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 0
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 73
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 16.668,
          "minValue": 11.112
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/night/rain/snow?size=medium",
        "shortForecast": "Slight Chance Light Rain then Slight Chance Rain And Snow",
        "detailedForecast": "A slight chance of rain before 1am, then a slight chance of rain and snow. Mostly cloudy, with a low around 37."
      },
      {
        "number": 8,
        "name": "Sunday",
        "startTime": "2023-03-05T06:00:00-05:00",
        "endTime": "2023-03-05T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 8.88888888888889
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -1.6666666666666667
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 72
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 27.78,
          "minValue": 12.964
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/day/snow/sct?size=medium",
        "shortForecast": "Slight Chance Rain And Snow then Mostly Sunny",
        "detailedForecast": "A slight chance of rain and snow before 7am. Mostly sunny, with a high near 48."
      },
      {
        "number": 9,
        "name": "Sunday Night",
        "startTime": "2023-03-05T18:00:00-05:00",
        "endTime": "2023-03-06T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 1.6666666666666667
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -3.888888888888889
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 59
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 25.928,
          "minValue": 20.372
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/night/few?size=medium",
        "shortForecast": "Mostly Clear",
        "detailedForecast": "Mostly clear, with a low around 35."
      },
      {
        "number": 10,
        "name": "Monday",
        "startTime": "2023-03-06T06:00:00-05:00",
        "endTime": "2023-03-06T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 9.444444444444445
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -3.3333333333333335
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 64
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 25.928,
          "minValue": 20.372
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/day/few?size=medium",
        "shortForecast": "Sunny",
        "detailedForecast": "Sunny, with a high near 49."
      },
      {
        "number": 11,
        "name": "Monday Night",
        "startTime": "2023-03-06T18:00:00-05:00",
        "endTime": "2023-03-07T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 2.7777777777777777
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -3.3333333333333335
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 57
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 24.076,
          "minValue": 18.52
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/night/sct?size=medium",
        "shortForecast": "Partly Cloudy",
        "detailedForecast": "Partly cloudy, with a low around 37."
      },
      {
        "number": 12,
        "name": "Tuesday",
        "startTime": "2023-03-07T06:00:00-05:00",
        "endTime": "2023-03-07T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 10
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -2.7777777777777777
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 57
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 22.224
        },
        "windGust": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 42.596
        },
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/day/rain?size=medium",
        "shortForecast": "Slight Chance Light Rain",
        "detailedForecast": "A slight chance of rain between 7am and 1pm. Partly sunny, with a high near 50."
      },
      {
        "number": 13,
        "name": "Tuesday Night",
        "startTime": "2023-03-07T18:00:00-05:00",
        "endTime": "2023-03-08T06:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 0.5555555555555556
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -4.444444444444445
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 54
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 24.076
        },
        "windGust": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 44.448
        },
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/night/sct?size=medium",
        "shortForecast": "Partly Cloudy",
        "detailedForecast": "Partly cloudy, with a low around 33."
      },
      {
        "number": 14,
        "name": "Wednesday",
        "startTime": "2023-03-08T06:00:00-05:00",
        "endTime": "2023-03-08T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 7.222222222222222
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": null
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": -6.666666666666667
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 52
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "maxValue": 27.78,
          "minValue": 22.224
        },
        "windGust": null,
        "windDirection": "NW",
        "icon": "https://api.weather.gov/icons/land/day/few?size=medium",
        "shortForecast": "Sunny",
        "detailedForecast": "Sunny, with a high near 45."
      }
    ]
  }
}''';

const pointResponseBody = '''{
    "@context": [
        "https://geojson.org/geojson-ld/geojson-context.jsonld",
        {
            "@version": "1.1",
            "wx": "https://api.weather.gov/ontology#",
            "s": "https://schema.org/",
            "geo": "http://www.opengis.net/ont/geosparql#",
            "unit": "http://codes.wmo.int/common/unit/",
            "@vocab": "https://api.weather.gov/ontology#",
            "geometry": {
                "@id": "s:GeoCoordinates",
                "@type": "geo:wktLiteral"
            },
            "city": "s:addressLocality",
            "state": "s:addressRegion",
            "distance": {
                "@id": "s:Distance",
                "@type": "s:QuantitativeValue"
            },
            "bearing": {
                "@type": "s:QuantitativeValue"
            },
            "value": {
                "@id": "s:value"
            },
            "unitCode": {
                "@id": "s:unitCode",
                "@type": "@id"
            },
            "forecastOffice": {
                "@type": "@id"
            },
            "forecastGridData": {
                "@type": "@id"
            },
            "publicZone": {
                "@type": "@id"
            },
            "county": {
                "@type": "@id"
            }
        }
    ],
    "id": "https://api.weather.gov/points/40.7831,-73.9712",
    "type": "Feature",
    "geometry": {
        "type": "Point",
        "coordinates": [
            -73.971199999999996,
            40.783099999999997
        ]
    },
    "properties": {
        "@id": "https://api.weather.gov/points/40.7831,-73.9712",
        "@type": "wx:Point",
        "cwa": "OKX",
        "forecastOffice": "https://api.weather.gov/offices/OKX",
        "gridId": "OKX",
        "gridX": 33,
        "gridY": 37,
        "forecast": "https://api.weather.gov/gridpoints/OKX/33,37/forecast",
        "forecastHourly": "https://api.weather.gov/gridpoints/OKX/33,37/forecast/hourly",
        "forecastGridData": "https://api.weather.gov/gridpoints/OKX/33,37",
        "observationStations": "https://api.weather.gov/gridpoints/OKX/33,37/stations",
        "relativeLocation": {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -74.004571999999996,
                    40.792783999999997
                ]
            },
            "properties": {
                "city": "Guttenberg",
                "state": "NJ",
                "distance": {
                    "unitCode": "wmoUnit:m",
                    "value": 3008.8545696986998
                },
                "bearing": {
                    "unitCode": "wmoUnit:degree_(angle)",
                    "value": 110
                }
            }
        },
        "forecastZone": "https://api.weather.gov/zones/forecast/NYZ072",
        "county": "https://api.weather.gov/zones/county/NYC061",
        "fireWeatherZone": "https://api.weather.gov/zones/fire/NYZ072",
        "timeZone": "America/New_York",
        "radarStation": "KOKX"
    }
}''';

const pointBadRequestResponseBody = r'''{
  "correlationId": "3fb55835",
  "title": "Invalid Parameter",
  "type": "https://api.weather.gov/problems/InvalidParameter",
  "status": 400,
  "detail": "Parameter \"point\" is invalid: '999,999' does not appear to be a valid coordinate",
  "instance": "https://api.weather.gov/requests/3fb55835"
}''';

const internalServerErrorResponseBody = '''{
    "correlationId": "3fc21463",
    "title": "Unexpected Problem",
    "type": "https://api.weather.gov/problems/UnexpectedProblem",
    "status": 500,
    "detail": "An unexpected problem has occurred.",
    "instance": "https://api.weather.gov/requests/3fc21463"
}''';

const hourlyGridpointForecastResponseBody = '''{
  "@context": [
    "https://geojson.org/geojson-ld/geojson-context.jsonld",
    {
      "@version": "1.1",
      "wx": "https://api.weather.gov/ontology#",
      "geo": "http://www.opengis.net/ont/geosparql#",
      "unit": "http://codes.wmo.int/common/unit/",
      "@vocab": "https://api.weather.gov/ontology#"
    }
  ],
  "type": "Feature",
  "geometry": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -73.9830679,
          40.7887016
        ],
        [
          -73.9875421,
          40.767019000000005
        ],
        [
          -73.9589182,
          40.763629400000006
        ],
        [
          -73.954438,
          40.78531160000001
        ],
        [
          -73.9830679,
          40.7887016
        ]
      ]
    ]
  },
  "properties": {
    "updated": "2023-03-04T20:13:00+00:00",
    "units": "us",
    "forecastGenerator": "HourlyForecastGenerator",
    "generatedAt": "2023-03-04T21:24:33+00:00",
    "updateTime": "2023-03-04T20:13:00+00:00",
    "validTimes": "2023-03-04T14:00:00+00:00/P7DT23H",
    "elevation": {
      "unitCode": "wmoUnit:m",
      "value": 24.9936
    },
    "periods": [
      {
        "number": 1,
        "name": "",
        "startTime": "2023-03-04T16:00:00-05:00",
        "endTime": "2023-03-04T17:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 6.666666666666667
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 2
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 1.1111111111111112
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 68
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 18.52
        },
        "windGust": null,
        "windDirection": "N",
        "icon": "https://api.weather.gov/icons/land/day/ovc,2?size=small",
        "shortForecast": "Cloudy",
        "detailedForecast": ""
      },
      {
        "number": 2,
        "name": "",
        "startTime": "2023-03-04T17:00:00-05:00",
        "endTime": "2023-03-04T18:00:00-05:00",
        "isDaytime": true,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 6.666666666666667
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 2
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 1.1111111111111112
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 68
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 16.668
        },
        "windGust": null,
        "windDirection": "N",
        "icon": "https://api.weather.gov/icons/land/day/ovc,2?size=small",
        "shortForecast": "Cloudy",
        "detailedForecast": ""
      },
      {
        "number": 3,
        "name": "",
        "startTime": "2023-03-04T18:00:00-05:00",
        "endTime": "2023-03-04T19:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 6.666666666666667
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 3
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 1.1111111111111112
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 68
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 14.816
        },
        "windGust": null,
        "windDirection": "N",
        "icon": "https://api.weather.gov/icons/land/night/bkn,3?size=small",
        "shortForecast": "Mostly Cloudy",
        "detailedForecast": ""
      },
      {
        "number": 4,
        "name": "",
        "startTime": "2023-03-04T19:00:00-05:00",
        "endTime": "2023-03-04T20:00:00-05:00",
        "isDaytime": false,
        "temperature": {
          "unitCode": "wmoUnit:degC",
          "value": 6.111111111111111
        },
        "temperatureTrend": null,
        "probabilityOfPrecipitation": {
          "unitCode": "wmoUnit:percent",
          "value": 3
        },
        "dewpoint": {
          "unitCode": "wmoUnit:degC",
          "value": 0.5555555555555556
        },
        "relativeHumidity": {
          "unitCode": "wmoUnit:percent",
          "value": 67
        },
        "windSpeed": {
          "unitCode": "wmoUnit:km_h-1",
          "value": 12.964
        },
        "windGust": null,
        "windDirection": "N",
        "icon": "https://api.weather.gov/icons/land/night/bkn,3?size=small",
        "shortForecast": "Mostly Cloudy",
        "detailedForecast": ""
      }
    ]
  }
}''';

const latestStationObservationResponseBody = r'''{
  "@context": [
    "https://geojson.org/geojson-ld/geojson-context.jsonld",
    {
      "@version": "1.1",
      "wx": "https://api.weather.gov/ontology#",
      "s": "https://schema.org/",
      "geo": "http://www.opengis.net/ont/geosparql#",
      "unit": "http://codes.wmo.int/common/unit/",
      "@vocab": "https://api.weather.gov/ontology#",
      "geometry": {
        "@id": "s:GeoCoordinates",
        "@type": "geo:wktLiteral"
      },
      "city": "s:addressLocality",
      "state": "s:addressRegion",
      "distance": {
        "@id": "s:Distance",
        "@type": "s:QuantitativeValue"
      },
      "bearing": {
        "@type": "s:QuantitativeValue"
      },
      "value": {
        "@id": "s:value"
      },
      "unitCode": {
        "@id": "s:unitCode",
        "@type": "@id"
      },
      "forecastOffice": {
        "@type": "@id"
      },
      "forecastGridData": {
        "@type": "@id"
      },
      "publicZone": {
        "@type": "@id"
      },
      "county": {
        "@type": "@id"
      }
    }
  ],
  "id": "https://api.weather.gov/stations/KNYC/observations/2023-03-04T20:51:00+00:00",
  "type": "Feature",
  "geometry": {
    "type": "Point",
    "coordinates": [
      -73.98,
      40.77
    ]
  },
  "properties": {
    "@id": "https://api.weather.gov/stations/KNYC/observations/2023-03-04T20:51:00+00:00",
    "@type": "wx:ObservationStation",
    "elevation": {
      "unitCode": "wmoUnit:m",
      "value": 27
    },
    "station": "https://api.weather.gov/stations/KNYC",
    "timestamp": "2023-03-04T20:51:00+00:00",
    "rawMessage": "KNYC 042051Z AUTO 30005KT 10SM BKN026 OVC033 07/01 A2974 RMK AO2 SLP062 T00670011 53050 $",
    "textDescription": "Cloudy",
    "icon": "https://api.weather.gov/icons/land/day/ovc?size=medium",
    "presentWeather": [],
    "temperature": {
      "unitCode": "wmoUnit:degC",
      "value": 6.7,
      "qualityControl": "V"
    },
    "dewpoint": {
      "unitCode": "wmoUnit:degC",
      "value": 1.1,
      "qualityControl": "V"
    },
    "windDirection": {
      "unitCode": "wmoUnit:degree_(angle)",
      "value": 300,
      "qualityControl": "V"
    },
    "windSpeed": {
      "unitCode": "wmoUnit:km_h-1",
      "value": 9.36,
      "qualityControl": "V"
    },
    "windGust": {
      "unitCode": "wmoUnit:km_h-1",
      "value": null,
      "qualityControl": "Z"
    },
    "barometricPressure": {
      "unitCode": "wmoUnit:Pa",
      "value": null,
      "qualityControl": "Z"
    },
    "seaLevelPressure": {
      "unitCode": "wmoUnit:Pa",
      "value": 100620,
      "qualityControl": "V"
    },
    "visibility": {
      "unitCode": "wmoUnit:m",
      "value": 16090,
      "qualityControl": "C"
    },
    "maxTemperatureLast24Hours": {
      "unitCode": "wmoUnit:degC",
      "value": null
    },
    "minTemperatureLast24Hours": {
      "unitCode": "wmoUnit:degC",
      "value": null
    },
    "precipitationLastHour": {
      "unitCode": "wmoUnit:mm",
      "value": null,
      "qualityControl": "Z"
    },
    "precipitationLast3Hours": {
      "unitCode": "wmoUnit:mm",
      "value": null,
      "qualityControl": "Z"
    },
    "precipitationLast6Hours": {
      "unitCode": "wmoUnit:mm",
      "value": null,
      "qualityControl": "Z"
    },
    "relativeHumidity": {
      "unitCode": "wmoUnit:percent",
      "value": 67.473831002484,
      "qualityControl": "V"
    },
    "windChill": {
      "unitCode": "wmoUnit:degC",
      "value": 4.836307715660555,
      "qualityControl": "V"
    },
    "heatIndex": {
      "unitCode": "wmoUnit:degC",
      "value": null,
      "qualityControl": "V"
    },
    "cloudLayers": [
      {
        "base": {
          "unitCode": "wmoUnit:m",
          "value": 790
        },
        "amount": "BKN"
      },
      {
        "base": {
          "unitCode": "wmoUnit:m",
          "value": 1010
        },
        "amount": "OVC"
      }
    ]
  }
}''';

const gridpointObservationStationsResponseBody = r'''{
  "@context": [
    "https://geojson.org/geojson-ld/geojson-context.jsonld",
    {
      "@version": "1.1",
      "wx": "https://api.weather.gov/ontology#",
      "s": "https://schema.org/",
      "geo": "http://www.opengis.net/ont/geosparql#",
      "unit": "http://codes.wmo.int/common/unit/",
      "@vocab": "https://api.weather.gov/ontology#",
      "geometry": {
        "@id": "s:GeoCoordinates",
        "@type": "geo:wktLiteral"
      },
      "city": "s:addressLocality",
      "state": "s:addressRegion",
      "distance": {
        "@id": "s:Distance",
        "@type": "s:QuantitativeValue"
      },
      "bearing": {
        "@type": "s:QuantitativeValue"
      },
      "value": {
        "@id": "s:value"
      },
      "unitCode": {
        "@id": "s:unitCode",
        "@type": "@id"
      },
      "forecastOffice": {
        "@type": "@id"
      },
      "forecastGridData": {
        "@type": "@id"
      },
      "publicZone": {
        "@type": "@id"
      },
      "county": {
        "@type": "@id"
      },
      "observationStations": {
        "@container": "@list",
        "@type": "@id"
      }
    }
  ],
  "type": "FeatureCollection",
  "features": [
    {
      "id": "https://api.weather.gov/stations/KNYC",
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          -73.9666699,
          40.78333
        ]
      },
      "properties": {
        "@id": "https://api.weather.gov/stations/KNYC",
        "@type": "wx:ObservationStation",
        "elevation": {
          "unitCode": "wmoUnit:m",
          "value": 46.9392
        },
        "stationIdentifier": "KNYC",
        "name": "New York City, Central Park",
        "timeZone": "America/New_York",
        "forecast": "https://api.weather.gov/zones/forecast/NYZ072",
        "county": "https://api.weather.gov/zones/county/NYC061",
        "fireWeatherZone": "https://api.weather.gov/zones/fire/NYZ072"
      }
    },
    {
      "id": "https://api.weather.gov/stations/KLGA",
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          -73.88,
          40.77917
        ]
      },
      "properties": {
        "@id": "https://api.weather.gov/stations/KLGA",
        "@type": "wx:ObservationStation",
        "elevation": {
          "unitCode": "wmoUnit:m",
          "value": 6.096
        },
        "stationIdentifier": "KLGA",
        "name": "New York, La Guardia Airport",
        "timeZone": "America/New_York",
        "forecast": "https://api.weather.gov/zones/forecast/NYZ176",
        "county": "https://api.weather.gov/zones/county/NYC081",
        "fireWeatherZone": "https://api.weather.gov/zones/fire/NYZ176"
      }
    },
    {
      "id": "https://api.weather.gov/stations/KTEB",
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [
          -74.05667,
          40.85889
        ]
      },
      "properties": {
        "@id": "https://api.weather.gov/stations/KTEB",
        "@type": "wx:ObservationStation",
        "elevation": {
          "unitCode": "wmoUnit:m",
          "value": 2.1336
        },
        "stationIdentifier": "KTEB",
        "name": "Teterboro, Teterboro Airport",
        "timeZone": "America/New_York",
        "forecast": "https://api.weather.gov/zones/forecast/NJZ104",
        "county": "https://api.weather.gov/zones/county/NJC003",
        "fireWeatherZone": "https://api.weather.gov/zones/fire/NJZ104"
      }
    }
  ],
  "observationStations": [
    "https://api.weather.gov/stations/KNYC",
    "https://api.weather.gov/stations/KLGA",
    "https://api.weather.gov/stations/KTEB"
  ],
  "pagination": {
    "next": "https://api.weather.gov/stations?id%5B0%5D=K12N&id%5B1%5D=KBAF&id%5B2%5D=KBDL&id%5B3%5D=KBDR&id%5B4%5D=KBID&id%5B5%5D=KBLM&id%5B6%5D=KCDW&id%5B7%5D=KCEF&id%5B8%5D=KDXR&id%5B9%5D=KEWR&id%5B10%5D=KFOK&id%5B11%5D=KFRG&id%5B12%5D=KFWN&id%5B13%5D=KGON&id%5B14%5D=KHFD&id%5B15%5D=KHPN&id%5B16%5D=KHVN&id%5B17%5D=KHWV&id%5B18%5D=KIJD&id%5B19%5D=KISP&id%5B20%5D=KJFK&id%5B21%5D=KLGA&id%5B22%5D=KMGJ&id%5B23%5D=KMJX&id%5B24%5D=KMMK&id%5B25%5D=KMMU&id%5B26%5D=KMSV&id%5B27%5D=KMTP&id%5B28%5D=KNEL&id%5B29%5D=KNYC&id%5B30%5D=KORH&id%5B31%5D=KOXC&id%5B32%5D=KPNE&id%5B33%5D=KPOU&id%5B34%5D=KSMQ&id%5B35%5D=KSWF&id%5B36%5D=KTEB&id%5B37%5D=KTTN&id%5B38%5D=KWRI&id%5B39%5D=KWST&cursor=eyJzIjo1MDB9"
  }
}''';
