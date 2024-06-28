import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    DateTime? birthdate,
    @Default(false) bool isContinueButtonEnabled,
    @Default(false) bool isSendRequestButtonEnabled,
    @Default({}) Map<String, Field> textFields,
    @Default(LogicStrings.init) String registerError
  }) = _RegistrationState;
}
