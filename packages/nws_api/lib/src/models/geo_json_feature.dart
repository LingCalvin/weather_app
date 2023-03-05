import 'package:json_annotation/json_annotation.dart';

part 'geo_json_feature.g.dart';

@JsonEnum(alwaysCreate: true)
enum GeoJsonFeatureType {
  @JsonValue('Feature')
  feature,
  @JsonValue('FeatureCollection')
  featureCollection;

  factory GeoJsonFeatureType.fromJson(dynamic value) =>
      $enumDecode(_$GeoJsonFeatureTypeEnumMap, value);
}
