import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/auth_interactor.dart';
import 'package:lymphoma/ext/list_ext.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';
import '../../../../domain/utils/field_changer.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
      this._authInteractor,
      this._fieldChanger
  ) : super(LoginState(textFields: _fieldChanger.generate([FieldLabels.email, FieldLabels.password])));

  late final AuthInteractor _authInteractor;
  late final FieldChanger _fieldChanger;

  void login() async {
    final res = await _authInteractor.login(textFields: state.textFields);

    switch(res) {
      case LoginStatus.ok: emit(state.copyWith(loginError: LogicStrings.ok));
      case LoginStatus.emailNotConfirmed: emit(state.copyWith(loginError: AppStrings.emailNotConfirmed));
      case LoginStatus.notOk: emit(state.copyWith(loginError: AppStrings.invalidLoginOrPassword));
      case LoginStatus.unknown: emit(state.copyWith(loginError: AppStrings.unknownError));
    }
    emit(state.copyWith(loginError: LogicStrings.init));
  }

  void onFieldChanged(Field field, dynamic value) {
    EasyDebounce.debounce("loginFieldChanged", const Duration(milliseconds: 400), () {
      final fields = _fieldChanger.onFieldChanged([...state.textFields], field, value);
      emit(state.copyWith(
        textFields: fields,
        isButtonLogInEnabled: _checkLoginButtonEnabled(fields),
        isButtonRecoveryEnabled: _checkRecoveryButtonEnabled(fields)
      ));
    });
  }

  bool _checkLoginButtonEnabled(List<Field> fields) {
    return fields.every((field) => field.isNotEmpty && !field.isError);
  }

  bool _checkRecoveryButtonEnabled(List<Field> fields) {
    final field = fields.findByLabel(FieldLabels.email);
    return field.isNotEmpty && !field.isError;
  }
}
