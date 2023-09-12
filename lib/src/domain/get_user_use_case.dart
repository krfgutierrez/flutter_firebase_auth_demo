import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

class GetUserUseCase extends Executable<void, Future<AppUser>> {
  final AuthRepository _authRepository;

  GetUserUseCase(this._authRepository);

  @override
  Future<AppUser> execute(void params) {
    return _authRepository.getUser();
  }
}
