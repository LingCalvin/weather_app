import 'package:test/test.dart';
import 'package:weather_repository/src/models/temperature.dart';

void main() {
  group('Temperature', () {
    group('operator ==', () {
      test('evaluates to true when arguments have the same properties', () {
        final a = Temperature(value: 0, unit: TemperatureUnit.c);
        final b = Temperature(value: 0, unit: TemperatureUnit.c);

        expect(a == b, isTrue);
      });
    });
  });

  group('TemperatureUnit', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['wmoUnit:degC', TemperatureUnit.c],
        ['wmoUnit:K', TemperatureUnit.k],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            TemperatureUnit.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => TemperatureUnit.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
}
