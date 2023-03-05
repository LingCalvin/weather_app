import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

import '../fixtures/models/geo_json_geometry.dart';

void main() {
  group(
    'GeoJsonGeometry',
    () {
      group('GeoJsonGeometry', () {
        test('sets bbox and type', () {
          const geometry =
              GeoJsonGeometry(bbox: [0, 0], type: GeoJsonGeometryType.point);
          expect(
            geometry,
            isA<GeoJsonGeometry>().having(
              (geometry) => geometry.bbox,
              'bbox',
              [0, 0],
            ).having(
              (geometry) => geometry.type,
              'type',
              GeoJsonGeometryType.point,
            ),
          );
        });
      });

      group('fromJson', () {
        test('successfully decodes GeoJsonPoint', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonPointMap),
            isA<GeoJsonPoint>(),
          );
        });

        test('successfully decodes GeoJsonLineString', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonLineStringMap),
            isA<GeoJsonLineString>(),
          );
        });

        test('successfully decodes GeoJsonPolygon', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonPolygonMap),
            isA<GeoJsonPolygon>(),
          );
        });

        test('successfully decodes GeoJsonMultiPoint', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonMultiPointMap),
            isA<GeoJsonMultiPoint>(),
          );
        });

        test('successfully decodes GeoJsonMultiLineString', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonMultiLineStringMap),
            isA<GeoJsonMultiLineString>(),
          );
        });

        test('successfully decodes GeoJsonMultiPolygon', () {
          expect(
            GeoJsonGeometry.fromJson(geoJsonMultiPolygonMap),
            isA<GeoJsonMultiPolygon>(),
          );
        });

        test('throws an error on invalid input', () {
          expect(
            () => GeoJsonGeometry.fromJson({}),
            throwsA(isA<ArgumentError>()),
          );
        });
      });
    },
  );

  group(
    'GeoJsonGeometryType',
    () {
      group('fromJson', () {
        for (final valueResultPair in [
          ['Point', GeoJsonGeometryType.point],
          ['LineString', GeoJsonGeometryType.lineString],
          ['Polygon', GeoJsonGeometryType.polygon],
          ['MultiPoint', GeoJsonGeometryType.multiPoint],
          ['MultiLineString', GeoJsonGeometryType.multiLineString],
          ['MultiPolygon', GeoJsonGeometryType.multiPolygon],
        ]) {
          test('successfully decodes "Point"', () {
            expect(
              GeoJsonGeometryType.fromJson(valueResultPair[0]),
              valueResultPair[1],
            );
          });
        }

        test('throws an error on invalid input"', () {
          expect(
            () => GeoJsonGeometryType.fromJson(''),
            throwsA(isA<ArgumentError>()),
          );
        });
      });
    },
  );

  group(
    'GeoJsonPoint',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonPoint = GeoJsonPoint.fromJson(geoJsonPointMap);

          expect(
            geoJsonPoint,
            isA<GeoJsonPoint>()
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  geoJsonPointMap['coordinates'],
                )
                .having((obj) => obj.bbox, 'bbox', null)
                .having((obj) => obj.type, 'type', GeoJsonGeometryType.point),
          );
        });
      });
    },
  );

  group(
    'GeoJsonLineString',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonLineString =
              GeoJsonLineString.fromJson(geoJsonLineStringMap);

          expect(
            geoJsonLineString,
            isA<GeoJsonLineString>()
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  geoJsonLineStringMap['coordinates'],
                )
                .having((obj) => obj.bbox, 'bbox', null)
                .having(
                  (obj) => obj.type,
                  'type',
                  GeoJsonGeometryType.lineString,
                ),
          );
        });
      });
    },
  );

  group(
    'GeoJsonPolygon',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonPolygon = GeoJsonPolygon.fromJson(geoJsonPolygonMap);

          expect(
            geoJsonPolygon,
            isA<GeoJsonPolygon>()
                .having((obj) => obj.bbox, 'bbox', null)
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  geoJsonPolygonMap['coordinates'],
                )
                .having((obj) => obj.type, 'type', GeoJsonGeometryType.polygon),
          );
        });
      });
    },
  );

  group(
    'GeoJsonMultiPoint',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonMultiPoint =
              GeoJsonMultiPoint.fromJson(geoJsonMultiPointMap);

          expect(
            geoJsonMultiPoint,
            isA<GeoJsonMultiPoint>()
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  geoJsonMultiPointMap['coordinates'],
                )
                .having((obj) => obj.bbox, 'bbox', null)
                .having(
                  (obj) => obj.type,
                  'type',
                  GeoJsonGeometryType.multiPoint,
                ),
          );
        });
      });
    },
  );

  group(
    'GeoJsonMultiLineString',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonMultiLineString =
              GeoJsonMultiLineString.fromJson(geoJsonMultiLineStringMap);

          expect(
            geoJsonMultiLineString,
            isA<GeoJsonMultiLineString>()
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  isA<List<List<List<num>>>>(),
                )
                .having((obj) => obj.bbox, 'bbox', null)
                .having(
                  (obj) => obj.type,
                  'type',
                  GeoJsonGeometryType.multiLineString,
                ),
          );
        });
      });
    },
  );

  group(
    'GeoJsonMultiPolygon',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final geoJsonMultiPolygon = GeoJsonMultiPolygon.fromJson(
            geoJsonMultiPolygonMap,
          );

          expect(
            geoJsonMultiPolygon,
            isA<GeoJsonMultiPolygon>()
                .having(
                  (obj) => obj.coordinates,
                  'coordinates',
                  geoJsonMultiPolygonMap['coordinates'],
                )
                .having((obj) => obj.bbox, 'bbox', null)
                .having(
                  (obj) => obj.type,
                  'type',
                  GeoJsonGeometryType.multiPolygon,
                ),
          );
        });
      });
    },
  );
}
