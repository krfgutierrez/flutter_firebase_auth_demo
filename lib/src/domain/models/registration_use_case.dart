import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

class RegisterUseCase
    extends Executable<AccountCredential, Future<RegisteredAccount>> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<RegisteredAccount> execute(AccountCredential params) {
    return _repository.register(params);
  }
}
