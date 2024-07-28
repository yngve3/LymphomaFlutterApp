import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(false) bool isContinueButtonEnabled,
    @Default(false) bool isSendRequestButtonEnabled,
    required List<Field> fields,
    @Default(LogicStrings.init) String registerError
  }) = _RegistrationState;
}
