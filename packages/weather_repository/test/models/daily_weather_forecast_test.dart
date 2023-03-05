import 'package:test/test.dart';
import 'package:weather_repository/src/models/daily_weather_forecast.dart';
import 'package:weather_repository/src/models/temperature.dart';
import 'package:weather_repository/src/models/weather_icon.dart';

void main() {
  group('DailyWeatherForecast', () {
    group('operator ==', () {
      test('evaluates to true when arguments have the same properties', () {
        final a = DailyWeatherForecast(
          periods: [
            DailyWeatherForecastPeriod(
              timestamp: DateTime(2023),
              summary: 'Summary',
              description: 'description',
              temperature: Temperature(value: 0, unit: TemperatureUnit.c),
              icon: [WeatherIcon.clear],
            )
          ],
        );
        final b = DailyWeatherForecast(
          periods: [
            DailyWeatherForecastPeriod(
              timestamp: DateTime(2023),
              summary: 'Summary',
              description: 'description',
              temperature: Temperature(value: 0, unit: TemperatureUnit.c),
              icon: [WeatherIcon.clear],
            )
          ],
        );

        expect(a == b, isTrue);
      });
    });
  });

  group('DailyWeatherForecastPeriod', () {
    group('operator ==', () {
      test('evaluates to true when arguments have the same properties', () {
        final a = DailyWeatherForecastPeriod(
          timestamp: DateTime(2023),
          summary: 'Summary',
          description: 'Description',
          temperature: Temperature(value: 0, unit: TemperatureUnit.c),
          icon: [WeatherIcon.clear],
        );
        final b = DailyWeatherForecastPeriod(
          timestamp: DateTime(2023),
          summary: 'Summary',
          description: 'Description',
          temperature: Temperature(value: 0, unit: TemperatureUnit.c),
          icon: [WeatherIcon.clear],
        );

        expect(a == b, isTrue);
      });
    });
  });
}
