import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth_demo/src/data/login_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service_error.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginService)
class LoginServiceImpl implements LoginService {
  final FirebaseAuth _auth;

  const LoginServiceImpl(this._auth);

  @override
  Future<LoginServiceResult> execute(LoginServiceParams params) async {
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
      return LoginServiceResult(
        token: credential.accessToken!,
        uid: user.uid,
      );
    } on LoginServiceException catch (_) {
      rethrow;
    } on FirebaseAuthException catch (error) {
      // invalid-email: Thrown if the email address is not valid.
      // user-disabled: Thrown if the user corresponding to the given email has been disabled.
      // user-not-found: Thrown if there is no user corresponding to the given email.
      // wrong-password: Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
      switch (error.code) {
        case 'user-disabled':
          throw AccountDisabledException();
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          throw InvalidCredentialException('Invalid ');
        default:
          throw LoginServiceException('ServerError',
              ' Unhandled Firebase Auth error code ${error.code}');
      }
    } catch (error) {
      throw LoginServiceException('ServerError', error.toString());
    }
  }

  @protected
  LoginServiceException? validateCredentail(
      AuthCredential? credential, User? user) {
    if (credential == null) {
      return LoginServiceException('ServerError',
          'The property "credential" from Firebase Auth is null');
    }
    if (credential.accessToken == null) {
      return LoginServiceException('ServerError',
          'The property "accessToken" from Firebase Auth is null');
    }
    if (user == null) {
      return LoginServiceException(
          'ServerError', 'The property "user" from Firebase Auth is null');
    }
    return null;
  }
}
