import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';

import '../../../../consts/dimens.dart';
import '../../../../consts/strings.dart';
import '../../../../domain/models/appointment.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../../domain/utils/full_name_formatter.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../../widgets/app_bar/app_app_bar.dart';
import '../../../widgets/app_icon_button.dart';
import '../../../widgets/coming_appointment_card.dart';
import '../../../widgets/empty_list_message.dart';
import '../../../widgets/screen.dart';
import '../../../widgets/shimmer.dart';
import 'cubit/main_patient_page_cubit.dart';
import 'cubit/main_patient_page_state.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({
    super.key,
    required this.patient
  });

  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    final iconColor = ColorFilter.mode(context.colors.primary, BlendMode.srcIn);
    final actions = [
      PatientInfoAction(
        icon: AppIconButton(
          icon: Assets.icons.icPerson.svg(colorFilter: iconColor),
          cardColor: context.colors.tertiary,
        ),
        title: "Карта пациента",
        onPressed: () => context.push(Routes.patientProfileByDoctor.path, extra: patient),
      ),
      PatientInfoAction(
        icon: AppIconButton(
          icon: Assets.icons.icArticles.svg(colorFilter: iconColor),
          cardColor: context.colors.tertiary,
        ),
        title: "История",
        onPressed: () => context.go(Routes.patientHistory.path, extra: patient),
      ),
      PatientInfoAction(
        icon: AppIconButton(
          icon: Assets.icons.icOncologist.svg(colorFilter: iconColor),
          cardColor: context.colors.tertiary,
        ),
        title: "Онколог",
        onPressed: () {},
      ),
      PatientInfoAction(
        icon: AppIconButton(
          icon: Assets.icons.icBrain.svg(colorFilter: iconColor),
          cardColor: context.colors.tertiary,
        ),
        title: "Психиатр",
        onPressed: () {},
      ),
      PatientInfoAction(
        icon: AppIconButton(
          icon: Assets.icons.icBed.svg(colorFilter: iconColor),
          cardColor: context.colors.tertiary,
        ),
        title: "Реабилитолог",
        onPressed: () {},
      ),
    ];
    return BlocBuilder<MainPatientPageCubit, MainPatientPageState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppAppBar(
              leading: const BackArrow(),
              title: FullNameFormatter.toAbbr(patient?.fullName ?? ""),
            ),
            body: ScrollableScreen(
                topPadding: 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(AppStrings.comingRecord, style: context.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    _getComingAppointment(state.comingAppointmentLoadingState, state.comingAppointment),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: context.colors.tertiary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppDimens.buttonsBorderRadius),
                              side: BorderSide(color: context.colors.primary)
                          )
                      ),
                      onPressed: () => context.go(Routes.newAppointment.path, extra: patient),
                      child: Text(
                          "Новая запись"
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text("Данные о пациенте", style: context.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    Column(
                      children: actions.map((action) => Padding(padding: const EdgeInsets.only(bottom: 12), child: action)).toList(),
                    )
                  ],
                )
            )
        );
      },
    );
  }

  Widget _getComingAppointment(LoadingState comingAppointmentLoadingState, Appointment comingAppointment) {
    return switch(comingAppointmentLoadingState) {
      LoadingState.ok => ComingAppointmentCard(appointment: comingAppointment),
      LoadingState.loading => const AppShimmer(
        child: EmptyListMessage(title: "", subtitle: ""),
      ),
      LoadingState.error => const EmptyListMessage(
        title: "Записей нет",
        subtitle: "Чтобы назначить запись нажмите кнопку ниже",
      )
    };
  }
}

class PatientInfoAction extends StatelessWidget {
  const PatientInfoAction({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onMorePressed,
    this.onPressed
  });

  final Widget icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onMorePressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.padding),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title, style: context.textTheme.titleMedium)
                  ],
                ),
              ),
              InkWell(
                onTap: onMorePressed,
                child: Assets.icons.icThreeDots.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

