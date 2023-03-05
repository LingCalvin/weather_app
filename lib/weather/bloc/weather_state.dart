part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final WeatherStatus status;
  final DailyWeatherForecast dailyWeatherForecast;

  const WeatherState({
    required this.status,
    required this.dailyWeatherForecast,
  });

  const WeatherState.initial()
      : status = WeatherStatus.initial,
        dailyWeatherForecast = DailyWeatherForecast.empty;

  WeatherState copyWith({
    WeatherStatus? status,
    DailyWeatherForecast? dailyWeatherForecast,
  }) {
    return WeatherState(
      status: status ?? this.status,
      dailyWeatherForecast: dailyWeatherForecast ?? this.dailyWeatherForecast,
    );
  }

  @override
  List<Object> get props => [status, dailyWeatherForecast];
}

enum WeatherStatus { initial, loading, success, failure }
