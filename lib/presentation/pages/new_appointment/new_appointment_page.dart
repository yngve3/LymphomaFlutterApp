import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart';
import 'package:lymphoma/presentation/pages/new_appointment/cubit/new_appointment_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/field_list.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';

import '../../../domain/models/patient/patient.dart';
import '../../routing/routes.dart';
import '../../widgets/app_bar/back_arrow.dart';
import '../../widgets/screen.dart';
import '../../widgets/status_page/status_page.dart';
import 'cubit/new_appointment_state.dart';

class NewAppointmentPage extends StatelessWidget {
  const NewAppointmentPage({
    super.key,
    required this.patient
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAppointmentCubit, NewAppointmentState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<NewAppointmentCubit>(context);
        return Scaffold(
          appBar: AppAppBar(
            title: "Новая запись",
            leading: const BackArrow(),
          ),
          body: Padding(
              padding: const EdgeInsets.only(top: 31),
              child: AppTabBarView(
                tabNames: const [
                  "Диспансер",
                  "Прием"
                ],
                tabScreens: [
                  const EmptyListMessage(
                    title: "Пока пусто",
                    subtitle: "Контект в разработке",
                  ),
                  Screen(
                    topPadding: 20,
                    child: Column(
                      children: [
                        FieldList(
                          fields: state.appointmentsFields,
                          onChanged: cubit.onFieldChanged,
                        ),
                        const Spacer(),
                        FilledButton(
                          onPressed: () {
                            cubit.saveAppointment();
                            context.go(Routes.newAppointmentStatus.path, extra: patient);
                          },
                          child: const Text("Сохранить"),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  )
                ],
              )
          ),
        );
      },
    );
  }
}

class NewAppointmentStatus extends StatelessWidget {
  const NewAppointmentStatus({
    super.key,
    required this.patient
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MainPatientPageCubit>(context);
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: StatusPage(
        title: "Запись успешно\nсоздана",
        subtitle: "Дата появится у пациента\nна главном экране, а так же\nпридет уведомление.",
        bottom: ElevatedButton(
          child: const Text("Все понятно"),
          onPressed: () {
            cubit.loadPatientInfo();
            context.go(Routes.patientInfo.path, extra: patient);
          },
        ),
      ),
    );
  }
}

