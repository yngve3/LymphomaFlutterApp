import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/domain/models/appointment.dart';

import '../../../../../domain/models/loading_state.dart';
import '../../../../../domain/models/patient/patient.dart';
import 'main_patient_page_state.dart';

@injectable
class MainPatientPageCubit extends Cubit<MainPatientPageState> {
  MainPatientPageCubit(this._interactor, @factoryParam this.patient) : super(MainPatientPageState(comingAppointment: Appointment.empty()));

  final PatientsInteractor _interactor;
  final Patient? patient;

  @postConstruct
  void loadPatientInfo() async {
    emit(state.copyWith(comingAppointmentLoadingState: LoadingState.loading));
    final comingAppointment = await _interactor.getComingAppointment(patient: patient);
    if (comingAppointment.isEmpty) {
      emit(state.copyWith(comingAppointmentLoadingState: LoadingState.error));
    } else {
      emit(MainPatientPageState(comingAppointment: comingAppointment));
    }
  }
}
