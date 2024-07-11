import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/loading_state.dart';

part 'doctor_profile_page_state.freezed.dart';

@freezed
class DoctorProfilePageState with _$DoctorProfilePageState {
  const factory DoctorProfilePageState({
    @Default("") String fullName,
    @Default("") String type,
    @Default("") String room,
    @Default("") String phone,
    @Default(LoadingState.ok) LoadingState loadingState,
    @Default(LoadingState.ok) LoadingState photoUpdateState,
    String? imageURL,
  }) = _DoctorProfilePageState;
}
