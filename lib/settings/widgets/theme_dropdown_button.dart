import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';
import '../models/settings.dart' as settings;

class ThemeDropdownButton extends StatelessWidget {
  const ThemeDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, settings.ThemeMode>(
      selector: (state) {
        return state.theme;
      },
      builder: (context, state) {
        return DropdownButton(
          value: state,
          items: const [
            DropdownMenuItem(
              value: settings.ThemeMode.system,
              child: Text('System'),
            ),
            DropdownMenuItem(
              value: settings.ThemeMode.light,
              child: Text('Light'),
            ),
            DropdownMenuItem(
              value: settings.ThemeMode.dark,
              child: Text('Dark'),
            ),
          ],
          onChanged: (theme) {
            if (theme is settings.ThemeMode) {
              context.read<SettingsBloc>().add(UpdateTheme(theme));
            }
          },
        );
      },
    );
  }
}
