import 'package:lymphoma/domain/validators/validator.dart';

class FullNameValidator implements Validator{
  @override
  bool validate(String value) {
    final reg = RegExp(r'^\S+\s+\S+\s+\S+$');
    return reg.hasMatch(value);
  }
}