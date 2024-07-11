import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lymphoma/domain/models/loading_state.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/confirm_request/cubit/confirm_request_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../consts/strings.dart';
import '../../../di/dependencies.dart';
import '../../widgets/app_bar/app_app_bar.dart';
import '../../widgets/field_info.dart';
import '../../widgets/input_field.dart';
import '../../widgets/titled_list.dart';
import 'cubit/confirm_request_state.dart';

class ConfirmRequestPage extends StatelessWidget {
  const ConfirmRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ConfirmRequestCubit>(),
      child: Scaffold(
        appBar: AppAppBar(
          title: "Карта пациента",
          leading: const BackArrow(),
        ),
        body: const ConfirmRequestPageContent()
      )
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
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: const ScrollableScreen(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitledList(
                    title: "Общая информация",
                    list: [
                      FieldInfo(
                        title: "",
                        subtitle: "",
                      ),
                      FieldInfo(
                        title: "",
                        subtitle: "",
                      ),
                      FieldInfo(
                        title: "",
                        subtitle: "",
                      ),
                      FieldInfo(
                        title: "",
                        subtitle: "",
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  TitledList(
                    title: "О лечении",
                    list: [
                      FieldInfo(
                        title: "",
                        subtitle: "",
                      )
                    ],
                  )
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
                  list: [
                    FieldInfo(
                      title: AppStrings.fullName,
                      subtitle: state.fullName,
                    ),
                    FieldInfo(
                      title: AppStrings.birthdate,
                      subtitle: DateFormat("dd.MM.y", "ru_RU").format(state.birthdate ?? DateTime.now()),
                    ),
                    FieldInfo(
                      title: AppStrings.phoneNumber,
                      subtitle: state.phone,
                    ),
                    FieldInfo(
                      title: AppStrings.familyPhoneNumber,
                      subtitle: state.phone,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                TitledList(
                  title: "О лечении",
                  list: [
                    FieldInfo(
                      title: AppStrings.therapist,
                      subtitle: state.therapist,
                    ),
                    InputField(
                      hint: "Введите диагноз пациента",
                      label: AppStrings.diagnosis,
                      isMultiply: true,
                      field: state.inputFields[FieldNames.diagnosis],
                      onChanged: (value) => cubit.onFieldChanged(FieldNames.diagnosis, value),
                    ),
                    InputField(
                      hint: "Введите диагноз пациента",
                      label: AppStrings.hystDiagnosis,
                      isMultiply: true,
                      field: state.inputFields[FieldNames.hystDiagnosis],
                      onChanged: (value) => cubit.onFieldChanged(FieldNames.hystDiagnosis, value),
                    ),
                    InputField(
                      hint: "Введите лечение пациента",
                      label: AppStrings.treatment,
                      isMultiply: true,
                      field: state.inputFields[FieldNames.treatment],
                      onChanged: (value) => cubit.onFieldChanged(FieldNames.treatment, value),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: context.colors.error),
                            onPressed: () {
                              cubit.reject();
                              context.pop();
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
                              context.pop();
                            } : null,
                            child: Text("Принять", style: context.textTheme.bodyLarge?.copyWith(color: context.colors.onPrimary)),
                          ),
                        )
                      ],
                    ),
                  ],
                )
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

