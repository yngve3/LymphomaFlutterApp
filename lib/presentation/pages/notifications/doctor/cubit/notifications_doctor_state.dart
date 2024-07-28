import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/loading_state.dart';
import '../../../../../domain/models/patient/patient.dart';

part 'notifications_doctor_state.freezed.dart';

@freezed
class NotificationsDoctorState with _$NotificationsDoctorState {
  const factory NotificationsDoctorState({
    @Default([]) List<Patient> patients,
    @Default(LoadingState.ok) LoadingState loadingState
  }) = _NotificationsDoctorState;
}
