import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../../consts/dimens.dart';
import '../../../gen/assets.gen.dart';
import '../app_icon_button.dart';

class ExtraCard extends StatelessWidget {
  const ExtraCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed
  });

  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.secondary,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.titleLarge?.copyWith(color: context.colors.onPrimary)),
                const SizedBox(height: 4),
                Text(subtitle, style: context.textTheme.bodySmall?.copyWith(color: context.colors.onPrimary))
              ],
            ),
            AppIconButton(
              icon: Assets.icons.icArrowRight.svg(colorFilter: ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn)),
              onPressed: onPressed,
              cardColor: context.colors.primary,
            )
          ],
        ),
      ),
    );
  }
}
