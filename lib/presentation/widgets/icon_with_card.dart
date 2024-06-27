import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../gen/assets.gen.dart';

class IconWithCard extends StatelessWidget {
  const IconWithCard({
    super.key,
    required this.icon,
    this.isBigPadding = false,
    this.padding,
    this.cardColor
  });

  final Widget icon;
  final bool isBigPadding;
  final EdgeInsetsGeometry? padding;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox.square(
          dimension: 30,
          child: icon,
        ),
      )
    );
  }
}

class IconWithCardVariant extends StatelessWidget {
  const IconWithCardVariant({
    super.key,
    this.isOk = true
  });

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    final iconColor = ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn);
    return IconWithCard(
      icon: isOk
          ? Assets.icons.icOk.svg(colorFilter: iconColor)
          : Assets.icons.icNotOk.svg(colorFilter: iconColor),
      isBigPadding: true,
      cardColor: isOk ? context.colors.surfaceVariant : context.colors.error
    );
  }
}


