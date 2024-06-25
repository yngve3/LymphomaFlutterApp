import 'package:flutter/material.dart';
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
  });

  final String hint;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  final bool requestFocus;

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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colors.surface
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        obscureText: _obscureText,
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          errorText: widget.errorText,
          labelText: widget.hint,
          labelStyle: context.textTheme.bodyLarge,
          suffix: widget.isPassword ? InkWell(
            onTap: () => _toggleShowPassword(),
            child: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 20),
          ) : null,
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
