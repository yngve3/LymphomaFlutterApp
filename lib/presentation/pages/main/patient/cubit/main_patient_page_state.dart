import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_patient_page_state.freezed.dart';

@freezed
class MainPatientPageState with _$MainPatientPageState {
  const factory MainPatientPageState({@Default("") String test}) = _MainPatientPageState;
}
