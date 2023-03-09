import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  group('ObservationStationCollectionGeoJson', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          '@context': [
            'https://geojson.org/geojson-ld/geojson-context.jsonld',
            {
              '@version': '1.1',
              'wx': 'https://api.weather.gov/ontology#',
              's': 'https://schema.org/',
              'geo': 'http://www.opengis.net/ont/geosparql#',
              'unit': 'http://codes.wmo.int/common/unit/',
              '@vocab': 'https://api.weather.gov/ontology#',
              'geometry': {
                '@id': 's:GeoCoordinates',
                '@type': 'geo:wktLiteral'
              },
              'city': 's:addressLocality',
              'state': 's:addressRegion',
              'distance': {'@id': 's:Distance', '@type': 's:QuantitativeValue'},
              'bearing': {'@type': 's:QuantitativeValue'},
              'value': {'@id': 's:value'},
              'unitCode': {'@id': 's:unitCode', '@type': '@id'},
              'forecastOffice': {'@type': '@id'},
              'forecastGridData': {'@type': '@id'},
              'publicZone': {'@type': '@id'},
              'county': {'@type': '@id'},
              'observationStations': {'@container': '@list', '@type': '@id'}
            }
          ],
          'type': 'FeatureCollection',
          'features': [
            {
              'id': 'https://api.weather.gov/stations/KNYC',
              'type': 'Feature',
              'geometry': {
                'type': 'Point',
                'coordinates': [-73.9666699, 40.78333]
              },
              'properties': {
                '@id': 'https://api.weather.gov/stations/KNYC',
                '@type': 'wx:ObservationStation',
                'elevation': {'unitCode': 'wmoUnit:m', 'value': 46.9392},
                'stationIdentifier': 'KNYC',
                'name': 'New York City, Central Park',
                'timeZone': 'America/New_York',
                'forecast': 'https://api.weather.gov/zones/forecast/NYZ072',
                'county': 'https://api.weather.gov/zones/county/NYC061',
                'fireWeatherZone': 'https://api.weather.gov/zones/fire/NYZ072'
              }
            },
          ],
          'observationStations': [
            'https://api.weather.gov/stations/KNYC',
          ],
          'pagination': {
            'next':
                'https://api.weather.gov/stations?id%5B0%5D=K12N&id%5B1%5D=KBAF&id%5B2%5D=KBDL&id%5B3%5D=KBDR&id%5B4%5D=KBID&id%5B5%5D=KBLM&id%5B6%5D=KCDW&id%5B7%5D=KCEF&id%5B8%5D=KDXR&id%5B9%5D=KEWR&id%5B10%5D=KFOK&id%5B11%5D=KFRG&id%5B12%5D=KFWN&id%5B13%5D=KGON&id%5B14%5D=KHFD&id%5B15%5D=KHPN&id%5B16%5D=KHVN&id%5B17%5D=KHWV&id%5B18%5D=KIJD&id%5B19%5D=KISP&id%5B20%5D=KJFK&id%5B21%5D=KLGA&id%5B22%5D=KMGJ&id%5B23%5D=KMJX&id%5B24%5D=KMMK&id%5B25%5D=KMMU&id%5B26%5D=KMSV&id%5B27%5D=KMTP&id%5B28%5D=KNEL&id%5B29%5D=KNYC&id%5B30%5D=KORH&id%5B31%5D=KOXC&id%5B32%5D=KPNE&id%5B33%5D=KPOU&id%5B34%5D=KSMQ&id%5B35%5D=KSWF&id%5B36%5D=KTEB&id%5B37%5D=KTTN&id%5B38%5D=KWRI&id%5B39%5D=KWST&cursor=eyJzIjo1MDB9'
          }
        };

        expect(
          ObservationStationCollectionGeoJson.fromJson(json),
          isA<ObservationStationCollectionGeoJson>()
              .having((obj) => obj.features, 'features', hasLength(1))
              .having(
                (obj) => obj.observationStations,
                'observationStations',
                hasLength(1),
              )
              .having(
                (obj) => obj.type,
                'type',
                GeoJsonFeatureCollectionType.featureCollection,
              ),
        );
      });
    });
  });

  group('GeoJsonFeatureObservationStation', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          'id': 'https://api.weather.gov/stations/KNYC',
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [-73.9666699, 40.78333]
          },
          'properties': {
            '@id': 'https://api.weather.gov/stations/KNYC',
            '@type': 'wx:ObservationStation',
            'elevation': {'unitCode': 'wmoUnit:m', 'value': 46.9392},
            'stationIdentifier': 'KNYC',
            'name': 'New York City, Central Park',
            'timeZone': 'America/New_York',
            'forecast': 'https://api.weather.gov/zones/forecast/NYZ072',
            'county': 'https://api.weather.gov/zones/county/NYC061',
            'fireWeatherZone': 'https://api.weather.gov/zones/fire/NYZ072'
          }
        };

        expect(
          GeoJsonFeatureObservationStation.fromJson(json),
          isA<GeoJsonFeatureObservationStation>()
              .having((obj) => obj.geometry, 'geometry', isA<GeoJsonGeometry>())
              .having((obj) => obj.id, 'id', json['id'])
              .having(
                (obj) => obj.properties,
                'properties',
                isA<ObservationStation>(),
              )
              .having(
                (obj) => obj.type,
                'geometry',
                GeoJsonFeatureType.feature,
              ),
        );
      });
    });
  });

  group('ObservationStation', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const json = {
          '@id': 'https://api.weather.gov/stations/KNYC',
          '@type': 'wx:ObservationStation',
          'elevation': {'unitCode': 'wmoUnit:m', 'value': 46.9392},
          'stationIdentifier': 'KNYC',
          'name': 'New York City, Central Park',
          'timeZone': 'America/New_York',
          'forecast': 'https://api.weather.gov/zones/forecast/NYZ072',
          'county': 'https://api.weather.gov/zones/county/NYC061',
          'fireWeatherZone': 'https://api.weather.gov/zones/fire/NYZ072'
        };

        expect(
          ObservationStation.fromJson(json),
          isA<ObservationStation>()
              .having((obj) => obj.atId, 'atId', json['@id'])
              .having(
                (obj) => obj.atType,
                'atType',
                ObservationStationType.wxObservationStation,
              )
              .having((obj) => obj.county, 'county', json['county'])
              .having(
                (obj) => obj.elevation,
                'elevation',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.fireWeatherZone,
                'fireWeatherZone',
                json['fireWeatherZone'],
              )
              .having((obj) => obj.forecast, 'forecast', json['forecast'])
              .having((obj) => obj.geometry, 'geometry', json['geometry'])
              .having((obj) => obj.name, 'name', json['name'])
              .having(
                (obj) => obj.stationIdentifier,
                'stationIdentifier',
                json['stationIdentifier'],
              )
              .having((obj) => obj.timeZone, 'timeZone', json['timeZone']),
        );
      });
    });
  });

  group('ObservationStationType', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['wx:ObservationStation', ObservationStationType.wxObservationStation]
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            ObservationStationType.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }
    });
  });
}
