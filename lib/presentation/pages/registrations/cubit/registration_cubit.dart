import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lymphoma/domain/interactors/auth_interactor.dart';
import 'package:lymphoma/domain/utils/field_changer.dart';
import 'package:lymphoma/domain/validators/validator.dart';
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_state.dart';
import 'package:easy_debounce/easy_throttle.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/field/field.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(const RegistrationState());

  final _authInteractor = AuthInteractor();

  void sendRequest() async {
    EasyThrottle.throttle('sentRequest', const Duration(seconds: 1), () async {
      final res = await _authInteractor.register(
        textFields: state.textFields,
        birthdate: state.birthdate!,
      );

      switch(res) {
        case RegistrationStatus.emailAlreadyExist: emit(state.copyWith(registerError: AppStrings.emailAlreadyExist));
        case RegistrationStatus.ok: emit(state.copyWith(registerError: LogicStrings.ok));
        case RegistrationStatus.unknown: emit(state.copyWith(registerError: AppStrings.unknownError));
      }
      emit(state.copyWith(registerError: LogicStrings.init));
    });
  }

  void onFieldChanged(String fieldName, String value) {
    EasyDebounce.debounce("fieldChanged", const Duration(milliseconds: 400), () {
      final fields = FieldChanger.onFieldChanged(Map.of(state.textFields), fieldName, value);
      emit(state.copyWith(
        textFields: fields,
        isContinueButtonEnabled: _checkContinueButtonEnabled(fields),
        isSendRequestButtonEnabled: _checkSendRequestButtonEnabled(fields, state.birthdate),
      ));
    });
  }

  bool _checkContinueButtonEnabled(Map<String, Field> fields) {
    final email = fields[FieldNames.email] ?? Field.empty();
    final password = fields[FieldNames.password] ?? Field.empty();
    final repeatedPassword = fields[FieldNames.repeatedPassword] ?? Field.empty();
    if (email.isEmpty || email.isNotValid) return false;
    if (password.isEmpty || password.isNotValid) return false;
    if (repeatedPassword != password) return false;

    return true;
  }

  void onBirthdateChanged(DateTime? birthdate) {
    emit(state.copyWith(
      birthdate: birthdate,
      isSendRequestButtonEnabled: _checkSendRequestButtonEnabled(state.textFields, birthdate),
    ));
  }

  bool _checkSendRequestButtonEnabled(Map<String, Field> fields, DateTime? birthdate) {
    if (birthdate == null) return false;
    if (fields.length != 6) return false;
    return fields.values.every((field) => field.isNotEmpty && field.isValid);
  }
}
