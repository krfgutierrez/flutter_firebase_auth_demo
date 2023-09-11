// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/auth_repository_impl.dart' as _i9;
import 'data/get_user_service_impl.dart' as _i4;
import 'data/login_service_impl.dart' as _i7;
import 'domain/auth_repository.dart' as _i8;
import 'domain/get_user_service.dart' as _i3;
import 'domain/login_service.dart' as _i6;
import 'domain/login_use_case.dart' as _i10;

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
    gh.factory<_i3.GetUserService>(
        () => _i4.GetUserServiceImpl(gh<_i5.FirebaseAuth>()));
    gh.factory<_i6.LoginService>(
        () => _i7.LoginServiceImpl(gh<_i5.FirebaseAuth>()));
    gh.factory<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
          gh<_i6.LoginService>(),
          gh<_i3.GetUserService>(),
        ));
    gh.factory<_i10.LoginUseCase>(
        () => _i10.LoginUseCase(gh<_i8.AuthRepository>()));
    return this;
  }
}
