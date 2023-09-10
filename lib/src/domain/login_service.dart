import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';
import 'package:equatable/equatable.dart' show Equatable;

class LoginServiceParams extends Equatable {
  final String email;
  final String password;
  const LoginServiceParams(this.email, this.password);
  // coverage:ignore-start
  @override
  List<Object?> get props => [email, password];
  // coverage:ignore-end
}

class LoginServiceResult extends Equatable {
  final String token;
  final String uid;
  const LoginServiceResult({
    required this.token,
    required this.uid,
  });

  // coverage:ignore-line
  @override
  List<Object?> get props => [token, uid];
}

abstract class LoginService
    implements Executable<LoginServiceParams, Future<LoginServiceResult>> {}
