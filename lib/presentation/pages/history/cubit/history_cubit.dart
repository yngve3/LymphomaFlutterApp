import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/appointments_interactor.dart';
import 'package:lymphoma/domain/models/loading_state.dart';

import '../../../../domain/models/patient/patient.dart';
import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._appointmentsInteractor, @factoryParam this.patient) : super(const HistoryState());

  final AppointmentsInteractor _appointmentsInteractor;
  final Patient patient;

  @postConstruct
  void loadAppointments() async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final appointments = await _appointmentsInteractor.getAllAppointments(patient.id);
    emit(HistoryState(
      appointments: appointments
    ));
  }
}
