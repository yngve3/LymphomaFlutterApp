import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../app_icon_button.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
    this.onPressed
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Assets.icons.icArrowLeft.svg(),
      onPressed: onPressed ?? () => context.pop(),
    );
  }
}
