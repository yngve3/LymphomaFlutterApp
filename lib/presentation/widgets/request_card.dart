import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/domain/utils/full_name_formatter.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';

import '../../consts/callbacks.dart';
import '../../consts/dimens.dart';
import '../../domain/models/patient/patient.dart';
import '../../domain/utils/date_formatter.dart';
import '../../gen/assets.gen.dart';
import '../routing/routes.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.patient,
    this.onPressed
  });

  final Patient patient;
  final PatientCallback? onPressed;

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
                Text(DateFormatter.getDateInWordAndTime(patient.createdAt), style: context.textTheme.bodySmall),
                const SizedBox(height: 4),
                Text("От ${FullNameFormatter.toAbbr(patient.fullName)}", style: context.textTheme.titleLarge)
              ],
            ),
            AppIconButton(
              icon: Assets.icons.icArrowRight.svg(colorFilter: ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn)),
              onPressed: () => context.go(Routes.doctorNotificationsRequest.path, extra: patient),
              cardColor: context.colors.primary,
            )
          ],
        ),
      ),
    );
  }
}
