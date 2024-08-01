import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/domain/utils/date_formatter.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:lymphoma/ext/date_time_ext.dart';
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/patient_card.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';
import 'package:lymphoma/presentation/widgets/titled_list.dart';

import '../../../../consts/dimens.dart';
import '../../../../consts/strings.dart';
import '../../../../di/dependencies.dart';
import '../../../../domain/models/appointment.dart';
import '../../../../domain/models/loading_state.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routing/routes.dart';
import '../../../widgets/coming_appointment_card.dart';
import '../../../widgets/shimmer.dart';
import 'cubit/main_doctor_page_state.dart';

class MainDoctorPage extends StatelessWidget {
  const MainDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MainDoctorPageCubit>(),
      child: BlocBuilder<MainDoctorPageCubit, MainDoctorPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppAppBar(
                leading: AppIconButton(
                  icon: Assets.icons.icPerson.svg(),
                  onPressed: () {
                    context.go(Routes.doctorProfile.path);
                  },
                ),
                actions: [
                  AppIconButton(
                    icon: Assets.icons.icArticles.svg(),
                  ),
                  AppIconButton(
                    icon: Assets.icons.icNotifications.svg(),
                    onPressed: () => context.go(Routes.doctorNotifications.path),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AppTabBarView(
                  tabNames: const [
                    TabNames.records,
                    TabNames.patients
                  ],
                  tabScreens: [
                    AppointmentsPage(
                      appointments: state.appointments,
                      appointmentsLoadingState: state.appointmentsLoadingState,
                    ),
                    PatientsPage(
                      patients: state.allPatients,
                      favoritePatients: state.favoritePatients,
                      patientsLoadingState: state.patientsLoadingState,
                    )
                  ],
                ),
              )
          );
        },
      )
    );
  }
}

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({
    super.key,
    required this.appointments,
    required this.appointmentsLoadingState
  });

  final List<Appointment> appointments;
  final LoadingState appointmentsLoadingState;

  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        children: [
          TitledList(
            title: ListTitles.onCurrentWeek,
            child: _getList(appointments.where((appointment) => appointment.dateTime.isThisWeek), appointmentsLoadingState),
          ),
          const SizedBox(height: 11),
          TitledList(
            title: ListTitles.all,
            child: _getList(appointments, appointmentsLoadingState),
          ),
        ],
      ),
    );
  }

  Widget _getList(Iterable<Appointment> appointments, LoadingState loadingState) {
    return switch(loadingState) {
      LoadingState.loading => AppShimmer(
        child: Column(
          children: [
            DoctorAppointmentCard(appointment: Appointment.empty()),
            const SizedBox(height: 12),
            DoctorAppointmentCard(appointment: Appointment.empty()),
          ],
        ),
      ),
      LoadingState.ok => appointments.isEmpty
          ? const EmptyListMessage(title: "Список пуст", subtitle: "Чтобы добавить запись перейдите на вкладку пациента")
          : Column(
              children: appointments.map((appointment) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DoctorAppointmentCard(
                  appointment: appointment,
                  isFavorite: appointment.doctor.id == appointment.patient.doctor.id,
                ),
              )).toList(),
      ),
      LoadingState.error => const EmptyListMessage(title: "Внимание, ошибка!", subtitle: "Проверте интернет соединение")
    };
  }
}

class DoctorAppointmentCard extends StatelessWidget {
  const DoctorAppointmentCard({super.key, required this.appointment, this.isFavorite = false});

  final Appointment appointment;
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
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appointment.patient.fullName),
                  const SizedBox(height: 8),
                  Text("${DateFormatter.getDateInWordAndTime(appointment.dateTime)}", style: context.textTheme.titleMedium),
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


class PatientsPage extends StatelessWidget {
  const PatientsPage({
    super.key,
    required this.patients,
    required this.favoritePatients,
    required this.patientsLoadingState,
  });

  final List<Patient> favoritePatients;
  final List<Patient> patients;
  final LoadingState patientsLoadingState;

  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitledList(
            title: ListTitles.favorites,
            child: _getList(
              patients: favoritePatients,
              loadingState: patientsLoadingState,
              errorMessage: "Чтобы добавить пациента в список избранных, нужно подтвердить регистрацию в соответствующем окне",
              isFavorite: true,
            ),
          ),
          const SizedBox(height: 11),
          TitledList(
            title: ListTitles.allList,
            child: _getList(
              patients: patients,
              loadingState: patientsLoadingState,
              errorMessage: "Зарегистрированные пациенты отстутствуют",
            ),
          )
        ],
      ),
    );
  }

  Widget _getList({
    required Iterable<Patient> patients,
    required LoadingState loadingState,
    required String errorMessage,
    bool isFavorite = false,
  }) {
    return switch(loadingState) {
      LoadingState.loading => AppShimmer(
        child: Column(
          children: [
            PatientCard(patient: Patient.empty()),
            const SizedBox(height: 12),
            PatientCard(patient: Patient.empty()),
          ],
        ),
      ),
      LoadingState.ok => patients.isEmpty
          ? EmptyListMessage(title: "Список пуст", subtitle: errorMessage)
          : Column(
        children: patients.map((appointment) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PatientCard(
            patient: appointment,
            isFavorite: isFavorite,
          ),
        )).toList(),
      ),
      LoadingState.error => const EmptyListMessage(title: "Внимание, ошибка!", subtitle: "Проверте интернет соединение")
    };
  }
}

