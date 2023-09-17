import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';

export 'package:flutter_firebase_auth_demo/src/domain/entities/user_credential.dart';
export 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';

abstract class AuthRepository {

  Future<RegisteredAccount> register(AccountCredential credentail);

  Future<UserSession> login(AccountCredential credentail);

  Future<AppUser> getUser();
}
