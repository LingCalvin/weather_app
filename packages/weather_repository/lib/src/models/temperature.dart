import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonEnum(alwaysCreate: true)
enum TemperatureUnit {
  @JsonValue('wmoUnit:degC')
  c,
  @JsonValue('wmoUnit:K')
  k;

  factory TemperatureUnit.fromJson(dynamic value) =>
      $enumDecode(_$TemperatureUnitEnumMap, value);
}

class Temperature extends Equatable {
  final num value;
  final TemperatureUnit unit;

  Temperature({required this.value, required this.unit});

  @override
  List<Object?> get props => [value, unit];
}
