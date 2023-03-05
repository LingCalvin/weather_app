import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

import 'settings/bloc/settings_bloc.dart';
import 'settings/models/settings.dart' as settings;
import 'theme.dart';
import 'weather/bloc/weather_bloc.dart';
import 'weather/routes/weather_route.dart';

class WeatherApp extends StatelessWidget {
  final WeatherRepository _weatherRepository;
  const WeatherApp({super.key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc(),
      child: BlocSelector<SettingsBloc, SettingsState, settings.ThemeMode>(
        selector: (state) => state.theme,
        builder: (context, state) {
          return MaterialApp(
            theme: themeData,
            darkTheme: ThemeData.dark(),
            themeMode: state.toMaterialThemeMode(),
            home: BlocProvider(
              create: (_) {
                final bloc = WeatherBloc(weatherRepository: _weatherRepository);
                bloc.add(RefreshRequested());
                return bloc;
              },
              child: const WeatherRoute(),
            ),
          );
        },
      ),
    );
  }
}
