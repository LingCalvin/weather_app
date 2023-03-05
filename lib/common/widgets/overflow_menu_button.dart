import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../settings/routes/settings_route.dart';

class OverflowMenuButton extends StatelessWidget {
  const OverflowMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 'settings') {
          unawaited(
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsRoute(),
              ),
            ),
          );
        }
        if (value == 'about') {
          final packageInfo = context.read<PackageInfo>();
          showAboutDialog(
            context: context,
            applicationName: packageInfo.appName,
            applicationVersion: packageInfo.version,
            applicationLegalese: '© 2023 Calvin Ling',
          );
        }
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem(value: 'settings', child: Text('Settings')),
          PopupMenuItem(value: 'about', child: Text('About')),
        ];
      },
    );
  }
}
