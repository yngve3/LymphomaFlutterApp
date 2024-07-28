import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/appointments_interactor.dart';
import 'package:lymphoma/domain/utils/field_changer.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';
import '../../../../domain/models/patient/patient.dart';
import 'new_appointment_state.dart';

@injectable
class NewAppointmentCubit extends Cubit<NewAppointmentState> {
  NewAppointmentCubit(@factoryParam this.patient, this._fieldChanger, this._appointmentsInteractor) : super(NewAppointmentState(
    appointmentsFields: _fieldChanger.generate([
      FieldLabels.appointmentDate,
      FieldLabels.appointmentTime,
    ])
  ));

  final Patient patient;
  final FieldChanger _fieldChanger;
  final AppointmentsInteractor _appointmentsInteractor;

  void saveAppointment() {
    _appointmentsInteractor.createAppointment(state.appointmentsFields, patient.id);
  }

  void onFieldChanged(Field field, dynamic value) {
    EasyDebounce.debounce("loginFieldChanged", const Duration(milliseconds: 400), () {
      final fields = _fieldChanger.onFieldChanged([...state.appointmentsFields], field, value);
      emit(state.copyWith(
        appointmentsFields: fields,
        isAppointmentsSaveButtonEnabled: _checkAppointmentsSaveButtonEnabled(fields),
      ));
    });
  }

  bool _checkAppointmentsSaveButtonEnabled(List<Field> fields) {
    return fields.every((field) => field.isNotEmpty && !field.isError);
  }
}
