import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/domain/utils/field_changer.dart';
import 'package:lymphoma/presentation/pages/profile/patient/cubit/patient_profile_state.dart';

import '../../../../../consts/strings.dart';
import '../../../../../domain/models/field/field.dart';
import '../../../../../domain/models/loading_state.dart';
import '../../../../../domain/models/patient/patient.dart';

@injectable
class PatientProfileCubit extends Cubit<PatientProfileState> {
  PatientProfileCubit(
      this._patientsInteractor,
      this._fieldChanger,
      @factoryParam this.transmittedPatientID
    ) : super(PatientProfileState(
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

  final String? transmittedPatientID;
  final PatientsInteractor _patientsInteractor;
  final FieldChanger _fieldChanger;

  @postConstruct
  void loadPatient() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final patient = await _patientsInteractor.getPatient(id: transmittedPatientID);
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
      loadingState: LoadingState.ok,
      fields: fields,
    ));
  }
}
