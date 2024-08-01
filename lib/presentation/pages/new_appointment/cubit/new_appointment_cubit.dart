import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/appointments_interactor.dart';
import 'package:lymphoma/domain/utils/field_changer.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';
import 'new_appointment_state.dart';

@injectable
class NewAppointmentCubit extends Cubit<NewAppointmentState> {
  NewAppointmentCubit(
      @factoryParam this.patientID,
      this._fieldChanger,
      this._appointmentsInteractor
  ) : super(NewAppointmentState(
    appointmentsFields: _fieldChanger.generate([
      FieldLabels.appointmentDate,
      FieldLabels.appointmentTime,
    ])
  ));

  @postConstruct
  void init() {
    addDispAppointmentInput();
  }

  void addDispAppointmentInput() {
    final dispAppointmentsStates = [...state.dispAppointmentStates];

    dispAppointmentsStates.add(DispAppointmentState(
      dispAppointmentsFields: _fieldChanger.generate(_dispFieldNames),
      type: DoctorType.oncologist,
    ));

    emit(state.copyWith(
      dispAppointmentStates: dispAppointmentsStates,
      isDispAppointmentsSaveButtonEnabled: _checkDispAppointmentsSaveButtonEnabled(dispAppointmentsStates),
    ));
  }

  void deleteDispAppointmentInput(int index) {
    final dispAppointmentStates = [...state.dispAppointmentStates];
    dispAppointmentStates.removeAt(index);
    emit(state.copyWith(
      dispAppointmentStates: dispAppointmentStates,
      isDispAppointmentsSaveButtonEnabled: _checkDispAppointmentsSaveButtonEnabled(dispAppointmentStates),
    ));
  }

  void changeDoctorType(DoctorType type, int index) {
    final dispAppointmentStates = [...state.dispAppointmentStates];
    final dispState = dispAppointmentStates[index];
    dispAppointmentStates[index] = dispState.copyWith(type: type);
    emit(state.copyWith(dispAppointmentStates: dispAppointmentStates));
  }

  final _dispFieldNames = [
    FieldLabels.room,
    FieldLabels.appointmentDate,
    FieldLabels.appointmentTime
  ];

  final String? patientID;
  final FieldChanger _fieldChanger;
  final AppointmentsInteractor _appointmentsInteractor;

  void saveAppointment() {
    _appointmentsInteractor.createAppointment(state.appointmentsFields, patientID ?? "");
  }

  void saveDispAppointment() {
    _appointmentsInteractor.createDispAppointment(state.dispAppointmentStates, patientID ?? "");
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

  void onDispFieldChanged(Field field, dynamic value, int index) {
    EasyDebounce.debounce("loginFieldChanged", const Duration(milliseconds: 400), () {
      final dispAppointmentStates = [...state.dispAppointmentStates];
      final dispState = dispAppointmentStates[index];
      final dispAppointmentsFields = _fieldChanger.onFieldChanged(dispState.dispAppointmentsFields, field, value);
      dispAppointmentStates[index] = dispState.copyWith(dispAppointmentsFields: dispAppointmentsFields);
      emit(state.copyWith(
        dispAppointmentStates: dispAppointmentStates,
        isDispAppointmentsSaveButtonEnabled: _checkDispAppointmentsSaveButtonEnabled(dispAppointmentStates),
      ));
    });
  }

  bool _checkAppointmentsSaveButtonEnabled(List<Field> fields) {
    return fields.every((field) => field.isNotEmpty && !field.isError);
  }

  bool _checkDispAppointmentsSaveButtonEnabled(List<DispAppointmentState> dispAppointmentStates) {
    return dispAppointmentStates.every((dispState) => dispState.dispAppointmentsFields.every((field) => field.isNotEmpty && !field.isError));
  }
}
