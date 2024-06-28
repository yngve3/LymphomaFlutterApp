import 'package:lymphoma/domain/validators/validator.dart';

class EmailValidator implements Validator {
  ///https://emailregex.com/
  @override
  bool validate(String value) {
    final exp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.(com|ru|by)+");
    return exp.hasMatch(value);
  }
}