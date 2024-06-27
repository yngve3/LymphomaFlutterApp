import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void login() {

  }

  void onEmailChanged(String value) {
    emit(state.copyWith(
        email: value,
        isButtonLogInEnabled: value.isNotEmpty && state.password.isNotEmpty
    ));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(
        password: value,
        isButtonLogInEnabled: value.isNotEmpty && state.email.isNotEmpty
    ));
  }
}
