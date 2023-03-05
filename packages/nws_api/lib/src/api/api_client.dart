import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/gridpoint_forecast_geo_json.dart';
import '../models/observation_geo_json.dart';
import '../models/observation_station_collection_geo_json.dart';
import '../models/point_geo_json.dart';

class NwsApiFailure implements Exception {}

class NwsApiClient {
  final String? userAgent;

  NwsApiClient({http.Client? httpClient, this.userAgent})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseApiUrl = 'api.weather.gov';

  Map<String, String>? get baseHeaders {
    if (userAgent is String) {
      return {'User-Agent': userAgent!};
    }
    return null;
  }

  Future<GridpointForecastGeoJson> getDailyGridpointForecast({
    required String wfo,
    required int x,
    required int y,
  }) async {
    final request = Uri.https(_baseApiUrl, '/gridpoints/$wfo/$x,$y/forecast');
    final response = await _httpClient.get(
      request,
      headers: {
        ...?baseHeaders,
        'Feature-Flags': 'forecast_temperature_qv,forecast_wind_speed_qv'
      },
    );

    if (response.statusCode != 200) {
      throw NwsApiFailure();
    }

    return GridpointForecastGeoJson.fromJson(jsonDecode(response.body));
  }

  Future<GridpointForecastGeoJson> getHourlyGridpointForecast({
    required String wfo,
    required int x,
    required int y,
  }) async {
    final request =
        Uri.https(_baseApiUrl, '/gridpoints/$wfo/$x,$y/forecast/hourly');
    final response = await _httpClient.get(
      request,
      headers: {
        ...?baseHeaders,
        'Feature-Flags': 'forecast_temperature_qv,forecast_wind_speed_qv'
      },
    );

    if (response.statusCode != 200) {
      throw NwsApiFailure();
    }

    return GridpointForecastGeoJson.fromJson(jsonDecode(response.body));
  }

  Future<ObservationGeoJson> getLatestStationObservation(
    String stationId,
  ) async {
    final request =
        Uri.https(_baseApiUrl, '/stations/$stationId/observations/latest');
    final response = await _httpClient.get(request, headers: baseHeaders);
    if (response.statusCode != 200) {
      throw NwsApiFailure();
    }
    return ObservationGeoJson.fromJson(jsonDecode(response.body));
  }

  Future<ObservationStationCollectionGeoJson> getGridpointObservationStations({
    required String wfo,
    required int x,
    required int y,
  }) async {
    final request = Uri.https(_baseApiUrl, '/gridpoints/$wfo/$x,$y/stations');
    final response = await _httpClient.get(request, headers: baseHeaders);
    if (response.statusCode != 200) {
      throw NwsApiFailure();
    }
    return ObservationStationCollectionGeoJson.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<PointGeoJson> getPoint(String point) async {
    final request = Uri.https(_baseApiUrl, '/points/$point');
    final response = await _httpClient.get(request, headers: baseHeaders);
    if (response.statusCode != 200) {
      throw NwsApiFailure();
    }
    return PointGeoJson.fromJson(jsonDecode(response.body));
  }
}
