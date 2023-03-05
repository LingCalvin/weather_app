import 'package:nws_api/nws_api.dart';

final gridpointForecastGeoJson = GridpointForecastGeoJson.fromJson({
  '@context': [
    'https://geojson.org/geojson-ld/geojson-context.jsonld',
    {
      '@version': '1.1',
      'wx': 'https://api.weather.gov/ontology#',
      'geo': 'http://www.opengis.net/ont/geosparql#',
      'unit': 'http://codes.wmo.int/common/unit/',
      '@vocab': 'https://api.weather.gov/ontology#'
    }
  ],
  'type': 'Feature',
  'geometry': {
    'type': 'Polygon',
    'coordinates': [
      [
        [-73.9830679, 40.7887016],
        [-73.9875421, 40.767019000000005],
        [-73.9589182, 40.763629400000006],
        [-73.954438, 40.78531160000001],
        [-73.9830679, 40.7887016]
      ]
    ]
  },
  'properties': {
    'updated': '2023-03-03T16:55:37+00:00',
    'units': 'us',
    'forecastGenerator': 'BaselineForecastGenerator',
    'generatedAt': '2023-03-03T19:46:20+00:00',
    'updateTime': '2023-03-03T16:55:37+00:00',
    'validTimes': '2023-03-03T10:00:00+00:00/P7DT3H',
    'elevation': {'unitCode': 'wmoUnit:m', 'value': 24.9936},
    'periods': [
      {
        'number': 1,
        'name': 'This Afternoon',
        'startTime': '2023-03-03T14:00:00-05:00',
        'endTime': '2023-03-03T18:00:00-05:00',
        'isDaytime': true,
        'temperature': {'unitCode': 'wmoUnit:degC', 'value': 8.333333333333334},
        'temperatureTrend': 'falling',
        'probabilityOfPrecipitation': {
          'unitCode': 'wmoUnit:percent',
          'value': 40
        },
        'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': -2.7777777777777777},
        'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 51},
        'windSpeed': {'unitCode': 'wmoUnit:km_h-1', 'value': 16.668},
        'windGust': null,
        'windDirection': 'E',
        'icon': 'https://api.weather.gov/icons/land/day/snow,40?size=medium',
        'shortForecast': 'Chance Rain And Snow',
        'detailedForecast':
            'A chance of rain and snow after 5pm. Cloudy. High near 47, with temperatures falling to around 44 in the afternoon. East wind around 10 mph. Chance of precipitation is 40%.'
      },
      {
        'number': 2,
        'name': 'Tonight',
        'startTime': '2023-03-03T18:00:00-05:00',
        'endTime': '2023-03-04T06:00:00-05:00',
        'isDaytime': false,
        'temperature': {'unitCode': 'wmoUnit:degC', 'value': 5},
        'temperatureTrend': 'rising',
        'probabilityOfPrecipitation': {
          'unitCode': 'wmoUnit:percent',
          'value': 100
        },
        'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 4.444444444444445},
        'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 86},
        'windSpeed': {
          'unitCode': 'wmoUnit:km_h-1',
          'maxValue': 35.188,
          'minValue': 18.52
        },
        'windGust': {'unitCode': 'wmoUnit:km_h-1', 'value': 51.856},
        'windDirection': 'E',
        'icon': 'https://api.weather.gov/icons/land/night/snow,100?size=medium',
        'shortForecast': 'Rain And Snow',
        'detailedForecast':
            'Rain and snow. Cloudy. Low around 41, with temperatures rising to around 44 overnight. East wind 12 to 22 mph, with gusts as high as 32 mph. Chance of precipitation is 100%. New rainfall amounts between 1 and 2 inches possible.'
      },
      {
        'number': 3,
        'name': 'Saturday',
        'startTime': '2023-03-04T06:00:00-05:00',
        'endTime': '2023-03-04T18:00:00-05:00',
        'isDaytime': true,
        'temperature': {'unitCode': 'wmoUnit:degC', 'value': 7.777777777777778},
        'temperatureTrend': 'falling',
        'probabilityOfPrecipitation': {
          'unitCode': 'wmoUnit:percent',
          'value': 100
        },
        'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 4.444444444444445},
        'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 86},
        'windSpeed': {
          'unitCode': 'wmoUnit:km_h-1',
          'maxValue': 25.928,
          'minValue': 18.52
        },
        'windGust': {'unitCode': 'wmoUnit:km_h-1', 'value': 42.596},
        'windDirection': 'N',
        'icon':
            'https://api.weather.gov/icons/land/day/rain,100/rain,50?size=medium',
        'shortForecast': 'Light Rain',
        'detailedForecast':
            'Rain before 1pm. Cloudy. High near 46, with temperatures falling to around 43 in the afternoon. North wind 12 to 16 mph, with gusts as high as 26 mph. Chance of precipitation is 100%. New rainfall amounts between three quarters and one inch possible.'
      },
    ]
  }
});
