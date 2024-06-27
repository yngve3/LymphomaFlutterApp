import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(const RegistrationState());

  void sendRequest() {
    return;
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(
      email: value,
      isContinueButtonEnabled: _checkContinueButtonEnabled(value, state.password, state.repeatedPassword),
    ));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(
      password: value,
      isContinueButtonEnabled: _checkContinueButtonEnabled(state.email, value, state.repeatedPassword),
    ));
  }

  void onRepeatedPasswordChanged(String value) {
    emit(state.copyWith(
      repeatedPassword: value,
      isContinueButtonEnabled: _checkContinueButtonEnabled(state.email, state.password, value),
    ));
  }

  bool _checkContinueButtonEnabled(String email, String password, String repeatedPassword) {
    if (email.isNotEmpty && password.isNotEmpty && password == repeatedPassword) return true;
    return false;
  }

  void onFullNameChanged(String value) {
    emit(state.copyWith(
      fullName: value,
      isSendRequestButtonEnabled: _checkSendRequestButtonEnabled([value, state.phoneNumber, state.familyPhoneNumber], state.birthdate)
    ));
  }

  void onBirthdateChanged(DateTime? birthdate) {
    emit(state.copyWith(
        birthdate: birthdate,
        isSendRequestButtonEnabled: _checkSendRequestButtonEnabled([], state.birthdate)
    ));
  }

  void onPhoneNumberChanged(String value) {
    emit(state.copyWith(
        phoneNumber: value,
        isSendRequestButtonEnabled: _checkSendRequestButtonEnabled([value, state.fullName, state.familyPhoneNumber], state.birthdate)
    ));
  }

  void onFamilyPhoneNumberChanged(String value) {
    emit(state.copyWith(
        familyPhoneNumber: value,
        isSendRequestButtonEnabled: _checkSendRequestButtonEnabled([value, state.phoneNumber, state.fullName], state.birthdate)
    ));
  }

  bool _checkSendRequestButtonEnabled(List<String> stringFields, DateTime? birthdate) {
    if (stringFields.every((element) => element.isNotEmpty) && birthdate != null) return true;
    return false;
  }
}
