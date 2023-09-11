import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final LoginService _loginService;
  final GetUserService _getUserService;

  AuthRepositoryImpl(
    this._loginService,
    this._getUserService,
  );

  @override
  Future<AppUser> getUser() async {
    return await _getUserService.execute(null);
  }

  @override
  Future<UserSession> login(UserCredentail credentail) async {
    return await _loginService.execute(
      LoginServiceParams(credentail.username, credentail.password),
    );
  }
}
