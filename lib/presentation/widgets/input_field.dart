import 'package:flutter/material.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/field_with_label.dart';

import '../../gen/assets.gen.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.requestFocus = false,
    this.textInputAction,
    this.textInputType,
    this.errorText,
    this.label,
    this.onChanged,
    this.text = ""
  });

  final String hint;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final String? errorText;
  final bool requestFocus;
  final String? label;
  final StringCallback? onChanged;
  final String text;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.isPassword;
    if (widget.requestFocus) _focusNode.requestFocus();
    _controller = TextEditingController(text: widget.text);
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
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,

          filled: true,
          fillColor: context.colors.surface,
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
          ),
          hintText: widget.hint,
          hintStyle: context.textTheme.bodyMedium?.copyWith(color: context.colors.onBackground),
          contentPadding: const EdgeInsets.all(20),
          errorText: widget.errorText,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colors.error),
              borderRadius: BorderRadius.circular(AppDimens.inputFieldBorderRadius)
          ),
          errorStyle: context.textTheme.bodyMedium?.copyWith(color: context.colors.error),
          labelStyle: context.textTheme.bodySmall,
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
