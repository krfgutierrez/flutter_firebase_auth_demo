import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// ignore: unnecessary_import
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginService)
class LoginServiceImpl implements LoginService {
  final FirebaseAuth _auth;

  const LoginServiceImpl(this._auth);

  @override
  Future<UserSession> execute(LoginServiceParams params) async {
    try {
      final LoginServiceParams(:email, :password) = params;
      final UserCredential(:credential, :user) = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      final error = validateCredentail(credential, user);
      if (error != null) {
        throw error;
      } else {
        credential!;
        user!;
      }
      return UserSession(
        accessToken: credential.accessToken!,
        uid: user.uid,
      );
    } on AuthenticationException catch (_) {
      rethrow;
    } on FirebaseAuthException catch (error) {
      // invalid-email: Thrown if the email address is not valid.
      // user-disabled: Thrown if the user corresponding to the given email has been disabled.
      // user-not-found: Thrown if there is no user corresponding to the given email.
      // wrong-password: Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
      switch (error.code) {
        case 'user-disabled':
          throw const AccountDisabledException();
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          throw const InvalidCredentialException();
        default:
          throw AuthenticationException('ServerError',
              ' Unhandled Firebase Auth error code ${error.code}');
      }
    } catch (error) {
      throw AuthenticationException('ServerError', error.toString());
    }
  }

  @protected
  AuthenticationException? validateCredentail(
      AuthCredential? credential, User? user) {
    if (credential == null) {
      return const AuthenticationException('ServerError',
          'The property "credential" from Firebase Auth is null');
    }
    if (credential.accessToken == null) {
      return const AuthenticationException('ServerError',
          'The property "accessToken" from Firebase Auth is null');
    }
    if (user == null) {
      return const AuthenticationException(
          'ServerError', 'The property "user" from Firebase Auth is null');
    }
    return null;
  }
}
