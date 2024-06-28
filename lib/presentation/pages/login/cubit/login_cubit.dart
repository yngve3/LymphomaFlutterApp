import 'package:easy_debounce/easy_debounce.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
import 'package:lymphoma/domain/interactors/auth_interactor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';
import '../../../../domain/utils/field_changer.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final _authInteractor = AuthInteractor();

  void login() async {
    final res = await _authInteractor.login(fields: state.textFields);

    switch(res) {
      case LoginStatus.ok: emit(state.copyWith(loginError: LogicStrings.ok));
      case LoginStatus.emailNotConfirmed: emit(state.copyWith(loginError: AppStrings.emailNotConfirmed));
      case LoginStatus.notOk: emit(state.copyWith(loginError: AppStrings.invalidLoginOrPassword));
      case LoginStatus.unknown: emit(state.copyWith(loginError: AppStrings.unknownError));
    }
    emit(state.copyWith(loginError: LogicStrings.init));
  }

  void onFieldChanged(String fieldName, String value) {
    EasyDebounce.debounce("loginFieldChanged", const Duration(milliseconds: 400), () {
      final fields = FieldChanger.onFieldChanged(Map.of(state.textFields), fieldName, value);
      emit(state.copyWith(
        textFields: fields,
        isButtonLogInEnabled: _checkLoginButtonEnabled(fields),
        isButtonRecoveryEnabled: _checkRecoveryButtonEnabled(fields)
      ));
    });
  }

  bool _checkLoginButtonEnabled(Map<String, Field> fields) {
    return fields.values.every((field) => field.isNotEmpty && field.isValid);
  }

  bool _checkRecoveryButtonEnabled(Map<String, Field> fields) {
    final field = fields[FieldNames.email] ?? Field.empty();
    return field.isNotEmpty && field.isValid;
  }
}
