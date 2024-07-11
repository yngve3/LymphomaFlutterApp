import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart';
import 'package:lymphoma/presentation/widgets/app_bar/app_app_bar.dart';
import 'package:lymphoma/presentation/widgets/app_icon_button.dart';
import 'package:lymphoma/presentation/widgets/empty_list_message.dart';
import 'package:lymphoma/presentation/widgets/patient_card.dart';
import 'package:lymphoma/presentation/widgets/screen.dart';
import 'package:lymphoma/presentation/widgets/tab_bar.dart';
import 'package:lymphoma/presentation/widgets/titled_list.dart';

import '../../../../consts/strings.dart';
import '../../../../di/dependencies.dart';
import '../../../../domain/models/patient/patient.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routing/routes.dart';
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
                    const RecordsPage(),
                    PatientsPage(
                      patients: state.allPatients,
                      favoritePatients: state.favoritePatients,
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

class RecordsPage extends StatelessWidget {
  const RecordsPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const ScrollableScreen(
      topPadding: 20,
      child: Column(
        children: [
          TitledList(
            title: ListTitles.onCurrentWeek,
            list: [

            ]
          ),
          SizedBox(height: 11),
          TitledList(
            title: ListTitles.all,
            list: [

            ]
          ),
        ],
      ),
    );
  }
}

class PatientsPage extends StatelessWidget {
  const PatientsPage({
    super.key,
    required this.patients,
    required this.favoritePatients
  });

  final List<Patient> favoritePatients;
  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    return ScrollableScreen(
      topPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitledList(
            title: ListTitles.favorites,
            list: _getFavoritePatientsList(),
          ),
          const SizedBox(height: 11),
          TitledList(
            title: ListTitles.allList,
            list: _getAllPatientsList(),
          )
        ],
      ),
    );
  }

  List<Widget> _getAllPatientsList() {
    if (patients.isEmpty) {
      return const [EmptyListMessage(
        title: "Список пациентов пуст",
      )];
    }

    return patients.map((patient) => PatientCard(patient: patient)).toList();
  }

  List<Widget> _getFavoritePatientsList() {
    if (favoritePatients.isEmpty) {
      return const [EmptyListMessage(
        title: "Список избранных пуст",
        subtitle: "Вы можете добавить пациента в избранное перейдя на его карточку",
      )];
    }

    return favoritePatients.map((patient) => PatientCard(patient: patient, isFavorite: true,)).toList();
  }
}

