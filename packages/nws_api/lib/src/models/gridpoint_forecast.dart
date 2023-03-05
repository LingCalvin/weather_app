import 'package:json_annotation/json_annotation.dart';

import 'quantitative_value.dart';

part 'gridpoint_forecast.g.dart';

@JsonSerializable()
class GridpointForecast {
  final String? geometry;
  final GridpointForecastUnit? units;
  final String? forecastGenerator;
  final DateTime? generatedAt;
  final DateTime? updateTime;
  final String? validTimes;
  final QuantitativeValue? elevation;
  final List<GridpointForecastPeriod>? periods;

  const GridpointForecast({
    required this.geometry,
    required this.units,
    required this.forecastGenerator,
    required this.generatedAt,
    required this.updateTime,
    required this.validTimes,
    required this.elevation,
    required this.periods,
  });

  factory GridpointForecast.fromJson(Map<String, dynamic> json) =>
      _$GridpointForecastFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum GridpointForecastUnit {
  us,
  si;

  factory GridpointForecastUnit.fromJson(dynamic value) =>
      $enumDecode(_$GridpointForecastUnitEnumMap, value);
}

@JsonSerializable()
class GridpointForecastPeriod {
  final num? number;
  final String? name;
  final DateTime? startTime;
  final DateTime? endTime;
  final bool? isDaytime;
  final QuantitativeValue? temperature;
  final GridpointForecastPeriodTemperatureTrend? temperatureTrend;
  final QuantitativeValue? probabilityOfPrecipitation;
  final QuantitativeValue? dewpoint;
  final QuantitativeValue? relativeHumidity;
  final QuantitativeValue? windSpeed;
  final QuantitativeValue? windGust;
  final GridpointForecastWindDirection? windDirection;
  final String? icon;
  final String? shortForecast;
  final String? detailedForecast;

  const GridpointForecastPeriod({
    required this.number,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.isDaytime,
    required this.temperature,
    required this.temperatureTrend,
    required this.probabilityOfPrecipitation,
    required this.dewpoint,
    required this.relativeHumidity,
    required this.windSpeed,
    required this.windGust,
    required this.windDirection,
    required this.icon,
    required this.shortForecast,
    required this.detailedForecast,
  });

  factory GridpointForecastPeriod.fromJson(Map<String, dynamic> json) =>
      _$GridpointForecastPeriodFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum GridpointForecastPeriodTemperatureTrend {
  rising,
  falling;

  factory GridpointForecastPeriodTemperatureTrend.fromJson(dynamic value) =>
      $enumDecode(_$GridpointForecastPeriodTemperatureTrendEnumMap, value);
}

@JsonEnum(alwaysCreate: true)
enum GridpointForecastWindDirection {
  @JsonValue('N')
  n,
  @JsonValue('NNE')
  nne,
  @JsonValue('NE')
  ne,
  @JsonValue('ENE')
  ene,
  @JsonValue('E')
  e,
  @JsonValue('ESE')
  ese,
  @JsonValue('SE')
  se,
  @JsonValue('SSE')
  sse,
  @JsonValue('S')
  s,
  @JsonValue('SSW')
  ssw,
  @JsonValue('SW')
  sw,
  @JsonValue('WSW')
  wsw,
  @JsonValue('W')
  w,
  @JsonValue('WNW')
  wnw,
  @JsonValue('NW')
  nw,
  @JsonValue('NNW')
  nnw;

  factory GridpointForecastWindDirection.fromJson(dynamic value) =>
      $enumDecode(_$GridpointForecastWindDirectionEnumMap, value);
}
