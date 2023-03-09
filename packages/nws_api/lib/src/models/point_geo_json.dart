import 'package:json_annotation/json_annotation.dart';

import 'geo_json.dart';
import 'geo_json_geometry.dart';
import 'point.dart';

part 'point_geo_json.g.dart';

@JsonSerializable()
class PointGeoJson implements GeoJsonFeature<Point> {
  @override
  final String? id;
  @override
  final GeoJsonFeatureType type;
  @override
  final GeoJsonGeometry geometry;
  @override
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
