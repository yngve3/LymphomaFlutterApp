import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/consts/callbacks.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart';
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart';
import 'package:lymphoma/presentation/pages/new_appointment/cubit/new_appointment_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/field_list.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';

import '../../../consts/dimens.dart';
import '../../../consts/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../routing/routes.dart';
import '../../widgets/app_bar/back_arrow.dart';
import '../../widgets/screen.dart';
import '../../widgets/status_page/status_page.dart';
import 'cubit/new_appointment_state.dart';

class NewAppointmentPage extends StatelessWidget {
  const NewAppointmentPage({
    super.key,
    required this.patientID,
    this.isTherapist = false,
  });

  final String? patientID;
  final bool isTherapist;

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
                initialIndex: isTherapist ? 0 : 1,
                tabNames: const [
                  "Диспансер",
                  "Прием"
                ],
                tabScreens: [
                  isTherapist
                      ? ScrollableScreen(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: state.dispAppointmentStates.indexed.map((indexAndElement) {
                            final dispStateIndex = indexAndElement.$1;
                            final dispState = indexAndElement.$2;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${dispStateIndex + 1}/${state.dispAppointmentStates.length} Запись", style: context.textTheme.headlineSmall),
                                    dispStateIndex >= 1 ? TextButton(
                                      onPressed: () => cubit.deleteDispAppointmentInput(dispStateIndex),
                                      child: Text(
                                        "Удалить",
                                        style: context.textTheme.bodyMedium?.copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationColor: context.colors.primary,
                                          color: context.colors.primary,
                                        ),
                                      ),
                                    ) : const SizedBox.shrink()
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text("Направление врача"),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 51,
                                  child: ListView.separated(
                                    itemCount: DoctorType.values.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                                    itemBuilder: (context, index) => DoctorTypeWidget(
                                      type: DoctorType.values[index],
                                      isSelected: DoctorType.values[index] == dispState.type,
                                      typeSelected: (type) => cubit.changeDoctorType(type, dispStateIndex),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                FieldList(
                                  fields: dispState.dispAppointmentsFields,
                                  onChanged: (field, value) => cubit.onDispFieldChanged(field, value, dispStateIndex),
                                ),
                                const SizedBox(height: 32),
                              ],
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AppIconButton(
                            icon: Assets.icons.icAdd.svg(colorFilter: ColorFilter.mode(context.colors.onPrimary, BlendMode.srcIn)),
                            cardColor: context.colors.primary,
                            onPressed: cubit.addDispAppointmentInput,
                          ),
                        ),
                        Expanded(
                          child: Container(height: 40),
                        ),
                        FilledButton(
                          onPressed: state.isDispAppointmentsSaveButtonEnabled ? () {
                            cubit.saveDispAppointment();
                            BlocProvider.of<MainPatientPageCubit>(context).loadInfo();
                            context.go(Routes.newAppointmentStatus.path({TableFieldNames.patientID: patientID}), extra: true);
                          } : null,
                          child: const Text("Сохранить"),
                        ),
                      ],
                    ),
                  )
                      : const ScrollableScreen(
                          child: Column(
                            children: [
                              EmptyListMessage(
                                title: "Внимание!",
                                subtitle: "Составлять диспансерное расписание может только лечащий врач",
                              )
                            ],
                          ),
                  ),
                  ScrollableScreen(
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
                            context.go(Routes.newAppointmentStatus.path({TableFieldNames.patientID: patientID}), extra: false);
                          },
                          child: const Text("Сохранить"),
                        ),
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
    required this.patientID,
    this.isDispensary = false
  });

  final String? patientID;
  final bool isDispensary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: StatusPage(
        title: "${isDispensary ? "Диспансерная з" : "З"}апись успешно\nсоздана",
        subtitle: "${isDispensary ? "Ближайшая д" : "Д"}ата появится у пациента\nна главном экране, а так же\nпридет уведомление.",
        bottom: ElevatedButton(
          child: const Text("Все понятно"),
          onPressed: () {
            context.go(Routes.patientInfo.path({TableFieldNames.patientID: patientID}));
          },
        ),
      ),
    );
  }
}

class DoctorTypeWidget extends StatelessWidget {
  const DoctorTypeWidget({
    super.key,
    required this.type,
    required this.isSelected,
    required this.typeSelected
  });

  final DoctorType type;
  final bool isSelected;
  final DoctorTypeCallback typeSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: (selected) => typeSelected(type),
      label: Text(
        _getDoctorTypeName(type),
        style: context.textTheme.bodyMedium?.copyWith(
          color: isSelected ? context.colors.primary : context.colors.onSurface,
        ),
      ),
      selected: isSelected,
      showCheckmark: false,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: WidgetStateColor.resolveWith((states) =>
      states.contains(WidgetState.selected)
          ? context.colors.tertiary
          : context.colors.surface
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
      ),
      side: isSelected ? BorderSide(color: context.colors.primary) : BorderSide.none,
    );
  }

  String _getDoctorTypeName(DoctorType type) =>
      switch(type) {
        DoctorType.rehabilitologist => DoctorTypes.rehabilitologist,
        DoctorType.psychiatrist => DoctorTypes.psychiatrist,
        DoctorType.oncologist => DoctorTypes.oncologist
      };
}

