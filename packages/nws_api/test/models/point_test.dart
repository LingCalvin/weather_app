import 'package:nws_api/src/models/point.dart';
import 'package:nws_api/src/models/relative_location.dart';
import 'package:test/test.dart';

const pointJsonMap = {
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
      'coordinates': [-74.004571999999996, 40.792783999999997],
    },
    'properties': {
      'city': 'Guttenberg',
      'state': 'NJ',
      'distance': {'unitCode': 'wmoUnit:m', 'value': 3008.8545696986998},
      'bearing': {'unitCode': 'wmoUnit:degree_(angle)', 'value': 110},
    }
  },
  'forecastZone': 'https://api.weather.gov/zones/forecast/NYZ072',
  'county': 'https://api.weather.gov/zones/county/NYC061',
  'fireWeatherZone': 'https://api.weather.gov/zones/fire/NYZ072',
  'timeZone': 'America/New_York',
  'radarStation': 'KOKX',
};

void main() {
  group(
    'Point',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          expect(
            Point.fromJson(pointJsonMap),
            isA<Point>()
                .having((point) => point.atId, 'atId', pointJsonMap['@id'])
                .having((point) => point.atType, 'atType', isA<PointAtType>())
                .having(
                  (point) => point.county,
                  'county',
                  pointJsonMap['county'],
                )
                .having((point) => point.cwa, 'cwa', pointJsonMap['cwa'])
                .having(
                  (point) => point.fireWeatherZone,
                  'fireWeatherZone',
                  pointJsonMap['fireWeatherZone'],
                )
                .having(
                  (point) => point.forecast,
                  'forecast',
                  pointJsonMap['forecast'],
                )
                .having(
                  (point) => point.forecastGridData,
                  'forecastGridData',
                  pointJsonMap['forecastGridData'],
                )
                .having(
                  (point) => point.forecastHourly,
                  'forecastHourly',
                  pointJsonMap['forecastHourly'],
                )
                .having(
                  (point) => point.forecastOffice,
                  'forecastOffice',
                  pointJsonMap['forecastOffice'],
                )
                .having(
                  (point) => point.gridId,
                  'gridId',
                  pointJsonMap['gridId'],
                )
                .having((point) => point.gridX, 'gridX', pointJsonMap['gridX'])
                .having((point) => point.gridY, 'gridY', pointJsonMap['gridY'])
                .having(
                  (point) => point.observationStations,
                  'observationStations',
                  pointJsonMap['observationStations'],
                )
                .having(
                  (point) => point.radarStation,
                  'radarStation',
                  pointJsonMap['radarStation'],
                )
                .having(
                  (point) => point.timeZone,
                  'timeZone',
                  pointJsonMap['timeZone'],
                )
                .having(
                  (point) => point.relativeLocation,
                  'relativeLocation',
                  isA<RelativeLocationContainer>(),
                ),
          );
        });
      });
    },
  );

  group(
    'PointAtType',
    () {
      group('fromJson', () {
        test('successfully decodes wx:Point', () {
          expect(PointAtType.fromJson('wx:Point'), PointAtType.wxPoint);
        });

        test('throws error on invalid value', () {
          expect(() => PointAtType.fromJson(''), throwsA(isA<ArgumentError>()));
        });
      });
    },
  );
}
