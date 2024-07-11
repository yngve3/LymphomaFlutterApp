import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';

import '../../consts/dimens.dart';
import '../../gen/assets.gen.dart';
import '../routing/routes.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        side: BorderSide(color: context.colors.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Сегодня, 18:03", style: context.textTheme.bodySmall),
                const SizedBox(height: 4),
                Text("От Старк Т. Г.", style: context.textTheme.titleLarge)
              ],
            ),
            AppIconButton(
              icon: Assets.icons.icArrowRight.svg(colorFilter: ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn)),
              onPressed: () => context.go(Routes.doctorNotificationsRequest.path),
              cardColor: context.colors.primary,
            )
          ],
        ),
      ),
    );
  }
}
