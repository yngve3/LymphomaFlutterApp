import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/field/field.dart';

part 'new_appointment_state.freezed.dart';

@freezed
class NewAppointmentState with _$NewAppointmentState {
  const factory NewAppointmentState({
    @Default([]) List<Field> dispAppointmentsFields,
    @Default([]) List<Field> appointmentsFields,
    @Default(false) bool isDispAppointmentsSaveButtonEnabled,
    @Default(false) bool isAppointmentsSaveButtonEnabled,
  }) = _NewAppointmentState;
}