import 'package:json_annotation/json_annotation.dart';

import 'geo_json.dart';
import 'geo_json_geometry.dart';
import 'quantitative_value.dart';

part 'relative_location.g.dart';

@JsonSerializable()
class RelativeLocation {
  final String? city;
  final String? state;
  final QuantitativeValue? distance;
  final QuantitativeValue? bearing;

  const RelativeLocation({
    required this.city,
    required this.state,
    required this.distance,
    required this.bearing,
  });

  factory RelativeLocation.fromJson(Map<String, dynamic> json) =>
      _$RelativeLocationFromJson(json);
}

@JsonSerializable()
class RelativeLocationContainer {
  const RelativeLocationContainer();

  factory RelativeLocationContainer.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type')) {
      return RelativeLocationGeoJson.fromJson(json);
    }
    return RelativeLocationJsonLd.fromJson(json);
  }
}

@JsonSerializable()
class RelativeLocationGeoJson extends RelativeLocationContainer
    implements GeoJsonFeature<RelativeLocation> {
  @override
  final String? id;
  @override
  final GeoJsonFeatureType type;
  @override
  final GeoJsonGeometry geometry;
  @override
  final RelativeLocation properties;

  const RelativeLocationGeoJson({
    required this.id,
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory RelativeLocationGeoJson.fromJson(Map<String, dynamic> json) =>
      _$RelativeLocationGeoJsonFromJson(json);
}

@JsonSerializable()
class RelativeLocationJsonLd extends RelativeLocationContainer {
  final String? geometry;
  final String? city;
  final String? state;
  final QuantitativeValue? distance;
  final QuantitativeValue? bearing;

  const RelativeLocationJsonLd({
    required this.geometry,
    required this.city,
    required this.state,
    required this.distance,
    required this.bearing,
  });

  factory RelativeLocationJsonLd.fromJson(Map<String, dynamic> json) =>
      _$RelativeLocationJsonLdFromJson(json);
}
