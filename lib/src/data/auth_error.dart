import 'package:equatable/equatable.dart';

class AuthError extends Equatable implements Exception {
  final String code;
  final String message;

  const AuthError(this.code, this.message);

  @override
  List<Object?> get props => [code, message];
}

class UnauthenticatedException extends AuthError {
  const UnauthenticatedException()
      : super('Unauthenticated',
            'User is not logged in or the session is alreadt expired.');
}

class InvalidCredentialException extends AuthError {
  const InvalidCredentialException()
      : super('InvalidCredential', 'Invalid username and/or password.');
}

class AccountDisabledException extends AuthError {
  const AccountDisabledException()
      : super('AccountDisabled', 'Account is temporarily disabled.');
}
