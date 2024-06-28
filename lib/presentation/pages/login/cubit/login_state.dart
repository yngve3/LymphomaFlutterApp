import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isButtonLogInEnabled,
    @Default(false) bool isButtonRecoveryEnabled,
    @Default(LogicStrings.init) String loginError,
    @Default({}) Map<String, Field> textFields,
  }) = _LoginState;
}
