import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends Executable<UserCredentail, Future<UserSession>> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<UserSession> execute(UserCredentail params) async {
    return _authRepository.login(params);
  }
}
