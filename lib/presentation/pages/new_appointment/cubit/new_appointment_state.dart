import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

part 'new_appointment_state.freezed.dart';

@freezed
class NewAppointmentState with _$NewAppointmentState {
  const factory NewAppointmentState({
    @Default([]) List<DispAppointmentState> dispAppointmentStates,
    @Default([]) List<Field> appointmentsFields,
    @Default(false) bool isDispAppointmentsSaveButtonEnabled,
    @Default(false) bool isAppointmentsSaveButtonEnabled,
  }) = _NewAppointmentState;
}

class DispAppointmentState {
  final List<Field> dispAppointmentsFields;
  final DoctorType type;

  DispAppointmentState copyWith({List<Field>? dispAppointmentsFields, DoctorType? type}) {
    return DispAppointmentState(
      dispAppointmentsFields: dispAppointmentsFields ?? this.dispAppointmentsFields,
      type: type ?? this.type
    );
  }

  const DispAppointmentState({required this.dispAppointmentsFields, required this.type});

  factory DispAppointmentState.empty() => const DispAppointmentState(
    dispAppointmentsFields: [],
    type: DoctorType.oncologist
  );
}

enum DoctorType {
  oncologist,
  rehabilitologist,
  psychiatrist;

  static String? getDoctorTypeName(DoctorType? type) =>
      switch(type) {
        DoctorType.rehabilitologist => DoctorTypes.rehabilitologist,
        DoctorType.psychiatrist => DoctorTypes.psychiatrist,
        DoctorType.oncologist => DoctorTypes.oncologist,
        null => null,
      };
}