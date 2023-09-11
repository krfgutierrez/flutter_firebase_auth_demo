class AuthError implements Exception {
  final String code;
  final String message;

  AuthError(this.code, this.message);
}

class UnauthenticatedException extends AuthError {
  UnauthenticatedException()
      : super('Unauthenticated',
            'User is not logged in or the session is alreadt expired.');
}

class InvalidCredentialException extends AuthError {
  InvalidCredentialException()
      : super('InvalidCredential', 'Invalid username and/or password.');
}

class AccountDisabledException extends AuthError {
  AccountDisabledException()
      : super('AccountDisabled', 'Account is temporarily disabled.');
}
