import 'package:equatable/equatable.dart';

class RegistrationServiceParams extends Equatable {
  final String email;
  final String password;

  const RegistrationServiceParams(this.email, this.password);

  // coverage:ignore-start
  @override
  List<Object?> get props => [email, password];
  // coverage:ignore-end
}
