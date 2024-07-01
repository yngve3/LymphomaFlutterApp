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
import 'package:lymphoma/domain/interactors/auth_interactor.dart' as _i5;
import 'package:lymphoma/domain/utils/field_changer.dart' as _i4;
import 'package:lymphoma/presentation/pages/login/cubit/login_cubit.dart'
    as _i6;
import 'package:lymphoma/presentation/pages/registrations/cubit/registration_cubit.dart'
    as _i7;

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
    gh.factory<_i4.FieldChanger>(() => _i4.FieldChanger());
    gh.factory<_i5.AuthInteractor>(
        () => _i5.AuthInteractor(gh<_i3.AuthRepository>()));
    gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit(
          gh<_i5.AuthInteractor>(),
          gh<_i4.FieldChanger>(),
        ));
    gh.factory<_i7.RegistrationCubit>(() => _i7.RegistrationCubit(
          gh<_i5.AuthInteractor>(),
          gh<_i4.FieldChanger>(),
        ));
    return this;
  }
}
