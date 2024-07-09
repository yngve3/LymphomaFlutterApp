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
import 'package:lymphoma/data/repositories/patients_repository.dart' as _i4;
import 'package:lymphoma/data/repositories/user_repository.dart' as _i5;
import 'package:lymphoma/domain/interactors/auth_interactor.dart' as _i8;
import 'package:lymphoma/domain/interactors/patients_interactor.dart' as _i7;
import 'package:lymphoma/domain/utils/field_changer.dart' as _i6;
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart'
    as _i11;
import 'package:lymphoma/presentation/pages/main/doctor/cubit/main_doctor_page_cubit.dart'
    as _i10;
import 'package:lymphoma/presentation/pages/main/patient/cubit/main_patient_page_cubit.dart'
    as _i9;
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart'
    as _i12;

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
    gh.factory<_i4.PatientsRepository>(() => _i4.PatientsRepository());
    gh.factory<_i5.UserRepository>(() => _i5.UserRepository());
    gh.factory<_i6.FieldChanger>(() => _i6.FieldChanger());
    gh.factory<_i7.PatientsInteractor>(() => _i7.PatientsInteractor(
          gh<_i4.PatientsRepository>(),
          gh<_i5.UserRepository>(),
        ));
    gh.factory<_i8.AuthInteractor>(() => _i8.AuthInteractor(
          gh<_i3.AuthRepository>(),
          gh<_i4.PatientsRepository>(),
        ));
    gh.factory<_i9.MainPatientPageCubit>(() =>
        _i9.MainPatientPageCubit(gh<_i7.PatientsInteractor>())
          ..loadPatientInfo());
    gh.factory<_i10.MainDoctorPageCubit>(() =>
        _i10.MainDoctorPageCubit(gh<_i7.PatientsInteractor>())..loadPatients());
    gh.factory<_i11.LoginCubit>(() => _i11.LoginCubit(
          gh<_i8.AuthInteractor>(),
          gh<_i6.FieldChanger>(),
        ));
    gh.factory<_i12.RegistrationCubit>(() => _i12.RegistrationCubit(
          gh<_i8.AuthInteractor>(),
          gh<_i6.FieldChanger>(),
        ));
    return this;
  }
}
