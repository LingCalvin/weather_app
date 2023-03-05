import 'package:json_annotation/json_annotation.dart';

part 'quantitative_value.g.dart';

@JsonSerializable()
class QuantitativeValue {
  final num? value;
  final num? maxValue;
  final num? minValue;
  final String? unitCode;
  final QualityControl? qualityControl;

  const QuantitativeValue({
    this.value,
    this.maxValue,
    this.minValue,
    this.unitCode,
    this.qualityControl,
  });

  factory QuantitativeValue.fromJson(Map<String, dynamic> json) =>
      _$QuantitativeValueFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum QualityControl {
  @JsonValue('Z')
  z,
  @JsonValue('C')
  c,
  @JsonValue('S')
  s,
  @JsonValue('V')
  v,
  @JsonValue('X')
  x,
  @JsonValue('Q')
  q,
  @JsonValue('G')
  g,
  @JsonValue('B')
  b,
  @JsonValue('T')
  t;

  factory QualityControl.fromJson(dynamic value) =>
      $enumDecode(_$QualityControlEnumMap, value);
}
