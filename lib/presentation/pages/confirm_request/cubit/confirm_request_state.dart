import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lymphoma/domain/models/loading_state.dart';

import '../../../../domain/models/field/field.dart';

part 'confirm_request_state.freezed.dart';

@freezed
class ConfirmRequestState with _$ConfirmRequestState {
  const factory ConfirmRequestState({
    @Default("") String id,
    @Default("") String fullName,
    @Default("") String phone,
    @Default("") String familyPhone,
    DateTime? birthdate,
    @Default("") therapist,
    @Default({}) Map<String, Field> inputFields,
    @Default(false) bool isButtonAcceptEnabled,
    @Default(LoadingState.ok) LoadingState loadingState
  }) = _ConfirmRequestState;
}
