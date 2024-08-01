import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lymphoma/data/repositories/user_repository.dart';
import 'package:lymphoma/domain/interactors/patients_interactor.dart';
import 'package:lymphoma/domain/models/verification_status.dart';
import 'package:lymphoma/presentation/pages/confirm_request/confirm_request_page.dart';
import 'package:lymphoma/presentation/pages/history/history_page.dart';
import 'package:lymphoma/presentation/pages/login/login_page.dart';
import 'package:lymphoma/presentation/pages/login/recovery_page.dart';
import 'package:lymphoma/presentation/pages/main/doctor/main_doctor_page.dart';
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart';
import 'package:lymphoma/presentation/pages/main/patient/main_patient_page.dart';
import 'package:lymphoma/presentation/pages/main/patient/patient_info_page.dart';
import 'package:lymphoma/presentation/pages/new_appointment/cubit/new_appointment_cubit.dart';
import 'package:lymphoma/presentation/pages/new_appointment/new_appointment_page.dart';
import 'package:lymphoma/presentation/pages/notifications/doctor/cubit/notifications_doctor_cubit.dart';
import 'package:lymphoma/presentation/pages/notifications/doctor/notifications_doctor_page.dart';
import 'package:lymphoma/presentation/pages/profile/doctor/cubit/doctor_profile_page_cubit.dart';
import 'package:lymphoma/presentation/pages/profile/doctor/doctor_profile_page.dart';
import 'package:lymphoma/presentation/pages/profile/patient/patient_profile_page.dart';
import 'package:lymphoma/presentation/pages/registrations/registration_page.dart';
import 'package:lymphoma/presentation/pages/registrations/registration_status_page.dart';
import 'package:lymphoma/presentation/pages/start/start_page.dart';
import 'package:lymphoma/presentation/routing/routes.dart';

import '../../consts/strings.dart';
import '../../di/dependencies.dart';
import '../../domain/models/patient/patient.dart';
import '../pages/confirm_request/cubit/confirm_request_cubit.dart';

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
          } else if (!(await patientsInteractor.verificationStatus == VerificationStatus.accepted)) {
            return Routes.registrationStatus.path;
          }

          return null;
        },
        routes: [
          GoRoute(
            path: Routes.patientProfile.lastPathComponent,
            builder: (context, state) => const PatientProfilePage()
          )
        ]
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
              builder: (context, state) => BlocProvider(
                create: (context) => getIt.get<NotificationsDoctorCubit>(),
                child: const NotificationsDoctorPage(),
              ),
              routes: [
                GoRoute(
                    path: Routes.doctorNotificationsRequests.lastPathComponent,
                    builder: (context, state) => BlocProvider.value(
                      value: getIt.get<NotificationsDoctorCubit>(),
                      child: const RequestsFromPatients(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.doctorNotificationsRequest.lastPathComponent,
                        builder: (context, state) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value: getIt.get<NotificationsDoctorCubit>(),
                            ),
                            BlocProvider(
                              create: (context) => getIt.get<ConfirmRequestCubit>(param1: state.extra as Patient),
                            )
                          ],
                          child: const ConfirmRequestPage(),
                        ),
                        routes: [
                          GoRoute(
                              path: Routes.doctorNotificationsRequestStatus.lastPathComponent,
                              builder: (context, state) => BlocProvider.value(
                                value: getIt.get<NotificationsDoctorCubit>(),
                                child: ConfirmStatus(
                                    isOk: state.extra as bool
                                ),
                              )
                          )
                        ],
                      )
                    ]
                )
              ]
          ),
          GoRoute(
            path: Routes.patientInfo.lastPathComponent,
            builder: (context, state) {
              final patientID = state.pathParameters[TableFieldNames.patientID];
              return BlocProvider(
                create: (context) => getIt.get<MainPatientPageCubit>(param1: patientID),
                child: PatientInfoPage(
                  patientID: patientID,
                ),
              );
            },
            routes: [
              GoRoute(
                path: Routes.patientHistory.lastPathComponent,
                builder: (context, state) => HistoryPage(patientID: state.pathParameters[TableFieldNames.patientID])
              ),
              GoRoute(
                path: Routes.newAppointment.lastPathComponent,
                builder: (context, state) {
                  final patientID = state.pathParameters[TableFieldNames.patientID];
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: getIt.get<MainPatientPageCubit>(param1: patientID),
                      ),
                      BlocProvider(
                        create: (context) => getIt.get<NewAppointmentCubit>(param1: patientID),
                      )
                    ],
                    child: NewAppointmentPage(
                      patientID: patientID,
                      isTherapist: state.extra as bool
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.newAppointmentStatus.lastPathComponent,
                    builder: (context, state) => BlocProvider.value(
                      value: getIt.get<MainPatientPageCubit>(param1: state.pathParameters[TableFieldNames.patientID]),
                      child: NewAppointmentStatus(
                        patientID: state.pathParameters[TableFieldNames.patientID],
                        isDispensary: state.extra as bool
                      ),
                    )
                  )
                ]
              ),
              GoRoute(
                  path: Routes.patientProfileByDoctor.lastPathComponent,
                  builder: (context, state) => PatientProfilePage(
                    patientID: state.pathParameters[TableFieldNames.patientID],
                  ),
              ),
            ]
          ),
        ]
      )
    ]
  );
}