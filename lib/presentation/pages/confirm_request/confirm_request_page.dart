import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/domain/models/loading_state.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/confirm_request/cubit/confirm_request_cubit.dart';
import 'package:lymphoma/presentation/pages/notifications/doctor/cubit/notifications_doctor_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/field_list.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:lymphoma/presentation/widgets/status_page/extra_card.dart';
import 'package:lymphoma/presentation/widgets/status_page/status_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../consts/strings.dart';
import '../../routing/routes.dart';
import '../../widgets/app_bar/app_app_bar.dart';
import '../../widgets/titled_list.dart';
import 'cubit/confirm_request_state.dart';

class ConfirmRequestPage extends StatelessWidget {
  const ConfirmRequestPage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBar(
          title: AppStrings.patientProfile,
          leading: const BackArrow(),
        ),
        body: const ConfirmRequestPageContent()
    );
  }
}

class ConfirmRequestPageContent extends StatelessWidget {
  const ConfirmRequestPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmRequestCubit, ConfirmRequestState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ConfirmRequestCubit>(context);
        return switch(state.loadingState) {
          LoadingState.loading => Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade300,
            child: ScrollableScreen(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitledList(
                    title: "Общая информация",
                    child: FieldList(
                      fields: state.fields.take(4).toList(),
                      onlyRead: true,
                    ),
                  ),
                  const SizedBox(height: 28),
                  TitledList(
                    title: "Общая информация",
                    child: FieldList(
                      fields: state.fields.skip(4).toList(),
                      onlyRead: true,
                      onChanged: cubit.onFieldChanged,
                    ),
                  ),
                ],
              ),
            ),
          ),
          LoadingState.ok => ScrollableScreen(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitledList(
                  title: "Общая информация",
                  child: FieldList(
                    fields: state.fields.take(4).toList(),
                    onlyRead: true,
                  ),
                ),
                const SizedBox(height: 28),
                TitledList(
                  title: "Общая информация",
                  child: FieldList(
                    fields: state.fields.skip(4).toList(),
                    onChanged: cubit.onFieldChanged,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: context.colors.error),
                        onPressed: () {
                          cubit.reject();
                          context.go(Routes.doctorNotificationsRequestStatus.path, extra: false);
                        },
                        child: Text("Отклонить", style: context.textTheme.bodyLarge?.copyWith(color: context.colors.onPrimary)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: context.colors.surfaceVariant),
                        onPressed: state.isButtonAcceptEnabled ? () {
                          cubit.confirm();
                          context.go(Routes.doctorNotificationsRequestStatus.path, extra: true);
                        } : null,
                        child: Text("Принять", style: context.textTheme.bodyLarge?.copyWith(color: context.colors.onPrimary)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          LoadingState.error => const EmptyListMessage(
            title: "Внимание, ошибка!",
            subtitle: "Проверте подключение к интернету",
          )
        };
      },
    );
  }
}

class ConfirmStatus extends StatelessWidget {
  const ConfirmStatus({
    super.key,
    this.isOk = true
  });

  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: StatusPage(
        title: isOk ? "Запрос одобрен" : "Запрос отклонен",
        subtitle: isOk
            ? "Пациент теперь сможет зайти\nв свой аккаунт. Уведомление\nпридет на его почту."
            : "Пациенту на почту придет\nуведомление.",
        isOk: isOk,
        extra: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предлагаем", style: context.textTheme.headlineMedium?.copyWith(color: context.colors.onPrimary)),
            const SizedBox(height: 16),
            ExtraCard(
              title: "Продолжить смотреть список",
              subtitle: "Новые запросы на регистрацию",
              onPressed: () {
                context.read<NotificationsDoctorCubit>().loadPatients();
                context.go(Routes.doctorNotificationsRequests.path);
              },
            ),
          ],
        ),
        bottom: ElevatedButton(
          child: const Text("Все понятно"),
          onPressed: () => context.go(Routes.doctorNotifications.path),
        ),
      ),
    );
  }
}


