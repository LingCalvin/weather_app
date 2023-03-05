import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

@immutable
class DailyWeatherForecast extends Equatable {
  final List<DailyWeatherForecastPeriod> periods;

  const DailyWeatherForecast({required this.periods});

  factory DailyWeatherForecast.fromRepository(
    weather_repository.DailyWeatherForecast dailyWeatherForecast,
  ) {
    return DailyWeatherForecast(
      periods: dailyWeatherForecast.periods
          .map(DailyWeatherForecastPeriod.fromRepository)
          .toList(),
    );
  }

  static const empty = DailyWeatherForecast(periods: []);

  DailyWeatherForecast copyWith({List<DailyWeatherForecastPeriod>? periods}) {
    return DailyWeatherForecast(periods: periods ?? this.periods);
  }

  @override
  List<Object?> get props => [periods];
}

@immutable
class DailyWeatherForecastPeriod extends Equatable {
  final DateTime timestamp;
  final String summary;
  final String description;
  final Temperature temperature;

  const DailyWeatherForecastPeriod({
    required this.timestamp,
    required this.summary,
    required this.description,
    required this.temperature,
  });

  factory DailyWeatherForecastPeriod.fromRepository(
    weather_repository.DailyWeatherForecastPeriod dailyWeatherForecastPeriod,
  ) {
    return DailyWeatherForecastPeriod(
      timestamp: dailyWeatherForecastPeriod.timestamp,
      summary: dailyWeatherForecastPeriod.summary,
      description: dailyWeatherForecastPeriod.description,
      temperature:
          Temperature.fromRepository(dailyWeatherForecastPeriod.temperature),
    );
  }

  @override
  List<Object?> get props => [timestamp, summary, description, temperature];
}

@immutable
class Temperature extends Equatable {
  final num value;
  final TemperatureUnit unit;

  const Temperature({required this.value, required this.unit});

  factory Temperature.fromRepository(
    weather_repository.Temperature temperature,
  ) {
    return Temperature(
      value: temperature.value,
      unit: TemperatureUnit.fromRepository(temperature.unit),
    );
  }

  @override
  List<Object?> get props => [value, unit];
}

enum TemperatureUnit {
  c,
  k;

  factory TemperatureUnit.fromRepository(
    weather_repository.TemperatureUnit temperatureUnit,
  ) {
    const mapping = {
      weather_repository.TemperatureUnit.c: TemperatureUnit.c,
      weather_repository.TemperatureUnit.k: TemperatureUnit.k,
    };

    final decodedValue = mapping[temperatureUnit];

    if (decodedValue is TemperatureUnit) {
      return decodedValue;
    }

    throw ArgumentError('Unknown enum value: $temperatureUnit');
  }
}
