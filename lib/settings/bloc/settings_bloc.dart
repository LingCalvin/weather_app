import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

part 'settings_bloc.g.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial()) {
    on<UpdateTheme>(_onUpdateTheme);
  }

  void _onUpdateTheme(UpdateTheme event, Emitter<SettingsState> emit) {
    emit(state.copyWith(theme: event.theme));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  @override
  Map<String, dynamic> toJson(SettingsState state) =>
      _$SettingsStateToJson(state);
}
