import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  const relativeLocationGeoJsonMap = {
    'type': 'Feature',
    'geometry': {
      'type': 'Point',
      'coordinates': [-74.004571999999996, 40.792783999999997],
    },
    'properties': {
      'city': 'Guttenberg',
      'state': 'NJ',
      'distance': {
        'unitCode': 'wmoUnit:m',
        'value': 3008.8545696986998,
      },
      'bearing': {'unitCode': 'wmoUnit:degree_(angle)', 'value': 110},
    }
  };

  final relativeLocationJsonLdMap =
      relativeLocationGeoJsonMap['properties'] as Map<String, dynamic>;

  group(
    'RelativeLocationContainer',
    () {
      group('fromJson', () {
        test(
          'returns a RelativeLocationGeoJson when the map has a type key',
          () {
            expect(
              RelativeLocationContainer.fromJson(relativeLocationGeoJsonMap),
              isA<RelativeLocationGeoJson>(),
            );
          },
        );

        test(
          'returns a RelativeLocationJsonLd when the map does not have a type key',
          () {
            expect(
              RelativeLocationContainer.fromJson(relativeLocationJsonLdMap),
              isA<RelativeLocationJsonLd>(),
            );
          },
        );
      });
    },
  );

  group(
    'RelativeLocationGeoJson',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final result =
              RelativeLocationGeoJson.fromJson(relativeLocationGeoJsonMap);

          expect(result.id, relativeLocationGeoJsonMap['id']);
        });
      });
    },
  );

  group(
    'RelativeLocationJsonLd',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          final result =
              RelativeLocationJsonLd.fromJson(relativeLocationJsonLdMap);

          expect(
            result,
            isA<RelativeLocationJsonLd>()
                .having(
                  (obj) => obj.city,
                  'city',
                  relativeLocationJsonLdMap['city'],
                )
                .having(
                  (obj) => obj.state,
                  'state',
                  relativeLocationJsonLdMap['state'],
                )
                .having(
                  (obj) => obj.bearing,
                  'bearing',
                  isA<QuantitativeValue>(),
                )
                .having(
                  (obj) => obj.distance,
                  'distance',
                  isA<QuantitativeValue>(),
                )
                .having(
                  (obj) => obj.geometry,
                  'geometry',
                  relativeLocationJsonLdMap['geometry'],
                ),
          );
        });
      });
    },
  );
}
