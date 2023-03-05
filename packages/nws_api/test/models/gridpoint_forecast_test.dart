import 'package:nws_api/nws_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'GridpointForecast',
    () {
      group('fromJson', () {
        test('successfully decodes map', () {
          const jsonMap = <String, dynamic>{
            'updated': '2023-03-02T02:26:00+00:00',
            'units': 'us',
            'forecastGenerator': 'BaselineForecastGenerator',
            'generatedAt': '2023-03-02T07:24:39+00:00',
            'updateTime': '2023-03-02T02:26:00+00:00',
            'validTimes': '2023-03-01T20:00:00+00:00/P7DT11H',
            'elevation': {'unitCode': 'wmoUnit:m', 'value': 24.9936},
            'periods': []
          };

          final result = GridpointForecast.fromJson(jsonMap);

          expect(
            result,
            isA<GridpointForecast>()
                .having((obj) => obj.units, 'units', GridpointForecastUnit.us)
                .having(
                  (obj) => obj.forecastGenerator,
                  'units',
                  jsonMap['forecastGenerator'],
                )
                .having(
                  (obj) => obj.generatedAt,
                  'generatedAt',
                  DateTime.parse(jsonMap['generatedAt']),
                )
                .having(
                  (obj) => obj.updateTime,
                  'updateTime',
                  DateTime.parse(jsonMap['updateTime']),
                )
                .having(
                  (obj) => obj.validTimes,
                  'validTimes',
                  jsonMap['validTimes'],
                )
                .having(
                  (obj) => obj.elevation,
                  'elevation',
                  isA<QuantitativeValue>(),
                )
                .having(
                  (obj) => obj.periods,
                  'periods',
                  isA<List<GridpointForecastPeriod>>(),
                ),
          );
        });
      });
    },
  );

  group(
    'GridpointForecastUnit',
    () {
      group('fromJson', () {
        for (final valueResultPair in [
          ['us', GridpointForecastUnit.us],
          ['si', GridpointForecastUnit.si],
        ]) {
          test('successfully decodes "${valueResultPair[0]}"', () {
            expect(
              GridpointForecastUnit.fromJson(valueResultPair[0]),
              valueResultPair[1],
            );
          });
        }

        test('throws an error on invalid value', () {
          expect(
            () => GridpointForecastUnit.fromJson(''),
            throwsA(isA<ArgumentError>()),
          );
        });
      });
    },
  );

  group('GridpointForecastPeriod', () {
    group('fromJson', () {
      test('successfully decodes map', () {
        const jsonMap = <String, dynamic>{
          'number': 1,
          'name': 'Overnight',
          'startTime': '2023-03-02T02:00:00-05:00',
          'endTime': '2023-03-02T06:00:00-05:00',
          'isDaytime': false,
          'temperature': {'unitCode': 'wmoUnit:degC', 'value': 5},
          'temperatureTrend': 'rising',
          'probabilityOfPrecipitation': {
            'unitCode': 'wmoUnit:percent',
            'value': 60
          },
          'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 4.444444444444445},
          'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 89},
          'windSpeed': {'unitCode': 'wmoUnit:km_h-1', 'value': 3.704},
          'windGust': null,
          'windDirection': 'NE',
          'icon':
              'https://api.weather.gov/icons/land/night/rain,60?size=medium',
          'shortForecast': 'Light Rain Likely',
          'detailedForecast':
              'Rain likely and patchy drizzle and patchy fog. Cloudy. Low around 41, with temperatures rising to around 43 overnight. Northeast wind around 2 mph. Chance of precipitation is 60%.',
        };

        final result = GridpointForecastPeriod.fromJson(jsonMap);

        expect(
          result,
          isA<GridpointForecastPeriod>()
              .having((obj) => obj.number, 'number', jsonMap['number'])
              .having((obj) => obj.name, 'name', jsonMap['name'])
              .having(
                (obj) => obj.startTime,
                'startTime',
                DateTime.parse(jsonMap['startTime']),
              )
              .having(
                (obj) => obj.endTime,
                'endTime',
                DateTime.parse(jsonMap['endTime']),
              )
              .having((obj) => obj.isDaytime, 'isDaytime', jsonMap['isDaytime'])
              .having(
                (obj) => obj.temperature,
                'temperature',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.temperatureTrend,
                'temperatureTrend',
                GridpointForecastPeriodTemperatureTrend.rising,
              )
              .having(
                (obj) => obj.probabilityOfPrecipitation,
                'probabilityOfPrecipitation',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.dewpoint,
                'dewpoint',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.relativeHumidity,
                'relativeHumidity',
                isA<QuantitativeValue>(),
              )
              .having(
                (obj) => obj.windSpeed,
                'windSpeed',
                isA<QuantitativeValue>(),
              )
              .having((obj) => obj.windGust, 'windGust', null)
              .having(
                (obj) => obj.windDirection,
                'windDirection',
                GridpointForecastWindDirection.ne,
              )
              .having((obj) => obj.icon, 'icon', jsonMap['icon'])
              .having(
                (obj) => obj.shortForecast,
                'shortForecast',
                jsonMap['shortForecast'],
              )
              .having(
                (obj) => obj.detailedForecast,
                'detailedForecast',
                jsonMap['detailedForecast'],
              ),
        );
      });
    });
  });

  group('GridpointForecastPeriodTemperatureTrend', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['rising', GridpointForecastPeriodTemperatureTrend.rising],
        ['falling', GridpointForecastPeriodTemperatureTrend.falling],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            GridpointForecastPeriodTemperatureTrend.fromJson(
              valueResultPair[0],
            ),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => GridpointForecastPeriodTemperatureTrend.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });

  group('GridpointForecastWindDirection', () {
    group('fromJson', () {
      for (final valueResultPair in [
        ['N', GridpointForecastWindDirection.n],
        ['NNE', GridpointForecastWindDirection.nne],
        ['NE', GridpointForecastWindDirection.ne],
        ['ENE', GridpointForecastWindDirection.ene],
        ['E', GridpointForecastWindDirection.e],
        ['ESE', GridpointForecastWindDirection.ese],
        ['SE', GridpointForecastWindDirection.se],
        ['SSE', GridpointForecastWindDirection.sse],
        ['S', GridpointForecastWindDirection.s],
        ['SSW', GridpointForecastWindDirection.ssw],
        ['SW', GridpointForecastWindDirection.sw],
        ['WSW', GridpointForecastWindDirection.wsw],
        ['W', GridpointForecastWindDirection.w],
        ['WNW', GridpointForecastWindDirection.wnw],
        ['NW', GridpointForecastWindDirection.nw],
        ['NNW', GridpointForecastWindDirection.nnw],
      ]) {
        test('successfully decodes "${valueResultPair[0]}"', () {
          expect(
            GridpointForecastWindDirection.fromJson(valueResultPair[0]),
            valueResultPair[1],
          );
        });
      }

      test('throws an error on invalid value', () {
        expect(
          () => GridpointForecastWindDirection.fromJson(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
}
