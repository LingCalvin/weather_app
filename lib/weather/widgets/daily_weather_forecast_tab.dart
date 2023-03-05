import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import 'daily_weather_forecast_list.dart';

class DailyWeatherForecastTab extends StatelessWidget {
  const DailyWeatherForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherStatus.failure:
            return const Center(child: Icon(Icons.warning));
          case WeatherStatus.initial:
            return const Placeholder();
          case WeatherStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case WeatherStatus.success:
            return DailyWeatherForecastList(
              periods: state.dailyWeatherForecast.periods,
            );
        }
      },
    );
  }
}
