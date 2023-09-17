import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';

export 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
export 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';

abstract class AuthRepository {

  Future<RegisteredAccount> register(AccountCredential credential);

  Future<UserSession> login(AccountCredential credential);

  Future<AppUser> getUser();
}
