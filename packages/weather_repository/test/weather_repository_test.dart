import 'package:mocktail/mocktail.dart';
import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';
import 'package:weather_repository/src/weather_repository.dart';

import 'fixtures/gridpoint_forecast_geo_json.dart';
import 'fixtures/point_geo_json.dart';

class MockNwsApiClient extends Mock implements NwsApiClient {}

void main() {
  group('WeatherRepository', () {
    late NwsApiClient apiClient;
    late WeatherRepository weatherRepository;
    setUp(() {
      apiClient = MockNwsApiClient();
      weatherRepository = WeatherRepository(weatherApiClient: apiClient);
    });

    group('WeatherRepository', () {
      test('can be constructed without passing an API client', () {
        WeatherRepository();
      });
    });

    group('getDailyWeatherForecast', () {
      test(
        'calls getDailyWeatherForecast with correct wfo, x, and y',
        () async {
          const latitude = 40.7831;
          const longitude = -73.9217;
          when(() => apiClient.getPoint(any())).thenAnswer(
            (_) async => pointGeoJson,
          );
          when(
            () => apiClient.getDailyGridpointForecast(
              wfo: any(named: 'wfo'),
              x: any(named: 'x'),
              y: any(named: 'y'),
            ),
          ).thenAnswer(
            (_) async => gridpointForecastGeoJson,
          );

          await weatherRepository.getDailyWeatherForecast(
            latitude,
            longitude,
          );

          verify(
            () => apiClient.getDailyGridpointForecast(
              wfo: pointGeoJson.properties.gridId!,
              x: pointGeoJson.properties.gridX!,
              y: pointGeoJson.properties.gridY!,
            ),
          ).called(1);
        },
      );
    });
  });
}
