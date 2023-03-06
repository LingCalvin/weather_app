import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:nws_api/nws_api.dart';

import 'models/daily_weather_forecast.dart';
import 'models/temperature.dart';
import 'utils/http_caching_client.dart';
import 'utils/nws_icon.dart';

class WeatherRepository {
  final NwsApiClient _weatherApiClient;

  WeatherRepository({NwsApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ??
            NwsApiClient(httpClient: HttpCachingClient(http.Client()));

  Future<DailyWeatherForecast> getDailyWeatherForecast(
    num latitude,
    num longitude,
  ) async {
    final point = await _weatherApiClient.getPoint('$latitude,$longitude');
    final forecast = await _weatherApiClient.getDailyGridpointForecast(
      wfo: point.properties.gridId ?? '',
      x: point.properties.gridX ?? 0,
      y: point.properties.gridY ?? 0,
    );

    final periodsGroupedByDay =
        // Use a LinkedHashMap to preserve the ordering
        LinkedHashMap<String, List<GridpointForecastPeriod>>.from(
      groupBy(
        (forecast.properties.periods ?? <GridpointForecastPeriod>[])
            .where((period) => period.startTime != null),
        (period) {
          final timestamp = period.startTime?.toLocal();
          if (timestamp == null) {
            return null;
          }
          return timestamp.toIso8601String().substring(0, 10);
        },
      ),
    ).values.toList();
    return DailyWeatherForecast(
      periods: periodsGroupedByDay
          // A day can have a period for daytime and a period for night time.
          // Only take the first available period for that day.
          .map((periods) => periods[0])
          .map(
            (period) => DailyWeatherForecastPeriod(
              timestamp: (period.startTime ?? DateTime(0)).toLocal(),
              summary: period.shortForecast ?? '',
              description: period.detailedForecast ?? '',
              temperature: Temperature(
                value: period.temperature?.value ?? 0,
                unit: TemperatureUnit.fromJson(
                  period.temperature?.unitCode ?? '',
                ),
              ),
              icon: decodeIcon(period.icon ?? ''),
            ),
          )
          .toList(),
    );
  }
}
