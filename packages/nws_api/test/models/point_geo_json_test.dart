import 'dart:convert';

import 'package:nws_api/src/models/point_geo_json.dart';
import 'package:test/test.dart';

import '../fixtures/nws_api.dart';

void main() {
  group('PointGeoJson', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        final jsonMap = jsonDecode(pointResponseBody);

        final result = PointGeoJson.fromJson(jsonMap);

        expect(result.id, jsonMap['id']);
      });
    });
  });
}
