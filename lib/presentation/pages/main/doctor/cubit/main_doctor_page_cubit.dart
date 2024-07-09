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
    emit(state.copyWith(allPatients: patients));
  }
}
