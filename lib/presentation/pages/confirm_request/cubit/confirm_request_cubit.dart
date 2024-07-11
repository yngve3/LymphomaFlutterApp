import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/doctors_interactor.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';

import '../../../../domain/models/field/field.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../domain/utils/field_changer.dart';
import 'confirm_request_state.dart';

@injectable
class ConfirmRequestCubit extends Cubit<ConfirmRequestState> {
  ConfirmRequestCubit(this._fieldChanger, this._patientsInteractor, this._doctorsInteractor) : super(const ConfirmRequestState());

  final FieldChanger _fieldChanger;
  final PatientsInteractor _patientsInteractor;
  final DoctorsInteractor _doctorsInteractor;

  @postConstruct
  void loadPatient() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final patient = await _patientsInteractor.getPatient("cbdbc0fb-e8c3-4432-93cc-3f23dfc51c75");
    final doctor = await _doctorsInteractor.getDoctorInfo();
    emit(state.copyWith(
      id: patient.id,
      fullName: patient.fullName,
      phone: patient.phone,
      familyPhone: patient.familyPhone,
      birthdate: patient.birthdate,
      therapist: doctor.fullName,
      loadingState: LoadingState.ok
    ));
  }

  void confirm() {
    _patientsInteractor.updateVerified(true, state.id);
  }

  void reject() {
    _patientsInteractor.updateVerified(false, state.id);
  }

  void onFieldChanged(String fieldName, String value) {
    EasyDebounce.debounce("fieldChanged", const Duration(milliseconds: 400), () {
      final fields = _fieldChanger.onFieldChanged(Map.of(state.inputFields), fieldName, value);
      emit(state.copyWith(
        inputFields: fields,
        isButtonAcceptEnabled: _checkButtonAcceptEnabled(fields)
      ));
    });
  }

  bool _checkButtonAcceptEnabled(Map<String, Field> fields) {
    if (fields.length != 3) return false;
    return fields.values.every((field) => field.isNotEmpty && field.isValid);
  }
}
