import 'package:flutter/material.dart';
import 'package:lymphoma/consts/callbacks.dart';

import '../../consts/strings.dart';
import '../../domain/models/field/field.dart';
import 'input_field.dart';

class FieldList extends StatelessWidget {
  const FieldList({
    super.key,
    required this.fields,
    this.onChanged,
    this.onlyRead = false
  });

  final List<Field> fields;
  final FieldCallback? onChanged;
  final bool onlyRead;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: fields.map((field) => Padding(
          padding: EdgeInsets.only(bottom: onlyRead ? 12 : 16),
          child: InputField(
            field: field,
            onChanged: onChanged,
            onlyRead: _getOnlyRead(field),
            textInputAction: TextInputAction.next,
          ),
      )).toList(),
    );
  }

  bool _getOnlyRead(Field field) {
    return onlyRead
        || field.label == FieldLabels.therapist
        || field.label == FieldLabels.phoneDoctor;
  }
}
