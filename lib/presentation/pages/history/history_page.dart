import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lymphoma/presentation/pages/history/cubit/history_cubit.dart';
import 'package:lymphoma/presentation/widgets/coming_appointment_card.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';

import '../../../di/dependencies.dart';
import '../../../domain/models/appointment.dart';
import '../../../domain/models/loading_state.dart';
import '../../../domain/models/patient/patient.dart';
import '../../widgets/app_bar/app_app_bar.dart';
import '../../widgets/app_bar/back_arrow.dart';
import '../../widgets/screen.dart';
import '../../widgets/shimmer.dart';
import '../../widgets/titled_list.dart';
import 'cubit/history_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
    required this.patient
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HistoryCubit>(param1: patient),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBar(
              title: "История",
              leading: const BackArrow(),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 31),
              child: AppTabBarView(
                tabNames: [
                  "Записи",
                  "Ход лечения"
                ],
                tabScreens: [
                  ScrollableScreen(
                    topPadding: 20,
                    child: Column(
                      children: [
                        TitledList(
                          title: "Предстоящие",
                          child: _getList(state.appointments.where((element) => element.dateTime.isAfter(DateTime.timestamp())), state.loadingState),
                        ),
                        TitledList(
                          title: "Завершенные",
                          child: _getList(state.appointments.where((element) => element.dateTime.isBefore(DateTime.timestamp())), state.loadingState),
                        )
                      ],
                    ),
                  ),
                  const EmptyListMessage(
                    title: "Пока пусто",
                    subtitle: "Контент в разработке",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getList(Iterable<Appointment> appointments, LoadingState loadingState) {
    return switch(loadingState) {
      LoadingState.loading => AppShimmer(
        child: Column(
          children: [
            ComingAppointmentCard(appointment: Appointment.empty()),
            const SizedBox(height: 12),
            ComingAppointmentCard(appointment: Appointment.empty()),
          ],
        ),
      ),
      LoadingState.ok => appointments.isEmpty
          ? const EmptyListMessage(title: "Список пуст", subtitle: "Чтобы добавить запись вернитесь на предыдущий экран")
          : Column(children: appointments.map((element) => Padding(padding: EdgeInsets.only(bottom: 12), child: ComingAppointmentCard(appointment: element),)).toList(),
      ),
      LoadingState.error => const EmptyListMessage(title: "Внимание, ошибка!", subtitle: "Проверте интернет соединение")
    };
  }
}
