import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/doctors_interactor.dart';

import '../../../../../domain/models/loading_state.dart';
import 'notifications_doctor_state.dart';

@injectable
class NotificationsDoctorCubit extends Cubit<NotificationsDoctorState> {
  NotificationsDoctorCubit(this._interactor) : super(const NotificationsDoctorState());

  final DoctorsInteractor _interactor;

  @postConstruct
  void loadPatients() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final waitingPatients = await _interactor.waitingPatients;

    if (waitingPatients.isEmpty) {
      emit(state.copyWith(loadingState: LoadingState.error));
    } else {
      emit(NotificationsDoctorState(
        patients: waitingPatients,
      ));
    }
  }

}
