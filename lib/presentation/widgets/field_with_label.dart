import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

class FieldWithLabel extends StatelessWidget {
  const FieldWithLabel({
    super.key,
    required this.child,
    this.label
  });

  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Transform.translate(
          offset: const Offset(5, 0),
          child: Text(label ?? "", style: context.textTheme.bodyMedium),)
            : const SizedBox.shrink(),
        const SizedBox(height: 8),
        child
      ],
    );
  }
}
