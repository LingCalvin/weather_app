import 'dart:convert';

import 'package:nws_api/src/models/gridpoint_forecast_geo_json.dart';
import 'package:test/test.dart';

import '../fixtures/nws_api.dart';

void main() {
  group('GridpointForecastGeoJson', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        final jsonMap = jsonDecode(dailyForecastResponseBody);

        final result = GridpointForecastGeoJson.fromJson(jsonMap);

        expect(
          result,
          isA<GridpointForecastGeoJson>()
              .having((obj) => obj.id, 'id', jsonMap['id']),
        );
      });
    });
  });
}
