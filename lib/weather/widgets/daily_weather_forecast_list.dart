import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather.dart';

class DailyWeatherForecastList extends StatelessWidget {
  final List<DailyWeatherForecastPeriod> periods;

  const DailyWeatherForecastList({super.key, required this.periods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: periods.length,
      itemBuilder: (context, index) {
        final period = periods[index];
        return ListTile(
          title: Text(DateFormat.MMMMEEEEd().format(period.timestamp)),
          subtitle: Text(period.summary),
        );
      },
    );
  }
}
