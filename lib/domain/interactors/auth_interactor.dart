import 'package:lymphoma/consts/strings.dart';
import 'package:lymphoma/data/repositories/auth_repository.dart';
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

class AuthInteractor {

  final _authRepository = AuthRepository();

  Future<RegistrationStatus> register({
    required Map<String, Field> textFields,
    required DateTime birthdate,
  }) async {
    try {
      await _authRepository.register(
        email: textFields[FieldNames.email]?.text ?? "",
        password: textFields[FieldNames.password]?.text ?? "",
      );
      return RegistrationStatus.ok;
    } on AuthException catch (e) {
      return switch(e.message) {
        "User already registered" => RegistrationStatus.emailAlreadyExist,
        _ => RegistrationStatus.unknown
      };
    }
  }

  Future<LoginStatus> login({
    required Map<String, Field> fields
  }) async {
    try {
      await _authRepository.login(
        email: fields[FieldNames.email]?.text ?? "",
        password: fields[FieldNames.password]?.text ?? ""
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