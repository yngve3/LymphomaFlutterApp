import 'package:lymphoma/domain/validators/validator.dart';

class PasswordValidator implements Validator{
  /// Has minimum 8 characters in length. Adjust it by modifying {8,}
  /// At least one uppercase English letter. You can remove this condition by removing (?=.*?[A-Z])
  /// At least one lowercase English letter.  You can remove this condition by removing (?=.*?[a-z])
  /// At least one digit. You can remove this condition by removing (?=.*?[0-9])
  @override
  bool validate(String value) {
    final reg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return reg.hasMatch(value);
  }
}