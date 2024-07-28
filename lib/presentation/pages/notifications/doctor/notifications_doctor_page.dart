import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/presentation/pages/notifications/doctor/cubit/notifications_doctor_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/request_card.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';
import 'package:lymphoma/presentation/widgets/titled_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../consts/strings.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routing/routes.dart';
import 'cubit/notifications_doctor_state.dart';

class NotificationsDoctorPage extends StatelessWidget {
  const NotificationsDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsDoctorCubit, NotificationsDoctorState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppAppBar(
              title: AppStrings.notifications,
              leading: const BackArrow(),
              actions: [
                AppIconButton(
                  icon: Assets.icons.icAddUser.svg(),
                  onPressed: () => context.go(Routes.doctorNotificationsRequests.path),
                )
              ],
            ),
            body: const Padding(
              padding: EdgeInsets.only(top: 24),
              child: AppTabBarView(
                tabNames: [
                  TabNames.patients,
                  TabNames.doctors,
                ],
                tabScreens: [
                  ScrollableScreen(
                      topPadding: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TitledList(
                            title: "Запросы на перенос",
                            list: [
                              EmptyListMessage(title: "Пока пусто", subtitle: "Контент в разработке",)
                            ],
                          ),
                          TitledList(
                            title: "Новости",
                            list: [
                              EmptyListMessage(title: "Пока пусто", subtitle: "Контент в разработке",)
                            ],
                          )
                        ],
                      )
                  ),
                  ScrollableScreen(
                    topPadding: 20,
                    child: Column(
                      children: [
                        TitledList(
                          title: "Запросы от психиатра",
                          list: [
                            EmptyListMessage(title: "Пока пусто", subtitle: "Контент в разработке",)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}

class RequestsFromPatients extends StatelessWidget {
  const RequestsFromPatients({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsDoctorCubit, NotificationsDoctorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppAppBar(
            title: AppStrings.newPatients,
            leading: const BackArrow(),
          ),
          body: ScrollableScreen(
            topPadding: 31,
            child: TitledList(
              title: "Запросы на регистрацию",
              list: _getWaitingPatients(state.patients, state.loadingState),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getWaitingPatients(List<Patient> patients, LoadingState loadingState) {
    return switch(loadingState) {
      LoadingState.ok => patients.map((patient) => RequestCard(
        patient: patient,
      )).toList(),
      LoadingState.loading => [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              RequestCard(patient: Patient.empty()),
              const SizedBox(height: 12),
              RequestCard(patient: Patient.empty()),
              const SizedBox(height: 12),
              RequestCard(patient: Patient.empty()),
              const SizedBox(height: 12),
              RequestCard(patient: Patient.empty()),
            ],
          )
        )
      ],
      LoadingState.error => const [
        EmptyListMessage(
          title: "Актуальных запросов нет",
          subtitle: "Запросы появятся после регистрации новых пациентов",
        )
      ]
    };
  }
}

