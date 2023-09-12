// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'auth.dart' as _i12;
import 'data/auth_repository_impl.dart' as _i10;
import 'data/get_user_service_impl.dart' as _i6;
import 'data/login_service_impl.dart' as _i8;
import 'domain/auth_repository.dart' as _i9;
import 'domain/get_user_service.dart' as _i5;
import 'domain/login_service.dart' as _i7;
import 'domain/login_use_case.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final flutterFirebaseAuthDemoModule = _$FlutterFirebaseAuthDemoModule();
    await gh.singletonAsync<_i3.FirebaseApp>(
      () => flutterFirebaseAuthDemoModule.firebaseApp,
      preResolve: true,
    );
    gh.singleton<_i4.FirebaseAuth>(
        flutterFirebaseAuthDemoModule.firebaseAuth());
    gh.factory<_i5.GetUserService>(
        () => _i6.GetUserServiceImpl(gh<_i4.FirebaseAuth>()));
    gh.factory<_i7.LoginService>(
        () => _i8.LoginServiceImpl(gh<_i4.FirebaseAuth>()));
    gh.factory<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
          gh<_i7.LoginService>(),
          gh<_i5.GetUserService>(),
        ));
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(gh<_i9.AuthRepository>()));
    return this;
  }
}

class _$FlutterFirebaseAuthDemoModule
    extends _i12.FlutterFirebaseAuthDemoModule {}
