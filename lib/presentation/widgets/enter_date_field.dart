import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../consts/strings.dart';
import 'field_with_label.dart';

class EnterDateField extends StatelessWidget {
  EnterDateField({
    super.key,
    this.dateTime,
    this.onDateChosen
  });

  final DateTime? dateTime;
  final DateTimeCallback? onDateChosen;
  final DateFormat dateFormat = DateFormat("d.M.y", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    return FieldWithLabel(
      label: AppStrings.birthdate,
      child: InkWell(
        onTap: () async {
          final chosenDateTime = await _showDatePicker(context);
          onDateChosen?.call(chosenDateTime);
        },
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: dateTime == null ? Text(
              AppStrings.enterDate,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onBackground
              ),
            ) : Text(
                dateFormat.format(dateTime!)
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
        initialDate: dateTime
    );
  }
}