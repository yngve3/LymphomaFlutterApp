import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/domain/models/verification_status.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../../domain/utils/field_changer.dart';
import 'confirm_request_state.dart';

@injectable
class ConfirmRequestCubit extends Cubit<ConfirmRequestState> {
  ConfirmRequestCubit(
      this._fieldChanger,
      this._patientsInteractor,
      @factoryParam this.patient
  ) : super(ConfirmRequestState(
    fields: _fieldChanger.generate([
      FieldLabels.fullName,
      FieldLabels.birthdate,
      FieldLabels.phoneNumber,
      FieldLabels.familyPhoneNumber,
      FieldLabels.therapist,
      FieldLabels.phoneDoctor,
      FieldLabels.diagnosis,
      FieldLabels.hystDiagnosis,
      FieldLabels.treatment
    ])
  ));

  final Patient patient;
  final FieldChanger _fieldChanger;
  final PatientsInteractor _patientsInteractor;

  @postConstruct
  void loadPatient() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final doctor = patient.doctor.isEmpty ? await _patientsInteractor.currentDoctor : patient.doctor;
    final fields = [
      Field(label: FieldLabels.fullName, text: patient.fullName),
      DateField(label: FieldLabels.birthdate, date: patient.birthdate),
      Field(label: FieldLabels.phoneNumber, text: patient.phone),
      Field(label: FieldLabels.familyPhoneNumber, text: patient.familyPhone),
      Field(label: FieldLabels.therapist, text: doctor.fullName),
      Field(label: FieldLabels.phoneDoctor, text: doctor.phone),
      Field(label: FieldLabels.diagnosis, text: patient.diagnosis ?? ""),
      Field(label: FieldLabels.hystDiagnosis, text: patient.hystDiagnosis ?? ""),
      Field(label: FieldLabels.treatment, text: patient.treatment ?? ""),
    ];
    emit(state.copyWith(
      id: patient.id,
      birthdate: patient.birthdate,
      loadingState: LoadingState.ok,
      isButtonAcceptEnabled: _checkButtonAcceptEnabled(fields),
      fields: fields,
    ));
  }

  void confirm() {
    _patientsInteractor.updateVerified(VerificationStatus.accepted, state.id);
    _patientsInteractor.update(state.fields, state.id);
  }

  void reject() {
    _patientsInteractor.updateVerified(VerificationStatus.rejected, state.id);
  }

  void onFieldChanged(Field field, dynamic value) {
    EasyDebounce.debounce("fieldChanged", const Duration(milliseconds: 400), () {
      final fields = _fieldChanger.onFieldChanged([...state.fields], field, value);
      emit(state.copyWith(
        fields: fields,
        isButtonAcceptEnabled: _checkButtonAcceptEnabled(fields)
      ));
    });
  }

  bool _checkButtonAcceptEnabled(List<Field> fields) {
    return fields.every((field) => field.isNotEmpty && !field.isError);
  }
}
