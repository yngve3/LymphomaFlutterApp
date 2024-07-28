import 'package:injectable/injectable.dart';
import 'package:lymphoma/ext/list_ext.dart';

import '../../consts/strings.dart';
import '../models/field/field.dart';
import '../validators/validator.dart';

@injectable
class FieldChanger {
  List<Field> onFieldChanged(List<Field> fields, Field field, dynamic value) {
    final isValid = field.label == FieldLabels.repeatPassword
        ? value == fields.findByLabel(FieldLabels.password).text
        : ValidatorApplier(ValidatorFactory()).validate(field, value);

    fields[fields.indexOf(field)] = field.copyWith(isError: !isValid, text: value);
    return fields;
  }

  List<Field> generate(List<String> fieldNames) {
    return fieldNames.map((fieldName) {
      return switch(fields[fieldName]?.type) {
        FieldType.date || FieldType.time => DateField(label: fieldName, date: DateTime.now()),
        _ => Field(label: fieldName)
      };
    }).toList();
  }
}