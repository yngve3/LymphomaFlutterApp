import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lymphoma/domain/models/appointment.dart';

import '../../../../../domain/models/loading_state.dart';

part 'main_patient_page_state.freezed.dart';

@freezed
class MainPatientPageState with _$MainPatientPageState {
  const factory MainPatientPageState({
    required Appointment comingAppointment,
    @Default(LoadingState.ok) LoadingState comingAppointmentLoadingState
  }) = _MainPatientPageState;
}
