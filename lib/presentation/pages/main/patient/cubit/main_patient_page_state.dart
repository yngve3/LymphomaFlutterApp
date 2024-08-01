import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lymphoma/domain/models/appointment.dart';

import '../../../../../domain/models/loading_state.dart';
import '../../../../../domain/models/patient/patient.dart';

part 'main_patient_page_state.freezed.dart';

@freezed
class MainPatientPageState with _$MainPatientPageState {
  const factory MainPatientPageState({
    required Appointment comingAppointment,
    Patient? patient,
    @Default(LoadingState.ok) LoadingState comingAppointmentLoadingState,
    @Default(LoadingState.ok) LoadingState patientLoadingState
  }) = _MainPatientPageState;
}
