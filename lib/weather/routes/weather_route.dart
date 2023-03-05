import 'package:flutter/material.dart';

import '../../common/widgets/overflow_menu_button.dart';
import '../widgets/current_weather_tab.dart';
import '../widgets/daily_weather_forecast_tab.dart';
import '../widgets/hourly_weather_forecast_tab.dart';

class WeatherRoute extends StatelessWidget {
  static const _tabs = [
    Tab(text: 'Current'),
    Tab(text: 'Hourly'),
    Tab(text: 'Daily'),
  ];

  const WeatherRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: WeatherRoute._tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          actions: const [OverflowMenuButton()],
          bottom: const TabBar(tabs: WeatherRoute._tabs),
        ),
        body: const TabBarView(
          children: [
            CurrentWeatherTab(),
            HourlyWeatherForecastTab(),
            DailyWeatherForecastTab(),
          ],
        ),
      ),
    );
  }
}
