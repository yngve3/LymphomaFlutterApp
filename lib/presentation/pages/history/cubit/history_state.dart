import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lymphoma/domain/models/appointment.dart';

import '../../../../domain/models/loading_state.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default([]) List<Appointment> appointments,
    @Default(LoadingState.ok) LoadingState loadingState
  }) = _HistoryState;
}