import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  group('QuantitativeValue', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const map = {
          'maxValue': 0,
          'minValue': -5,
          'unitCode': 'wmoUnit:degC',
          'value': -3.3333333333333335,
          'qualityControl': 'Z',
        };

        final result = QuantitativeValue.fromJson(map);

        expect(
          result,
          isA<QuantitativeValue>()
              .having((obj) => obj.maxValue, 'maxValue', map['maxValue'])
              .having((obj) => obj.minValue, 'minValue', map['minValue'])
              .having(
                (obj) => obj.qualityControl,
                'qualityControl',
                QualityControl.z,
              )
              .having((obj) => obj.unitCode, 'unitCode', map['unitCode'])
              .having((obj) => obj.value, 'value', map['value']),
        );
      });
    });
  });

  group('QualityControl', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['Z', QualityControl.z],
        ['C', QualityControl.c],
        ['S', QualityControl.s],
        ['V', QualityControl.v],
        ['X', QualityControl.x],
        ['Q', QualityControl.q],
        ['G', QualityControl.g],
        ['B', QualityControl.b],
        ['T', QualityControl.t],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            QualityControl.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws error on invalid value', () {
        expect(
          () => QualityControl.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
}
