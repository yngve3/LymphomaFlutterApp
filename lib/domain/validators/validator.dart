import 'package:lymphoma/domain/validators/email_validator.dart';
import 'package:lymphoma/domain/validators/empty_validator.dart';
import 'package:lymphoma/domain/validators/full_name_validator.dart';
import 'package:lymphoma/domain/validators/password_validator.dart';
import 'package:lymphoma/domain/validators/phone_validator.dart';

import '../models/field/field.dart';

abstract class Validator {
  bool validate(String value);
}

class ValidatorApplier {
  final ValidatorFactory _factory;

  const ValidatorApplier(this._factory);

  bool validate(Field field, dynamic value) {
    final validator = _factory.createValidator(field);
    if (value is String) {
      return validator.validate(value);
    } else {
      return true;
    }
  }
}

class ValidatorFactory {
  Validator createValidator(Field field) =>
      switch(field.type) {
        FieldType.fullName => FullNameValidator(),
        FieldType.email => EmailValidator(),
        FieldType.password => PasswordValidator(),
        FieldType.phone => PhoneValidator(),
        _ => EmptyValidator()
      };
}