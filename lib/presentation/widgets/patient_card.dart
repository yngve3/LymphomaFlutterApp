import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/domain/utils/year_formatter.dart';
import 'package:lymphoma/ext/context_ext.dart';

import '../../consts/dimens.dart';
import '../../domain/models/patient/patient.dart';
import '../../gen/assets.gen.dart';
import '../routing/routes.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.patient,
    this.isFavorite = false
  });

  final Patient patient;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isFavorite ? context.colors.tertiary : null,
      shape: isFavorite ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        side: BorderSide(color: context.colors.primary)
      ) : null,
      child: InkWell(
        onTap: () => context.go(Routes.patientInfo.path, extra: patient),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(patient.fullName, style: context.textTheme.headlineSmall),
                  const SizedBox(height: 5),
                  Text("${patient.age} ${YearFormatter.getYearWord(patient.age)}, ${patient.diagnosis}", style: context.textTheme.bodySmall),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Assets.icons.icThreeDots.svg(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
