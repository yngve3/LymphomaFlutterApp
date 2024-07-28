import 'package:injectable/injectable.dart';
import 'package:lymphoma/consts/strings.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
import 'package:lymphoma/data/repositories/patients_repository.dart';
import 'package:lymphoma/ext/list_ext.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/field/field.dart';

enum RegistrationStatus {
  ok,
  emailAlreadyExist,
  unknown
}

enum LoginStatus {
  ok,
  notOk,
  emailNotConfirmed,
  unknown
}

@injectable
class AuthInteractor {

  AuthInteractor(this._authRepository, this._patientRepository);

  late final AuthRepository _authRepository;
  late final PatientsRepository _patientRepository;

  Future<RegistrationStatus> register({
    required List<Field> fields
  }) async {
    try {
      final user = await _authRepository.register(
        email: fields.findByLabel(FieldLabels.email).text,
        password: fields.findByLabel(FieldLabels.password).text,
        userData: {
          TableFieldNames.fullName: fields.findByLabel(FieldLabels.fullName).text,
          TableFieldNames.role: UserRoles.patient
        }
      );

      _patientRepository.upsert(id: user?.id ?? "", fields: fields);

      return RegistrationStatus.ok;
    } on AuthException catch (e) {
      return switch(e.message) {
        "User already registered" => RegistrationStatus.emailAlreadyExist,
        _ => RegistrationStatus.unknown
      };
    }
  }

  Future<LoginStatus> login({
    required List<Field> textFields
  }) async {
    try {
      await _authRepository.login(
        email: textFields.findByLabel(FieldLabels.email).text,
        password: textFields.findByLabel(FieldLabels.password).text,
      );
      return LoginStatus.ok;
    } on AuthException catch (e) {
      return switch(e.message) {
        "Invalid login credentials" => LoginStatus.notOk,
        _ => LoginStatus.unknown
      };
    }
  }
}