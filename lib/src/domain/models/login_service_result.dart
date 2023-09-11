import 'package:equatable/equatable.dart';

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
