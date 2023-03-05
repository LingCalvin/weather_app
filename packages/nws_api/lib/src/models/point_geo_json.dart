import 'package:json_annotation/json_annotation.dart';

import 'geo_json_feature.dart';
import 'geo_json_geometry.dart';
import 'point.dart';

part 'point_geo_json.g.dart';

@JsonSerializable()
class PointGeoJson {
  final String? id;
  final GeoJsonFeatureType type;
  final GeoJsonGeometry geometry;
  final Point properties;

  PointGeoJson({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory PointGeoJson.fromJson(Map<String, dynamic> json) =>
      _$PointGeoJsonFromJson(json);
}
