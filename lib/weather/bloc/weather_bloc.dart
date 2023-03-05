import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

import '../../location/utils/location.dart';
import '../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(const WeatherState.initial()) {
    on<RefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onRefreshRequested(
    WeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final position = await getCurrentPosition();
      final forecast = DailyWeatherForecast.fromRepository(
        await _weatherRepository.getDailyWeatherForecast(
          position.latitude,
          position.longitude,
        ),
      );
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          dailyWeatherForecast: forecast,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
