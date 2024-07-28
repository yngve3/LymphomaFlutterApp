import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';

import 'main_doctor_page_state.dart';

@injectable
class MainDoctorPageCubit extends Cubit<MainDoctorPageState> {
  MainDoctorPageCubit(this._interactor) : super(const MainDoctorPageState());

  final PatientsInteractor _interactor;

  @postConstruct
  void loadPatients() async {
    final patients = await _interactor.allPatients;
    final doctor = await _interactor.currentDoctor;
    final favoritePatients = patients.where((patient) => patient.doctor.id == doctor.id).toList();
    emit(state.copyWith(allPatients: patients.toSet().difference(favoritePatients.toSet()).toList(), favoritePatients: favoritePatients));
  }
}
