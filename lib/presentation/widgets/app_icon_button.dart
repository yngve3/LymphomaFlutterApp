import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../consts/dimens.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.cardColor,
    this.size = 44
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final Color? cardColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: cardColor ?? context.colors.surface,
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
