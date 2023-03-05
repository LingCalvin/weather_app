import 'package:nws_api/nws_api.dart';

final pointGeoJson = PointGeoJson.fromJson({
  '@context': [
    'https://geojson.org/geojson-ld/geojson-context.jsonld',
    {
      '@version': '1.1',
      'wx': 'https://api.weather.gov/ontology#',
      's': 'https://schema.org/',
      'geo': 'http://www.opengis.net/ont/geosparql#',
      'unit': 'http://codes.wmo.int/common/unit/',
      '@vocab': 'https://api.weather.gov/ontology#',
      'geometry': {'@id': 's:GeoCoordinates', '@type': 'geo:wktLiteral'},
      'city': 's:addressLocality',
      'state': 's:addressRegion',
      'distance': {'@id': 's:Distance', '@type': 's:QuantitativeValue'},
      'bearing': {'@type': 's:QuantitativeValue'},
      'value': {'@id': 's:value'},
      'unitCode': {'@id': 's:unitCode', '@type': '@id'},
      'forecastOffice': {'@type': '@id'},
      'forecastGridData': {'@type': '@id'},
      'publicZone': {'@type': '@id'},
      'county': {'@type': '@id'}
    }
  ],
  'id': 'https://api.weather.gov/points/40.7831,-73.9712',
  'type': 'Feature',
  'geometry': {
    'type': 'Point',
    'coordinates': [-73.971199999999996, 40.783099999999997]
  },
  'properties': {
    '@id': 'https://api.weather.gov/points/40.7831,-73.9712',
    '@type': 'wx:Point',
    'cwa': 'OKX',
    'forecastOffice': 'https://api.weather.gov/offices/OKX',
    'gridId': 'OKX',
    'gridX': 33,
    'gridY': 37,
    'forecast': 'https://api.weather.gov/gridpoints/OKX/33,37/forecast',
    'forecastHourly':
        'https://api.weather.gov/gridpoints/OKX/33,37/forecast/hourly',
    'forecastGridData': 'https://api.weather.gov/gridpoints/OKX/33,37',
    'observationStations':
        'https://api.weather.gov/gridpoints/OKX/33,37/stations',
    'relativeLocation': {
      'type': 'Feature',
      'geometry': {
        'type': 'Point',
        'coordinates': [-74.004571999999996, 40.792783999999997]
      },
      'properties': {
        'city': 'Guttenberg',
        'state': 'NJ',
        'distance': {'unitCode': 'wmoUnit:m', 'value': 3008.8545696986998},
        'bearing': {'unitCode': 'wmoUnit:degree_(angle)', 'value': 110}
      }
    },
    'forecastZone': 'https://api.weather.gov/zones/forecast/NYZ072',
    'county': 'https://api.weather.gov/zones/county/NYC061',
    'fireWeatherZone': 'https://api.weather.gov/zones/fire/NYZ072',
    'timeZone': 'America/New_York',
    'radarStation': 'KOKX'
  }
});
