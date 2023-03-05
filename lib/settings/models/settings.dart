import 'package:flutter/material.dart' as material;

enum ThemeMode {
  system,
  light,
  dark;

  material.ThemeMode toMaterialThemeMode() {
    return <ThemeMode, material.ThemeMode>{
      ThemeMode.system: material.ThemeMode.system,
      ThemeMode.light: material.ThemeMode.light,
      ThemeMode.dark: material.ThemeMode.dark,
    }[this]!;
  }
}
