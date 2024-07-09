import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../gen/assets.gen.dart';
import 'app_icon_button.dart';

class IconWithCardVariant extends StatelessWidget {
  const IconWithCardVariant({
    super.key,
    this.isOk = true
  });

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    final iconColor = ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn);
    const double iconSize = 23;
    return AppIconButton(
      icon: isOk
          ? Assets.icons.icOk.svg(colorFilter: iconColor, height: iconSize, width: iconSize)
          : Assets.icons.icNotOk.svg(colorFilter: iconColor, height: iconSize, width: iconSize),
      cardColor: isOk ? context.colors.surfaceVariant : context.colors.error,
      size: 56,
    );
  }
}


