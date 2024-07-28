import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/field/field.dart';
import '../../../../../domain/models/loading_state.dart';
import '../../../../../domain/models/screen_state.dart';

part 'patient_profile_state.freezed.dart';

@freezed
class PatientProfileState with _$PatientProfileState {
  const factory PatientProfileState({
    @Default([]) List<Field> fields,
    @Default(LoadingState.ok) LoadingState loadingState,
    @Default(ScreenState.other) ScreenState screenState
  }) = _PatientProfileState;
}
