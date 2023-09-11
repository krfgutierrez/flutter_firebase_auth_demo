import 'package:equatable/equatable.dart';

class LoginServiceParams extends Equatable {
  final String email;
  final String password;
  const LoginServiceParams(this.email, this.password);
  // coverage:ignore-start
  @override
  List<Object?> get props => [email, password];
  // coverage:ignore-end
}
