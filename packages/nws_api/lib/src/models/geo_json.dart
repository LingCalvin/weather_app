import 'package:json_annotation/json_annotation.dart';

import 'geo_json_geometry.dart';

part 'geo_json.g.dart';

@JsonEnum(alwaysCreate: true)
enum GeoJsonFeatureType {
  @JsonValue('Feature')
  feature;

  factory GeoJsonFeatureType.fromJson(dynamic value) =>
      $enumDecode(_$GeoJsonFeatureTypeEnumMap, value);
}

class GeoJsonFeature<T> {
  final String? id;
  final GeoJsonFeatureType type;
  final GeoJsonGeometry geometry;
  final T properties;

  const GeoJsonFeature({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });
}

@JsonEnum(alwaysCreate: true)
enum GeoJsonFeatureCollectionType {
  @JsonValue('FeatureCollection')
  featureCollection;

  factory GeoJsonFeatureCollectionType.fromJson(dynamic value) =>
      $enumDecode(_$GeoJsonFeatureCollectionTypeEnumMap, value);
}

class GeoJsonFeatureCollection<T> {
  final GeoJsonFeatureCollectionType type;
  final List<T> features;

  const GeoJsonFeatureCollection({required this.type, required this.features});
}
