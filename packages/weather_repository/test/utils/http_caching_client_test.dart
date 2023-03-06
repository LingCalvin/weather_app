import 'package:test/test.dart';
import 'package:weather_repository/src/utils/http_caching_client.dart';

void main() {
  group('tryParseDateHeader', () {
    test('successfully parses valid date header', () {
      const header = 'Wed, 21 Jun 2023 10:57:00 GMT';
      expect(
        tryParseDateHeader(header),
        isA<DateTime>().having(
          (date) => date.microsecondsSinceEpoch,
          'microsecondsSinceEpoch',
          DateTime.utc(2023, 6, 21, 10, 57).microsecondsSinceEpoch,
        ),
      );
    });

    test('returns null on valid date header', () {
      const header = '';
      expect(tryParseDateHeader(header), isNull);
    });
  });
}
