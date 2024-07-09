import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../consts/dimens.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({
    super.key,
    required this.title,
    this.subtitle = ""
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.background,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: context.textTheme.headlineSmall),
            const SizedBox(height: 10),
            Text(subtitle, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
