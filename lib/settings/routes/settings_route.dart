import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/theme_dropdown_button.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              ListTile(
                title: Text(
                  'Appearance',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const ListTile(
                title: Text('Theme'),
                trailing: ThemeDropdownButton(),
              )
            ],
          );
        },
      ),
    );
  }
}
