import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lymphoma/domain/interactors/auth_interactor.dart';
import 'package:lymphoma/domain/utils/field_changer.dart';
import 'package:lymphoma/ext/list_ext.dart';
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_state.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(
      this._authInteractor,
      this._fieldChanger
  ) : super(RegistrationState(
    fields: _fieldChanger.generate([
      FieldLabels.email,
      FieldLabels.password,
      FieldLabels.repeatPassword,
      FieldLabels.fullName,
      FieldLabels.birthdate,
      FieldLabels.phoneNumber,
      FieldLabels.familyPhoneNumber,
    ])
  ));

  late final AuthInteractor _authInteractor;
  late final FieldChanger _fieldChanger;

  void sendRequest() async {
    EasyThrottle.throttle('sentRequest', const Duration(seconds: 1), () async {
      final res = await _authInteractor.register(
        fields: state.fields
      );

      switch(res) {
        case RegistrationStatus.emailAlreadyExist: emit(state.copyWith(registerError: AppStrings.emailAlreadyExist));
        case RegistrationStatus.ok: emit(state.copyWith(registerError: LogicStrings.ok));
        case RegistrationStatus.unknown: emit(state.copyWith(registerError: AppStrings.unknownError));
      }
      emit(state.copyWith(registerError: LogicStrings.init));
    });
  }

  void onFieldChanged(Field field, dynamic value) {
    EasyDebounce.debounce("fieldChanged", const Duration(milliseconds: 400), () {
      final fields = _fieldChanger.onFieldChanged([...state.fields], field, value);
      emit(state.copyWith(
        fields: fields,
        isContinueButtonEnabled: _checkContinueButtonEnabled(fields),
        isSendRequestButtonEnabled: _checkSendRequestButtonEnabled(fields),
      ));
    });
  }

  bool _checkContinueButtonEnabled(List<Field> fields) {
    final email = fields.findByLabel(FieldLabels.email);
    final password = fields.findByLabel(FieldLabels.password);
    final repeatedPassword = fields.findByLabel(FieldLabels.repeatPassword);
    if (email.isEmpty || email.isError) return false;
    if (password.isEmpty || password.isError) return false;
    if (repeatedPassword.text != password.text) return false;

    return true;
  }

  bool _checkSendRequestButtonEnabled(List<Field> fields) {
    return fields.every((field) => field.isNotEmpty && !field.isError);
  }
}
