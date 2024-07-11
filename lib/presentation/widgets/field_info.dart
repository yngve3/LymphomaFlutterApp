import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

class FieldInfo extends StatelessWidget {
  const FieldInfo({
    super.key,
    required this.title,
    required this.subtitle
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
