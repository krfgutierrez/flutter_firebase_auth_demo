class LoginServiceException implements Exception {
  final String code;
  final String message;

  LoginServiceException(this.code, this.message);
}

class InvalidCredentialException extends LoginServiceException {
  InvalidCredentialException(String message)
      : super('InvalidCredential', message);
}

class AccountDisabledException extends LoginServiceException {
  AccountDisabledException()
      : super('AccountDisabled', 'Account is temporarily disabled.');
}