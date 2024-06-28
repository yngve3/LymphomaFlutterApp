import 'package:flutter/material.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/field_with_label.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../domain/models/field/field.dart';
import '../../gen/assets.gen.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.requestFocus = false,
    this.textInputAction,
    this.textInputType,
    this.label,
    this.onChanged,
    this.field
  });

  final String hint;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool requestFocus;
  final String? label;
  final StringCallback? onChanged;
  final Field? field;

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
    _obscureText = widget.isPassword;
    _controller = TextEditingController(text: widget.field?.text);

    if (widget.requestFocus) _focusNode.requestFocus();
    if (widget.textInputType == TextInputType.phone) {
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
    return FieldWithLabel(
      label: widget.label,
      child: TextField(
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        obscureText: _obscureText,
        controller: _controller,
        focusNode: _focusNode,
        style: context.textTheme.bodyMedium,
        inputFormatters: _maskFormatter != null ? [_maskFormatter!] : null,
        decoration: InputDecoration(
          hintText: widget.hint,
          errorText: widget.field?.error,
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: widget.isPassword ? GestureDetector(
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

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
