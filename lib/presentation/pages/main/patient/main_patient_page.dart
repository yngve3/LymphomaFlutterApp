import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/domain/models/appointment.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';
import 'package:lymphoma/presentation/widgets/coming_appointment_card.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../consts/dimens.dart';
import '../../../../consts/strings.dart';
import '../../../../di/dependencies.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routing/routes.dart';
import 'cubit/main_patient_page_cubit.dart';
import 'cubit/main_patient_page_state.dart';

class MainPatientPage extends StatelessWidget {
  const MainPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = ColorFilter.mode(context.colors.primary, BlendMode.srcIn);
    return BlocProvider(
      create: (context) => getIt.get<MainPatientPageCubit>(),
      child: BlocBuilder<MainPatientPageCubit, MainPatientPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppAppBar(
                leading: AppIconButton(
                  icon: Assets.icons.icPerson.svg(),
                  onPressed: () => context.go(Routes.patientProfile.path),
                ),
                actions: [
                  AppIconButton(
                    icon: Assets.icons.icArticles.svg(),
                  ),
                  AppIconButton(
                    icon: Assets.icons.icNotifications.svg(),
                  ),
                ],
              ),
              body: ScrollableScreen(
                topPadding: 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(AppStrings.comingRecord, style: context.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    _getComingAppointment(state.comingAppointmentLoadingState, state.comingAppointment),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          children: [
                            PatientPageBlock(
                              title: AppStrings.hystory,
                              subtitle: "${AppStrings.appointments}, ${AppStrings.treatmentCourse}",
                              icon: Assets.icons.icArticles.svg(colorFilter: iconColor),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 12),
                            PatientPageBlock(
                              title: DoctorTypes.oncologist,
                              subtitle: "${AppStrings.conclusions}, ${AppStrings.recommendations}",
                              icon: Assets.icons.icDna.svg(colorFilter: iconColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            PatientPageBlock(
                              title: DoctorTypes.psychiatrist,
                              subtitle: AppStrings.psychologicalTests,
                              icon: Assets.icons.icBrain.svg(colorFilter: iconColor),
                            ),
                            const SizedBox(width: 12),
                            PatientPageBlock(
                              title: DoctorTypes.rehabilitologist,
                              subtitle: "${AppStrings.conclusions}, ${AppStrings.recommendations}",
                              icon: Assets.icons.icBed.svg(colorFilter: iconColor),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              )
          );
        },
      ),
    );
  }

  Widget _getComingAppointment(LoadingState comingAppointmentLoadingState, Appointment comingAppointment) {
    return switch(comingAppointmentLoadingState) {
      LoadingState.ok => ComingAppointmentCard(appointment: comingAppointment),
      LoadingState.loading => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const EmptyListMessage(title: "", subtitle: ""),
      ),
      LoadingState.error => const EmptyListMessage(
        title: "Записей нет",
        subtitle: "Записи назначает доктор"
      )
    };
  }
}

class PatientPageBlock extends StatelessWidget {
  const PatientPageBlock({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onPressed,
    this.onMorePressed
  });

  final String title;
  final String subtitle;
  final Widget icon;
  final VoidCallback? onPressed;
  final VoidCallback? onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(AppDimens.padding),
              child: SizedBox(
                height: 200,
                width: 173,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppIconButton(
                          cardColor: context.colors.tertiary,
                          icon: icon,
                        ),
                        InkWell(
                          onTap: onMorePressed,
                          child: Assets.icons.icThreeDots.svg(),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(title, style: context.textTheme.titleMedium),
                    Text(subtitle),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}

