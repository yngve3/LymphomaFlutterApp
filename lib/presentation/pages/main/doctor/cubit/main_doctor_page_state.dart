import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lymphoma/domain/models/loading_state.dart';

import '../../../../../domain/models/appointment.dart';
import '../../../../../domain/models/patient/patient.dart';

part 'main_doctor_page_state.freezed.dart';

@freezed
class MainDoctorPageState with _$MainDoctorPageState {
  const factory MainDoctorPageState({
    @Default([]) List<Patient> allPatients,
    @Default([]) List<Patient> favoritePatients,
    @Default([]) List<Appointment> appointments,
    @Default(LoadingState.ok) LoadingState appointmentsLoadingState,
    @Default(LoadingState.ok) LoadingState patientsLoadingState,
  }) = _MainDoctorPageState;
}
