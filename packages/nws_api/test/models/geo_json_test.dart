import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  group('GeoJsonFeatureType', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['Feature', GeoJsonFeatureType.feature],
      ]) {
        test(
          'successfully decodes "${valueResultPair[0]}"',
          () {
            expect(
              GeoJsonFeatureType.fromJson(valueResultPair[0]),
              valueResultPair[1],
            );
          },
        );
      }

      test(
        'raises an exception on invalid input',
        () {
          expect(
            () => GeoJsonFeatureType.fromJson(''),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    });
  });

  group('GeoJsonFeature', () {
    group('GeoJsonFeature', () {
      test('sets members', () {
        final feature = GeoJsonFeature(
          id: 'abc',
          type: GeoJsonFeatureType.feature,
          geometry:
              GeoJsonGeometry(bbox: null, type: GeoJsonGeometryType.point),
          properties: [1],
        );
        expect(
          feature,
          isA<GeoJsonFeature<List<int>>>()
              .having((obj) => obj.id, 'id', 'abc')
              .having((obj) => obj.type, 'type', GeoJsonFeatureType.feature)
              .having((obj) => obj.geometry, 'geometry', isA<GeoJsonGeometry>())
              .having((obj) => obj.properties, 'properties', [1]),
        );
      });
    });
  });

  group('GeoJsonFeatureCollectionType', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['FeatureCollection', GeoJsonFeatureCollectionType.featureCollection],
      ]) {
        test(
          'successfully decodes "${valueResultPair[0]}"',
          () {
            expect(
              GeoJsonFeatureCollectionType.fromJson(valueResultPair[0]),
              valueResultPair[1],
            );
          },
        );
      }

      test(
        'raises an exception on invalid input',
        () {
          expect(
            () => GeoJsonFeatureCollectionType.fromJson(''),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    });
  });

  group('GeoJsonFeatureCollection', () {
    group('GeoJsonFeatureCollection', () {
      test('sets members', () {
        final collection = GeoJsonFeatureCollection(
          type: GeoJsonFeatureCollectionType.featureCollection,
          features: [1],
        );
        expect(
          collection,
          isA<GeoJsonFeatureCollection<int>>()
              .having(
            (obj) => obj.type,
            'type',
            GeoJsonFeatureCollectionType.featureCollection,
          )
              .having((obj) => obj.features, 'features', [1]),
        );
      });
    });
  });
}
