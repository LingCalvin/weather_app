import 'package:equatable/equatable.dart';
import 'temperature.dart';
import 'weather_icon.dart';

class DailyWeatherForecast extends Equatable {
  final List<DailyWeatherForecastPeriod> periods;

  DailyWeatherForecast({required this.periods});

  @override
  List<Object?> get props => [periods];
}

class DailyWeatherForecastPeriod extends Equatable {
  final DateTime timestamp;
  final String summary;
  final String description;
  final Temperature temperature;
  final List<WeatherIcon> icon;

  DailyWeatherForecastPeriod({
    required this.timestamp,
    required this.summary,
    required this.description,
    required this.temperature,
    required this.icon,
  });

  @override
  List<Object?> get props => [timestamp, summary, description, temperature];
}
