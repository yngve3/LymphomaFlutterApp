import 'package:flutter/material.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/consts/dimens.dart';
import 'package:lymphoma/ext/context_ext.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.requestFocus = false,
    this.textInputAction,
    this.textInputType,
    this.controller,
    this.errorText,
    this.label,
    this.onChanged
  });

  final String hint;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  final bool requestFocus;
  final String? label;
  final StringCallback? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.isPassword;
    if (widget.requestFocus) _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Transform.translate(
                offset: const Offset(5, 0),
                child: Text(widget.label ?? "", style: context.textTheme.bodyMedium),)
            : const SizedBox.shrink(),
        const SizedBox(height: 8),
        TextField(
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          obscureText: _obscureText,
          controller: widget.controller,
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
              borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius)
            ),
            errorStyle: context.textTheme.bodyMedium?.copyWith(color: context.colors.error),
            labelStyle: context.textTheme.bodySmall,
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: widget.isPassword ? GestureDetector(
                onTap: _toggleShowPassword,
                child: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 20)
              ) : null,
            ),
          ),
        )
      ],
    );
  }

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
