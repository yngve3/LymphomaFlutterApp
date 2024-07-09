import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/patient/patient.dart';

part 'main_doctor_page_state.freezed.dart';

@freezed
class MainDoctorPageState with _$MainDoctorPageState {
  const factory MainDoctorPageState({
    @Default([]) List<Patient> allPatients,
    @Default([]) List<Patient> favoritePatients,
  }) = _MainDoctorPageState;
}
