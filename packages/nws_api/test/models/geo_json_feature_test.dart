import 'package:nws_api/src/models/geo_json_feature.dart';
import 'package:test/test.dart';

void main() {
  group('GeoJsonFeatureType', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['Feature', GeoJsonFeatureType.feature],
        ['FeatureCollection', GeoJsonFeatureType.featureCollection]
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
}
