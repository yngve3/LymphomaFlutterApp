import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/appointments_interactor.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/domain/models/appointment.dart';

import '../../../../../domain/models/loading_state.dart';
import 'main_patient_page_state.dart';

@injectable
class MainPatientPageCubit extends Cubit<MainPatientPageState> {
  MainPatientPageCubit(this._interactor, @factoryParam this.patientID) : super(MainPatientPageState(comingAppointment: Appointment.empty()));

  final PatientsInteractor _interactor;
  final String? patientID;

  @postConstruct
  void loadInfo() async {
    loadPatient();
    loadComingAppointment();
  }

  void loadComingAppointment() async {
    emit(state.copyWith(comingAppointmentLoadingState: LoadingState.loading));
    final comingAppointment = await _interactor.getComingAppointment(patientID: patientID);
    if (comingAppointment.isEmpty) {
      emit(state.copyWith(comingAppointmentLoadingState: LoadingState.error));
    } else {
      emit(state.copyWith(comingAppointment: comingAppointment, comingAppointmentLoadingState: LoadingState.ok));
    }
  }

  void loadPatient() async {
    emit(state.copyWith(patientLoadingState: LoadingState.loading));
    final patient = await _interactor.getPatient(id: patientID);
    emit(state.copyWith(patientLoadingState: LoadingState.ok, patient: patient));
  }
}
