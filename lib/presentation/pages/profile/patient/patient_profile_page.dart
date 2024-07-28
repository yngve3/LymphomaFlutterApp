import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lymphoma/domain/models/loading_state.dart';
import 'package:lymphoma/presentation/pages/profile/patient/cubit/patient_profile_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_bar/back_arrow.dart';
import 'package:lymphoma/presentation/widgets/app_bar/logout_action.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/field_list.dart';
import 'package:lymphoma/presentation/widgets/titled_list.dart';

import '../../../../consts/strings.dart';
import '../../../../di/dependencies.dart';
import '../../../../domain/models/field/field.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../widgets/screen.dart';
import '../../../widgets/shimmer.dart';
import 'cubit/patient_profile_state.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({
    super.key,
    this.patient
  });

  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PatientProfileCubit>(param1: patient),
      child: BlocBuilder<PatientProfileCubit, PatientProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBar(
              title: AppStrings.patientProfile,
              leading: const BackArrow(),
              actions: patient == null ? const [
                LogoutAction()
              ] : null,
            ),
            body: ScrollableScreen(
              child: _getFields(state.fields, state.loadingState),
            ),
          );
        },
      ),
    );
  }

  Widget _getFields(List<Field> fields, LoadingState loadingState) {
    final child = Column(
      children: [
        TitledList(
          title: "Общая информация",
          child: FieldList(
            fields: fields.take(4).toList(),
            onlyRead: true,
          ),
        ),
        const SizedBox(height: 28),
        TitledList(
          title: "О лечении",
          child: FieldList(
            fields: fields.skip(4).toList(),
            onlyRead: true,
          ),
        ),
      ],
    );
    return switch(loadingState) {
      LoadingState.loading => AppShimmer(child: child),
      LoadingState.ok => child,
      LoadingState.error => const EmptyListMessage(title: "Неизвестная ошибка", subtitle: "Проверте подключение к интернету",)
    };
  }
}
