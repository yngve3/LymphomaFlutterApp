// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lymphoma/data/repositories/auth_repository.dart' as _i3;
import 'package:lymphoma/data/repositories/doctors_repository.dart' as _i4;
import 'package:lymphoma/data/repositories/patients_repository.dart' as _i5;
import 'package:lymphoma/data/repositories/user_repository.dart' as _i6;
import 'package:lymphoma/domain/interactors/auth_interactor.dart' as _i11;
import 'package:lymphoma/domain/interactors/doctors_interactor.dart' as _i9;
import 'package:lymphoma/domain/interactors/patients_interactor.dart' as _i10;
import 'package:lymphoma/domain/utils/field_changer.dart' as _i7;
import 'package:lymphoma/presentation/pages/confirm_request/cubit/confirm_request_cubit.dart'
    as _i14;
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart'
    as _i15;
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart'
    as _i12;
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart'
    as _i13;
import 'package:lymphoma/presentation/pages/notifications/doctor/cubit/notifications_doctor_cubit.dart'
    as _i8;
import 'package:lymphoma/presentation/pages/profile/doctor/cubit/doctor_profile_page_cubit.dart'
    as _i17;
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart'
    as _i16;

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
    gh.factory<_i3.AuthRepository>(() => _i3.AuthRepository());
    gh.factory<_i4.DoctorsRepository>(() => _i4.DoctorsRepository());
    gh.factory<_i5.PatientsRepository>(() => _i5.PatientsRepository());
    gh.factory<_i6.UserRepository>(() => _i6.UserRepository());
    gh.factory<_i7.FieldChanger>(() => _i7.FieldChanger());
    gh.factory<_i8.NotificationsDoctorCubit>(
        () => _i8.NotificationsDoctorCubit());
    gh.factory<_i9.DoctorsInteractor>(() => _i9.DoctorsInteractor(
          gh<_i4.DoctorsRepository>(),
          gh<_i6.UserRepository>(),
        ));
    gh.factory<_i10.PatientsInteractor>(() => _i10.PatientsInteractor(
          gh<_i5.PatientsRepository>(),
          gh<_i6.UserRepository>(),
        ));
    gh.factory<_i11.AuthInteractor>(() => _i11.AuthInteractor(
          gh<_i3.AuthRepository>(),
          gh<_i5.PatientsRepository>(),
        ));
    gh.factory<_i12.MainDoctorPageCubit>(() =>
        _i12.MainDoctorPageCubit(gh<_i10.PatientsInteractor>())
          ..loadPatients());
    gh.factory<_i13.MainPatientPageCubit>(() =>
        _i13.MainPatientPageCubit(gh<_i10.PatientsInteractor>())
          ..loadPatientInfo());
    gh.factory<_i14.ConfirmRequestCubit>(() => _i14.ConfirmRequestCubit(
          gh<_i7.FieldChanger>(),
          gh<_i10.PatientsInteractor>(),
          gh<_i9.DoctorsInteractor>(),
        )..loadPatient());
    gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(
          gh<_i11.AuthInteractor>(),
          gh<_i7.FieldChanger>(),
        ));
    gh.factory<_i16.RegistrationCubit>(() => _i16.RegistrationCubit(
          gh<_i11.AuthInteractor>(),
          gh<_i7.FieldChanger>(),
        ));
    gh.factory<_i17.DoctorProfilePageCubit>(() =>
        _i17.DoctorProfilePageCubit(gh<_i9.DoctorsInteractor>())
          ..loadDoctorInfo());
    return this;
  }
}
