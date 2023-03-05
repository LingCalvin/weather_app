import 'package:json_annotation/json_annotation.dart';

import 'geo_json_feature.dart';
import 'geo_json_geometry.dart';
import 'observation_station_collection_geo_json.dart';
import 'quantitative_value.dart';

part 'observation_geo_json.g.dart';

@JsonSerializable()
class ObservationGeoJson {
  final String? id;
  final GeoJsonFeatureType type;
  final GeoJsonGeometry geometry;
  final Observation properties;

  ObservationGeoJson({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory ObservationGeoJson.fromJson(Map<String, dynamic> json) =>
      _$ObservationGeoJsonFromJson(json);
}

@JsonSerializable()
class Observation {
  final String? geometry;
  @JsonKey(name: '@id')
  final String? atId;
  @JsonKey(name: '@type')
  final ObservationStationType? atType;
  final QuantitativeValue? elevation;
  final String? station;
  final DateTime? timestamp;
  final String? rawMessage;
  final String? textDescription;
  final List<MetarPhenomenon>? presentWeather;
  final QuantitativeValue? temperature;
  final QuantitativeValue? dewpoint;
  final QuantitativeValue? windDirection;
  final QuantitativeValue? windSpeed;
  final QuantitativeValue? windGust;
  final QuantitativeValue? barometricPressure;
  final QuantitativeValue? seaLevelPressure;
  final QuantitativeValue? visibility;
  final QuantitativeValue? maxTemperatureLast24Hours;
  final QuantitativeValue? minTemperatureLast24Hours;
  final QuantitativeValue? precipitationLastHour;
  final QuantitativeValue? precipitationLast3Hours;
  final QuantitativeValue? precipitationLast6Hours;
  final QuantitativeValue? relativeHumidity;
  final QuantitativeValue? windChill;
  final QuantitativeValue? heatIndex;
  final List<ObservationCloudLayer>? cloudLayers;

  Observation({
    required this.geometry,
    required this.atId,
    required this.atType,
    required this.elevation,
    required this.station,
    required this.timestamp,
    required this.rawMessage,
    required this.textDescription,
    required this.presentWeather,
    required this.temperature,
    required this.dewpoint,
    required this.windDirection,
    required this.windSpeed,
    required this.windGust,
    required this.barometricPressure,
    required this.seaLevelPressure,
    required this.visibility,
    required this.maxTemperatureLast24Hours,
    required this.minTemperatureLast24Hours,
    required this.precipitationLastHour,
    required this.precipitationLast3Hours,
    required this.precipitationLast6Hours,
    required this.relativeHumidity,
    required this.windChill,
    required this.heatIndex,
    required this.cloudLayers,
  });

  factory Observation.fromJson(Map<String, dynamic> json) =>
      _$ObservationFromJson(json);
}

@JsonSerializable()
class MetarPhenomenon {
  final MetarPhenomenonIntensity? intensity;
  final MetarPhenomenonModifier? modifier;
  final MetarPhenomenonWeather weather;
  final String rawString;
  final bool? inVicinity;

  const MetarPhenomenon({
    required this.intensity,
    required this.modifier,
    required this.weather,
    required this.rawString,
    required this.inVicinity,
  });

  factory MetarPhenomenon.fromJson(Map<String, dynamic> json) =>
      _$MetarPhenomenonFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum MetarPhenomenonIntensity {
  light,
  heavy;

  factory MetarPhenomenonIntensity.fromJson(dynamic value) =>
      $enumDecode(_$MetarPhenomenonIntensityEnumMap, value);
}

@JsonEnum(alwaysCreate: true)
enum MetarPhenomenonModifier {
  patches,
  blowing,
  @JsonValue('low_drifting')
  lowDrifting,
  freezing,
  shallow,
  partial,
  showers;

  factory MetarPhenomenonModifier.fromJson(dynamic value) =>
      $enumDecode(_$MetarPhenomenonModifierEnumMap, value);
}

@JsonEnum(alwaysCreate: true)
enum MetarPhenomenonWeather {
  @JsonValue('fog_mist')
  fogMist,
  @JsonValue('dust_storm')
  dustStorm,
  dust,
  drizzle,
  @JsonValue('funnel_cloud')
  funnelCloud,
  fog,
  smoke,
  hail,
  @JsonValue('snow_pellets')
  snowPellets,
  haze,
  @JsonValue('ice_crystals')
  iceCrystals,
  @JsonValue('ice_pellets')
  icePellets,
  @JsonValue('dust_whirls')
  dustWhirls,
  spray,
  rain,
  sand,
  @JsonValue('snow_grains')
  snowGrains,
  snow,
  squalls,
  @JsonValue('sand_storm')
  sandStorm,
  thunderstorms,
  unknown,
  @JsonValue('volcanic_ash')
  volcanicAsh;

  factory MetarPhenomenonWeather.fromJson(dynamic value) =>
      $enumDecode(_$MetarPhenomenonWeatherEnumMap, value);
}

@JsonSerializable()
class ObservationCloudLayer {
  final QuantitativeValue base;
  final MetarSkyCoverage amount;

  const ObservationCloudLayer({required this.base, required this.amount});

  factory ObservationCloudLayer.fromJson(Map<String, dynamic> json) =>
      _$ObservationCloudLayerFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum MetarSkyCoverage {
  @JsonValue('OVC')
  ovc,
  @JsonValue('BKN')
  bkn,
  @JsonValue('SCT')
  sct,
  @JsonValue('FEW')
  few,
  @JsonValue('SKC')
  skc,
  @JsonValue('CLR')
  clr,
  @JsonValue('VV')
  vv;

  factory MetarSkyCoverage.fromJson(dynamic value) =>
      $enumDecode(_$MetarSkyCoverageEnumMap, value);
}
