// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lymphoma/data/repositories/appointments_repository.dart' as _i3;
import 'package:lymphoma/data/repositories/auth_repository.dart' as _i4;
import 'package:lymphoma/data/repositories/doctors_repository.dart' as _i5;
import 'package:lymphoma/data/repositories/patients_repository.dart' as _i6;
import 'package:lymphoma/data/repositories/user_repository.dart' as _i7;
import 'package:lymphoma/domain/interactors/appointments_interactor.dart'
    as _i13;
import 'package:lymphoma/domain/interactors/auth_interactor.dart' as _i16;
import 'package:lymphoma/domain/interactors/doctors_interactor.dart' as _i15;
import 'package:lymphoma/domain/interactors/patients_interactor.dart' as _i9;
import 'package:lymphoma/domain/models/patient/patient.dart' as _i11;
import 'package:lymphoma/domain/utils/field_changer.dart' as _i8;
import 'package:lymphoma/presentation/pages/confirm_request/cubit/confirm_request_cubit.dart'
    as _i10;
import 'package:lymphoma/presentation/pages/history/cubit/history_cubit.dart'
    as _i17;
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart'
    as _i18;
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart'
    as _i21;
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart'
    as _i12;
import 'package:lymphoma/presentation/pages/new_appointment/cubit/new_appointment_cubit.dart'
    as _i20;
import 'package:lymphoma/presentation/pages/notifications/doctor/cubit/notifications_doctor_cubit.dart'
    as _i22;
import 'package:lymphoma/presentation/pages/profile/doctor/cubit/doctor_profile_page_cubit.dart'
    as _i23;
import 'package:lymphoma/presentation/pages/profile/patient/cubit/patient_profile_cubit.dart'
    as _i14;
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart'
    as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppointmentsRepository>(() => _i3.AppointmentsRepository());
    gh.factory<_i4.AuthRepository>(() => _i4.AuthRepository());
    gh.factory<_i5.DoctorsRepository>(() => _i5.DoctorsRepository());
    gh.factory<_i6.PatientsRepository>(() => _i6.PatientsRepository());
    gh.factory<_i7.UserRepository>(() => _i7.UserRepository());
    gh.factory<_i8.FieldChanger>(() => _i8.FieldChanger());
    gh.factory<_i9.PatientsInteractor>(() => _i9.PatientsInteractor(
          gh<_i6.PatientsRepository>(),
          gh<_i7.UserRepository>(),
          gh<_i3.AppointmentsRepository>(),
          gh<_i5.DoctorsRepository>(),
        ));
    gh.factoryParam<_i10.ConfirmRequestCubit, _i11.Patient, dynamic>((
      patient,
      _,
    ) =>
        _i10.ConfirmRequestCubit(
          gh<_i8.FieldChanger>(),
          gh<_i9.PatientsInteractor>(),
          patient,
        )..loadPatient());
    gh.factoryParam<_i12.MainPatientPageCubit, String?, dynamic>((
      patientID,
      _,
    ) =>
        _i12.MainPatientPageCubit(
          gh<_i9.PatientsInteractor>(),
          patientID,
        )..loadInfo());
    gh.factory<_i13.AppointmentsInteractor>(() => _i13.AppointmentsInteractor(
          gh<_i3.AppointmentsRepository>(),
          gh<_i7.UserRepository>(),
        ));
    gh.factoryParam<_i14.PatientProfileCubit, String?, dynamic>((
      transmittedPatientID,
      _,
    ) =>
        _i14.PatientProfileCubit(
          gh<_i9.PatientsInteractor>(),
          gh<_i8.FieldChanger>(),
          transmittedPatientID,
        )..loadPatient());
    gh.factory<_i15.DoctorsInteractor>(() => _i15.DoctorsInteractor(
          gh<_i5.DoctorsRepository>(),
          gh<_i7.UserRepository>(),
          gh<_i6.PatientsRepository>(),
          gh<_i3.AppointmentsRepository>(),
        ));
    gh.factory<_i16.AuthInteractor>(() => _i16.AuthInteractor(
          gh<_i4.AuthRepository>(),
          gh<_i6.PatientsRepository>(),
        ));
    gh.factoryParam<_i17.HistoryCubit, String?, dynamic>((
      patientID,
      _,
    ) =>
        _i17.HistoryCubit(
          gh<_i13.AppointmentsInteractor>(),
          patientID,
        )..loadAppointments());
    gh.factory<_i18.LoginCubit>(() => _i18.LoginCubit(
          gh<_i16.AuthInteractor>(),
          gh<_i8.FieldChanger>(),
        ));
    gh.factory<_i19.RegistrationCubit>(() => _i19.RegistrationCubit(
          gh<_i16.AuthInteractor>(),
          gh<_i8.FieldChanger>(),
        ));
    gh.factoryParam<_i20.NewAppointmentCubit, String?, dynamic>((
      patientID,
      _,
    ) =>
        _i20.NewAppointmentCubit(
          patientID,
          gh<_i8.FieldChanger>(),
          gh<_i13.AppointmentsInteractor>(),
        )..init());
    gh.factory<_i21.MainDoctorPageCubit>(() =>
        _i21.MainDoctorPageCubit(gh<_i15.DoctorsInteractor>())..loadState());
    gh.factory<_i22.NotificationsDoctorCubit>(() =>
        _i22.NotificationsDoctorCubit(gh<_i15.DoctorsInteractor>())
          ..loadPatients());
    gh.factory<_i23.DoctorProfilePageCubit>(() =>
        _i23.DoctorProfilePageCubit(gh<_i15.DoctorsInteractor>())
          ..loadDoctorInfo());
    return this;
  }
}
