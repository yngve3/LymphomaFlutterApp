import 'package:lymphoma/domain/validators/email_validator.dart';
import 'package:lymphoma/domain/validators/empty_validator.dart';
import 'package:lymphoma/domain/validators/full_name_validator.dart';
import 'package:lymphoma/domain/validators/password_validator.dart';
import 'package:lymphoma/domain/validators/phone_validator.dart';

import '../../consts/strings.dart';

abstract class Validator {
  bool validate(String value);
}

class ValidatorApplier {
  final ValidatorFactory _factory;

  const ValidatorApplier(this._factory);

  bool validate(String fieldName, String value) {
    final validator = _factory.createValidator(fieldName);
    return validator.validate(value);
  }
}

class ValidatorFactory {
  Validator createValidator(String fieldName) =>
      switch(fieldName) {
        FieldNames.fullName => FullNameValidator(),
        FieldNames.email => EmailValidator(),
        FieldNames.password || FieldNames.repeatedPassword => PasswordValidator(),
        FieldNames.phoneNumber || FieldNames.familyPhoneNumber => PhoneValidator(),
        _ => EmptyValidator()
      };
}