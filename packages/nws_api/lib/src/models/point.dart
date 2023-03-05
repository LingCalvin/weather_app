import 'package:json_annotation/json_annotation.dart';

import 'relative_location.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  final String? geometry;
  @JsonKey(name: '@id')
  final String? atId;
  @JsonKey(name: '@type')
  final PointAtType? atType;
  final String? cwa;
  final String? forecastOffice;
  final String? gridId;
  final int? gridX;
  final int? gridY;
  final String? forecast;
  final String? forecastHourly;
  final String? forecastGridData;
  final String? observationStations;
  final RelativeLocationContainer? relativeLocation;
  final String? forecastZone;
  final String? county;
  final String? fireWeatherZone;
  final String? timeZone;
  final String? radarStation;

  const Point({
    required this.geometry,
    required this.atId,
    required this.atType,
    required this.cwa,
    required this.forecastOffice,
    required this.gridId,
    required this.gridX,
    required this.gridY,
    required this.forecast,
    required this.forecastHourly,
    required this.forecastGridData,
    required this.observationStations,
    required this.relativeLocation,
    required this.forecastZone,
    required this.county,
    required this.fireWeatherZone,
    required this.timeZone,
    required this.radarStation,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum PointAtType {
  @JsonValue('wx:Point')
  wxPoint;

  factory PointAtType.fromJson(dynamic value) =>
      $enumDecode(_$PointAtTypeEnumMap, value);
}
