import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/domain/registration_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final LoginService _loginService;
  final GetUserService _getUserService;
  final RegistrationService _registrationService;

  AuthRepositoryImpl(
    this._loginService,
    this._getUserService,
    this._registrationService,
  );

  @override
  Future<AppUser> getUser() async {
    return _getUserService.execute(null);
  }

  @override
  Future<UserSession> login(AccountCredential credential) async {
    return _loginService.execute(
      LoginServiceParams(credential.username, credential.password),
    );
  }

  @override
  Future<RegisteredAccount> register(AccountCredential credential) {
    return _registrationService.execute(
      RegistrationServiceParams(credential.username, credential.password),
    );
  }
}
