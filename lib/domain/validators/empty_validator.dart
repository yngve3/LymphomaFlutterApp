import 'package:lymphoma/domain/validators/validator.dart';

class EmptyValidator implements Validator {
  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }
}