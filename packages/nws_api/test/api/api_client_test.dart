import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

import '../fixtures/nws_api.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('NwsApiClient', () {
    late http.Client httpClient;
    late NwsApiClient apiClient;

    setUp(() {
      httpClient = MockClient();
      apiClient = NwsApiClient(httpClient: httpClient);
    });

    group('NwsApiClient', () {
      test('can be constructed with no arguments', () {
        NwsApiClient();
      });
    });
    group('baseHeaders', () {
      test(
        'get _headers returns a map with User-Agent set when a user-agent is supplied',
        () {
          final apiClient = NwsApiClient(userAgent: 'USER_AGENT');
          expect(apiClient.baseHeaders?['User-Agent'], 'USER_AGENT');
        },
      );
    });

    group('getDailyForecast', () {
      test(
        'returns a GridpointForecastGeoJson if the call completes successfully',
        () async {
          const wfo = 'OKX';
          const x = 33;
          const y = 37;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/forecast',
              ),
              headers: {
                'Feature-Flags':
                    'forecast_temperature_qv,forecast_wind_speed_qv'
              },
            ),
          ).thenAnswer(
            (_) async => http.Response(dailyForecastResponseBody, 200),
          );

          expect(
            await apiClient.getDailyGridpointForecast(wfo: wfo, x: x, y: y),
            isA<GridpointForecastGeoJson>(),
          );
        },
      );

      test(
        'throws an exception when the response status code is not 200',
        () async {
          const wfo = 'OKX';
          const x = 99;
          const y = 99;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/forecast',
              ),
              headers: {
                'Feature-Flags':
                    'forecast_temperature_qv,forecast_wind_speed_qv'
              },
            ),
          ).thenAnswer(
            (_) async => http.Response(internalServerErrorResponseBody, 500),
          );

          expect(
            () async =>
                await apiClient.getDailyGridpointForecast(wfo: wfo, x: x, y: y),
            throwsA(isA<NwsApiFailure>()),
          );
        },
      );
    });

    group('getHourlyGridpointForecast', () {
      test(
        'returns a GridpointForecastGeoJson if the http call completes successfully',
        () async {
          const wfo = 'OKX';
          const x = 33;
          const y = 37;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/forecast/hourly',
              ),
              headers: {
                'Feature-Flags':
                    'forecast_temperature_qv,forecast_wind_speed_qv'
              },
            ),
          ).thenAnswer(
            (_) async =>
                http.Response(hourlyGridpointForecastResponseBody, 200),
          );

          expect(
            await apiClient.getHourlyGridpointForecast(wfo: wfo, x: x, y: y),
            isA<GridpointForecastGeoJson>(),
          );
        },
      );

      test(
        'throws an exception when the response status code is not 200',
        () async {
          const wfo = 'OKX';
          const x = 99;
          const y = 99;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/forecast/hourly',
              ),
              headers: {
                'Feature-Flags':
                    'forecast_temperature_qv,forecast_wind_speed_qv'
              },
            ),
          ).thenAnswer(
            (_) async => http.Response(internalServerErrorResponseBody, 500),
          );

          expect(
            () async => await apiClient.getHourlyGridpointForecast(
              wfo: wfo,
              x: x,
              y: y,
            ),
            throwsA(isA<NwsApiFailure>()),
          );
        },
      );
    });

    group('getLatestStationObservation', () {
      test(
        'returns a ObservationGeoJson if the http call completes successfully',
        () async {
          const stationId = 'KNYC';
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/stations/$stationId/observations/latest',
              ),
            ),
          ).thenAnswer(
            (_) async =>
                http.Response(latestStationObservationResponseBody, 200),
          );

          expect(
            await apiClient.getLatestStationObservation(stationId),
            isA<ObservationGeoJson>(),
          );
        },
      );

      test(
        'throws an exception when the response status code is not 200',
        () async {
          const stationId = 'KNYC';
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/stations/$stationId/observations/latest',
              ),
            ),
          ).thenAnswer(
            (_) async => http.Response(internalServerErrorResponseBody, 500),
          );

          expect(
            () async => await apiClient.getLatestStationObservation(stationId),
            throwsA(isA<NwsApiFailure>()),
          );
        },
      );
    });

    group('getGridpointObservationStations', () {
      test(
        'returns a ObservationStationCollectionGeoJson if the call completes successfully',
        () async {
          const wfo = 'OKX';
          const x = 33;
          const y = 37;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/stations',
              ),
            ),
          ).thenAnswer(
            (_) async =>
                http.Response(gridpointObservationStationsResponseBody, 200),
          );

          expect(
            await apiClient.getGridpointObservationStations(
              wfo: wfo,
              x: x,
              y: y,
            ),
            isA<ObservationStationCollectionGeoJson>(),
          );
        },
      );

      test(
        'throws an exception when the response status code is not 200',
        () async {
          const wfo = 'OKX';
          const x = 99;
          const y = 99;
          when(
            httpClient.get(
              Uri.parse(
                'https://api.weather.gov/gridpoints/$wfo/$x,$y/stations',
              ),
            ),
          ).thenAnswer(
            (_) async => http.Response(internalServerErrorResponseBody, 500),
          );

          expect(
            () async => await apiClient.getGridpointObservationStations(
              wfo: wfo,
              x: x,
              y: y,
            ),
            throwsA(isA<NwsApiFailure>()),
          );
        },
      );
    });

    group('getPoint', () {
      test(
        'returns a PointGeoJson if the http call completes successfully',
        () async {
          const point = '40.7831,-73.9712';
          when(
            httpClient.get(Uri.parse('https://api.weather.gov/points/$point')),
          ).thenAnswer((_) async => http.Response(pointResponseBody, 200));

          expect(await apiClient.getPoint(point), isA<PointGeoJson>());
        },
      );
    });

    test(
      'throws an exception when the response status code is not 200',
      () async {
        const point = '999,999';
        when(httpClient.get(Uri.parse('https://api.weather.gov/points/$point')))
            .thenAnswer(
          (_) async => http.Response(pointBadRequestResponseBody, 400),
        );

        expect(
          () async => await apiClient.getPoint(point),
          throwsA(isA<NwsApiFailure>()),
        );
      },
    );
  });
}
