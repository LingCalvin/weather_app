import 'package:json_annotation/json_annotation.dart';

import '../../nws_api.dart';

part 'observation_station_collection_geo_json.g.dart';

@JsonSerializable()
class ObservationStationCollectionGeoJson {
  final GeoJsonFeatureType type;
  final List<GeoJsonFeatureObservationStation> features;
  final List<String>? observationStations;

  const ObservationStationCollectionGeoJson({
    required this.type,
    required this.features,
    required this.observationStations,
  });

  factory ObservationStationCollectionGeoJson.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ObservationStationCollectionGeoJsonFromJson(json);
}

@JsonSerializable()
class GeoJsonFeatureObservationStation {
  final String? id;
  final GeoJsonFeatureType type;
  final GeoJsonGeometry geometry;
  final ObservationStation properties;

  const GeoJsonFeatureObservationStation({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory GeoJsonFeatureObservationStation.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GeoJsonFeatureObservationStationFromJson(json);
}

@JsonSerializable()
class ObservationStation {
  final String? geometry;
  @JsonKey(name: '@id')
  final String? atId;
  @JsonKey(name: '@type')
  final ObservationStationType? atType;
  final QuantitativeValue? elevation;
  final String? stationIdentifier;
  final String? name;
  final String? timeZone;
  final String? forecast;
  final String? county;
  final String? fireWeatherZone;

  const ObservationStation({
    required this.geometry,
    required this.atId,
    required this.atType,
    required this.elevation,
    required this.stationIdentifier,
    required this.name,
    required this.timeZone,
    required this.forecast,
    required this.county,
    required this.fireWeatherZone,
  });

  factory ObservationStation.fromJson(Map<String, dynamic> json) =>
      _$ObservationStationFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum ObservationStationType {
  @JsonValue('wx:ObservationStation')
  wxObservationStation;

  factory ObservationStationType.fromJson(dynamic value) =>
      $enumDecode(_$ObservationStationTypeEnumMap, value);
}
