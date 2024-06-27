import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String repeatedPassword,
    @Default("") String fullName,
    DateTime? birthdate,
    @Default("") String phoneNumber,
    @Default("") String familyPhoneNumber,
    @Default(false) bool isContinueButtonEnabled,
    @Default(false) bool isSendRequestButtonEnabled
  }) = _RegistrationState;
}
