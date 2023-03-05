import 'package:test/test.dart';
import 'package:weather_repository/src/weather_repository_base.dart';

void main() {
  group('decodeIcon', () {
    test('successfully decodes URL with single icon with a query string', () {
      expect(
        decodeIcon(
          'https://api.weather.gov/icons/land/night/rain_showers?size=medium',
        ),
        containsAll([WeatherIcon.rainShowersHighCloudCover]),
      );
    });

    test('successfully decodes URL with single icon with a number', () {
      expect(
        decodeIcon('https://api.weather.gov/icons/land/night/rain_showers,20'),
        containsAll([WeatherIcon.rainShowersHighCloudCover]),
      );
    });

    test('successfully decodes URL with two icons', () {
      expect(
        decodeIcon(
          'https://api.weather.gov/icons/land/day/rain_showers,20/wind_sct',
        ),
        containsAll([
          WeatherIcon.rainShowersHighCloudCover,
          WeatherIcon.partlyCloudyWindy
        ]),
      );
    });
  });
}
