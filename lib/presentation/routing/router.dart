import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/presentation/pages/confirm_request/confirm_request_page.dart';
import 'package:lymphoma/presentation/pages/login/login_page.dart';
import 'package:lymphoma/presentation/pages/login/recovery_page.dart';
import 'package:lymphoma/presentation/pages/main/doctor/main_doctor_page.dart';
import 'package:lymphoma/presentation/pages/main/patient/main_patient_page.dart';
import 'package:lymphoma/presentation/pages/notifications/doctor/notifications_doctor_page.dart';
import 'package:lymphoma/presentation/pages/profile/doctor/cubit/doctor_profile_page_cubit.dart';
import 'package:lymphoma/presentation/pages/profile/doctor/doctor_profile_page.dart';
import 'package:lymphoma/presentation/pages/registrations/registration_page.dart';
import 'package:lymphoma/presentation/pages/registrations/registration_status_page.dart';
import 'package:lymphoma/presentation/pages/start/start_page.dart';
import 'package:lymphoma/presentation/routing/routes.dart';

import '../../consts/strings.dart';
import '../../di/dependencies.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.patientMain.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.start.path,
        builder: (context, state) => const StartPage(),
        routes: [
          GoRoute(
            path: Routes.login.lastPathComponent,
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: Routes.recovery.lastPathComponent,
                builder: (context, state) => const RecoveryPage()
              )
            ]
          ),
          GoRoute(
            path: Routes.registration.lastPathComponent,
            builder: (context, state) => const RegistrationPage(),
          )
        ]
      ),
      GoRoute(
        path: Routes.registrationStatus.path,
        builder: (context, state) => const RegistrationStatusPage(),
      ),
      GoRoute(
        path: Routes.patientMain.path,
        builder: (context, state) => const MainPatientPage(),
        redirect: (context, state) async {
          final userRepository = getIt.get<UserRepository>();
          final patientsInteractor = getIt.get<PatientsInteractor>();

          if (!userRepository.isLoginIn) {
            return Routes.start.path;
          } else if (userRepository.role == UserRoles.doctor) {
            return Routes.doctorMain.path;
          } else if (!await patientsInteractor.currentPatientIsVerified) {
            return Routes.registrationStatus.path;
          }

          return null;
        }
      ),
      GoRoute(
        path: Routes.doctorMain.path,
        builder: (context, state) => const MainDoctorPage(),
        routes: [
          GoRoute(
            path: Routes.doctorProfile.lastPathComponent,
            builder: (context, state) => BlocProvider(
              create: (context) => getIt.get<DoctorProfilePageCubit>(),
              child: const DoctorProfilePage(),
            )
          ),
          GoRoute(
            path: Routes.doctorNotifications.lastPathComponent,
            builder: (context, state) => const NotificationsDoctorPage(),
            routes: [
              GoRoute(
                path: Routes.doctorNotificationsRequests.lastPathComponent,
                builder: (context, state) => const RequestsFromPatients(),
                routes: [
                  GoRoute(
                      path: Routes.doctorNotificationsRequest.lastPathComponent,
                      builder: (context, state) => const ConfirmRequestPage(),
                  )
                ]
              )
            ]
          )
        ]
      )
    ]
  );
}