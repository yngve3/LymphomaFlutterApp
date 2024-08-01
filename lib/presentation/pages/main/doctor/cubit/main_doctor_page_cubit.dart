import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/interactors/doctors_interactor.dart';
import '../../../../../domain/models/loading_state.dart';
import 'main_doctor_page_state.dart';

@injectable
class MainDoctorPageCubit extends Cubit<MainDoctorPageState> {
  MainDoctorPageCubit(this._interactor) : super(const MainDoctorPageState());

  final DoctorsInteractor _interactor;

  @postConstruct
  void loadState() async {
    loadPatients();
    loadAppointments();
  }

  void loadPatients() async {
    emit(state.copyWith(patientsLoadingState: LoadingState.loading));
    final patients = await _interactor.allPatients;
    final doctor = await _interactor.currentDoctor;
    final favoritePatients = patients.where((patient) => patient.doctor.id == doctor.id).toList();
    emit(state.copyWith(allPatients: patients.toSet().difference(favoritePatients.toSet()).toList(), favoritePatients: favoritePatients, patientsLoadingState: LoadingState.ok));
  }

  void loadAppointments() async {
    emit(state.copyWith(appointmentsLoadingState: LoadingState.loading));
    final appointments = (await _interactor.appointments).where((appointment) => appointment.dateTime.isAfter(DateTime.now())).toList();
    emit(state.copyWith(appointmentsLoadingState: LoadingState.ok, appointments: appointments));
  }
}
