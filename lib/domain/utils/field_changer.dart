import 'package:injectable/injectable.dart';

import '../../consts/strings.dart';
import '../models/field/field.dart';
import '../validators/validator.dart';

@injectable
class FieldChanger {
  Map<String, Field> onFieldChanged(Map<String, Field> fields, String fieldName, String value) {
    final res = fieldName == FieldNames.repeatedPassword
        ? value == fields[FieldNames.password]?.text
        : ValidatorApplier(ValidatorFactory()).validate(fieldName, value);

    final error = _getErrorText(fieldName, res);
    _updateOrInsert(fields, value, fieldName, error);
    return fields;
  }

  void _updateOrInsert(Map<String, Field> fields, String value, String fieldName, String? error) {
    if (!fields.containsKey(fieldName)) {
      fields.addAll({fieldName: Field(text: value, error: error)});
    } else {
      fields.update(fieldName, (field) => field.copyWith(error: error, text: value));
    }
  }

  String? _getErrorText(String fieldName, bool validationResult) {
    if (validationResult == true) return null;
    return switch(fieldName) {
      FieldNames.email => AppStrings.emailIncorrect,
      FieldNames.password => AppStrings.passwordIncorrect,
      FieldNames.fullName => AppStrings.fullNameIncorrect,
      FieldNames.phoneNumber => AppStrings.phoneIncorrect,
      FieldNames.familyPhoneNumber => AppStrings.phoneIncorrect,
      FieldNames.repeatedPassword => AppStrings.passwordsNotEqual,
      _ => null
    };
  }
}