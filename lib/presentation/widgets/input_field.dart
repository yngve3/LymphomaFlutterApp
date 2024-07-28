import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/field_with_label.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../consts/strings.dart';
import '../../domain/models/field/field.dart';
import '../../gen/assets.gen.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.requestFocus = false,
    this.onlyRead = false,
    this.textInputAction,
    this.onChanged,
    required this.field,
  });

  final bool onlyRead;
  final TextInputAction? textInputAction;
  final bool requestFocus;
  final FieldCallback? onChanged;
  final Field field;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;
  late FocusNode _focusNode;
  late TextEditingController _controller;
  MaskTextInputFormatter? _maskFormatter;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = _isPassword();
    _controller = TextEditingController(text: widget.field.text);

    if (widget.requestFocus) _focusNode.requestFocus();
    if (widget.field.type == FieldType.phone) {
      _maskFormatter = MaskTextInputFormatter(
        mask: "+7 (###) ###-##-##",
        filter: {
          "#": RegExp(r"[0-9]")
        },
        type: MaskAutoCompletionType.lazy,
      );
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onlyRead) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.field.label, style: context.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(widget.field.isDateField ? (widget.field as DateField).formattedDate : widget.field.text),
            ],
          ),
        ),
      );
    } else if (widget.field.isDateField) {
      if (widget.field.type == FieldType.date) {
        return InputFieldDate(
          field: widget.field as DateField,
          onDateChosen: (date) => widget.onChanged?.call(widget.field, date),
        );
      } else {
        return InputTimeField(
          field: widget.field as DateField,
          onTimeChosen: (time) => widget.onChanged?.call(widget.field, time),
        );
      }
    } else {
      return FieldWithLabel(
        label: widget.field.label,
        child: TextField(
          maxLines: _isMultiline() ? 5 : 1,
          onChanged: (value) => widget.onChanged?.call(widget.field, value),
          textInputAction: widget.textInputAction,
          keyboardType: _getTextInputType(),
          obscureText: _obscureText,
          controller: _controller,
          focusNode: _focusNode,
          style: context.textTheme.bodyMedium,
          inputFormatters: _maskFormatter != null ? [_maskFormatter!] : null,
          decoration: InputDecoration(
            hintText: widget.field.hintText,
            errorText: widget.field.isError ? widget.field.errorText : null,
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: _isPassword() ? GestureDetector(
                  onTap: _toggleShowPassword,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: _obscureText
                        ? Assets.icons.icShow.svg()
                        : Assets.icons.icHide.svg(),
                  )
              ) : null,
            ),
          ),
        ),
      );
    }
  }

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _isMultiline() {
    return switch(widget.field.label) {
      FieldLabels.diagnosis
      || FieldLabels.hystDiagnosis
      || FieldLabels.treatment => true,
      _ => false
    };
  }

  TextInputType _getTextInputType() {
    return switch(widget.field.type) {
      FieldType.email => TextInputType.emailAddress,
      FieldType.phone => TextInputType.phone,
      _ => TextInputType.text
    };
  }

  bool _isPassword() => widget.field.type == FieldType.password;
}

class InputTimeField extends StatelessWidget {
  InputTimeField({
    super.key,
    this.onTimeChosen,
    required this.field
  });

  final DateField field;
  final DateTimeCallback? onTimeChosen;
  final DateFormat timeFormat = DateFormat("HH:mm", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    return FieldWithLabel(
      label: field.label,
      child: InkWell(
        onTap: () async {
          final chosenDateTime = await _showTimePicker(context);
          onTimeChosen?.call(chosenDateTime);
        },
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(timeFormat.format(field.date)),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showTimePicker(BuildContext context) async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return DateTime.now().copyWith(hour: timeOfDay?.hour, minute: timeOfDay?.minute);
  }
}


class InputFieldDate extends StatelessWidget {
  InputFieldDate({
    super.key,
    this.onDateChosen,
    required this.field,
  });

  final DateField field;
  final DateTimeCallback? onDateChosen;
  final DateFormat dateFormat = DateFormat("d.M.y", 'ru_RU');

  @override
  Widget build(BuildContext context) {
    return FieldWithLabel(
      label: field.label,
      child: InkWell(
        onTap: () async {
          final chosenDateTime = await _showDatePicker(context);
          onDateChosen?.call(chosenDateTime);
        },
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(dateFormat.format(field.date)),
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
        initialDate: field.date
    );
  }
}
