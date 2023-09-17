import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends Executable<AccountCredential, Future<UserSession>> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<UserSession> execute(AccountCredential params) async {
    return _authRepository.login(params);
  }
}
