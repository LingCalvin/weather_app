import 'package:json_annotation/json_annotation.dart';

part 'geo_json_geometry.g.dart';

@JsonSerializable()
class GeoJsonGeometry {
  final List<num>? bbox;
  final GeoJsonGeometryType type;

  const GeoJsonGeometry({required this.bbox, required this.type});

  factory GeoJsonGeometry.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'Point':
        return GeoJsonPoint.fromJson(json);
      case 'LineString':
        return GeoJsonLineString.fromJson(json);
      case 'Polygon':
        return GeoJsonPolygon.fromJson(json);
      case 'MultiPoint':
        return GeoJsonMultiPoint.fromJson(json);
      case 'MultiLineString':
        return GeoJsonMultiLineString.fromJson(json);
      case 'MultiPolygon':
        return GeoJsonMultiPolygon.fromJson(json);
      default:
        throw ArgumentError('Unknown GeoJsonGeometry value: $json');
    }
  }
}

@JsonEnum(alwaysCreate: true)
enum GeoJsonGeometryType {
  @JsonValue('Point')
  point,
  @JsonValue('LineString')
  lineString,
  @JsonValue('Polygon')
  polygon,
  @JsonValue('MultiPoint')
  multiPoint,
  @JsonValue('MultiLineString')
  multiLineString,
  @JsonValue('MultiPolygon')
  multiPolygon;

  factory GeoJsonGeometryType.fromJson(dynamic value) =>
      $enumDecode(_$GeoJsonGeometryTypeEnumMap, value);
}

@JsonSerializable()
class GeoJsonPoint extends GeoJsonGeometry {
  final List<num> coordinates;
  const GeoJsonPoint({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.point);

  factory GeoJsonPoint.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonPointFromJson(json);
}

@JsonSerializable()
class GeoJsonLineString extends GeoJsonGeometry {
  final List<List<num>> coordinates;

  const GeoJsonLineString({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.lineString);

  factory GeoJsonLineString.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonLineStringFromJson(json);
}

@JsonSerializable()
class GeoJsonPolygon extends GeoJsonGeometry {
  final List<List<List<num>>> coordinates;

  const GeoJsonPolygon({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.polygon);

  factory GeoJsonPolygon.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonPolygonFromJson(json);
}

@JsonSerializable()
class GeoJsonMultiPoint extends GeoJsonGeometry {
  final List<List<num>> coordinates;

  const GeoJsonMultiPoint({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.multiPoint);

  factory GeoJsonMultiPoint.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonMultiPointFromJson(json);
}

@JsonSerializable()
class GeoJsonMultiLineString extends GeoJsonGeometry {
  final List<List<List<num>>> coordinates;

  const GeoJsonMultiLineString({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.multiLineString);

  factory GeoJsonMultiLineString.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonMultiLineStringFromJson(json);
}

@JsonSerializable()
class GeoJsonMultiPolygon extends GeoJsonGeometry {
  final List<List<List<List<num>>>> coordinates;

  const GeoJsonMultiPolygon({required bbox, required this.coordinates})
      : super(bbox: bbox, type: GeoJsonGeometryType.multiPolygon);

  factory GeoJsonMultiPolygon.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonMultiPolygonFromJson(json);
}
