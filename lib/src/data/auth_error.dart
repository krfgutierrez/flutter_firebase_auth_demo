import 'package:flutter_firebase_auth_demo/src/data/base_exception.dart';

class AuthenticationException extends BaseException {
  const AuthenticationException(super.code, super.message);
}

class UnauthenticatedException extends AuthenticationException {
  const UnauthenticatedException()
      : // coverage:ignore-start
        super('Unauthenticated',
            'User is not logged in or the session is alreadt expired.');
            // coverage:ignore-end
}

class InvalidCredentialException extends AuthenticationException {
  const InvalidCredentialException()
      : // coverage:ignore-start
        super('InvalidCredential', 'Invalid username and/or password.');
        // coverage:ignore-end
}

class AccountDisabledException extends AuthenticationException {
  const AccountDisabledException()
      : // coverage:ignore-start
        super('AccountDisabled', 'Account is temporarily disabled.');
        // coverage:ignore-end
}

class EmailAlreadyInUseException extends AuthenticationException {
  const EmailAlreadyInUseException()
      : // coverage:ignore-start
        super('EmailAlreadyInUsed', 'Email already in used.');
        // coverage:ignore-end
}

class InvalidEmailException extends AuthenticationException {
  const InvalidEmailException()
      : // coverage:ignore-start
        super('InvalidEmail', 'Invalid or unsupported email format.');
        // coverage:ignore-end
}

class WeakPasswordException extends AuthenticationException {
  const WeakPasswordException()
      : // coverage:ignore-start
        super('WeakPassword', 'Password is too weak.');
        // coverage:ignore-end
}
