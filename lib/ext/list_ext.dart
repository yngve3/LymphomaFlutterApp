import 'package:collection/collection.dart';

import '../domain/models/field/field.dart';

extension ListOfFields on List<Field> {
  Field findByLabel(String fieldLabel) {
    return firstWhereOrNull((element) => element.label == fieldLabel) ?? Field.empty();
  }
}