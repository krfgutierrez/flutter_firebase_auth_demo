import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/domain/registration_service.dart';

class RegistrationServiceImpl implements RegistrationService {
  final FirebaseAuth _auth;

  RegistrationServiceImpl(this._auth);

  @override
  Future<RegisteredAccount> execute(RegistrationServiceParams params) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: params.email, password: params.password);
      final UserCredential(:user) = result;
      final error = validateCredential(user);
      if (error != null) {
        throw error;
      }
      // user and user.email is validated within [validateCredential]. This ensure both data are not null.
      return RegisteredAccount(user!.uid, user.email!);
    } on AuthenticationException {
      rethrow;
    } on FirebaseAuthException catch (err) {
      /// email-already-in-us: Thrown if there already exists an account with the given email address.
      /// invalid-email: Thrown if the email address is not valid.
      /// operation-not-allowed: Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
      /// weak-password: Thrown if the password is not strong enough.
      switch (err.code) {
        case 'email-already-in-use':
          throw const EmailAlreadyInUseException();
        case 'invalid-email':
          throw const InvalidEmailException();
        case 'weak-password':
          throw const WeakPasswordException();
        case 'operation-not-allowed':
          throw const AuthenticationException(
              'ServerError', 'Email and password registration is disabled.');
        default:
          throw AuthenticationException('ServerError', err.message.toString());
      }
    } catch (err) {
      throw AuthenticationException('ServerError', err.toString());
    }
  }

  @protected
  AuthenticationException? validateCredential(User? user) {
    if (user == null) {
      return const AuthenticationException(
          'ServerError', 'The property "user" from Firebase Auth is null');
    }
    if (user.email == null) {
      return const AuthenticationException('ServerError',
          'The property "user.email" from Firebase Auth is null');
    }
    return null;
  }
}
