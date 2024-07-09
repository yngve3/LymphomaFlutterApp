import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';

import 'main_patient_page_state.dart';

@injectable
class MainPatientPageCubit extends Cubit<MainPatientPageState> {
  MainPatientPageCubit(this._interactor) : super(const MainPatientPageState());

  final PatientsInteractor _interactor;

  @postConstruct
  void loadPatientInfo() async {

  }
}
