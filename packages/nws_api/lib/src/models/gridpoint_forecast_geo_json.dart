import 'package:json_annotation/json_annotation.dart';

import 'geo_json.dart';
import 'geo_json_geometry.dart';
import 'gridpoint_forecast.dart';

part 'gridpoint_forecast_geo_json.g.dart';

@JsonSerializable()
class GridpointForecastGeoJson implements GeoJsonFeature<GridpointForecast> {
  @override
  final String? id;
  @override
  final GeoJsonFeatureType type;
  @override
  final GeoJsonGeometry geometry;
  @override
  final GridpointForecast properties;

  const GridpointForecastGeoJson({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory GridpointForecastGeoJson.fromJson(Map<String, dynamic> json) =>
      _$GridpointForecastGeoJsonFromJson(json);
}
