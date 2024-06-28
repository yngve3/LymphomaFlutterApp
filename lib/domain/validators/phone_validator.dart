import 'package:lymphoma/domain/validators/validator.dart';

class PhoneValidator implements Validator {
  @override
  bool validate(String value) {
    return value.length == 18;
  }
}