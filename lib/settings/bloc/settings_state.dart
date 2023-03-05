part of 'settings_bloc.dart';

@JsonSerializable()
class SettingsState extends Equatable {
  final ThemeMode theme;
  const SettingsState({required this.theme});

  const SettingsState.initial() : theme = ThemeMode.system;

  SettingsState copyWith({ThemeMode? theme}) {
    return SettingsState(theme: theme ?? this.theme);
  }

  @override
  List<Object> get props => [theme];
}
