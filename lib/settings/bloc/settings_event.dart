part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateTheme extends SettingsEvent {
  final ThemeMode theme;

  const UpdateTheme(this.theme);
}
