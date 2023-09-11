import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  final String accessToken;
  final String uid;

  const UserSession({
    required this.accessToken,
    required this.uid,
  });

  @override
  List<Object?> get props => [accessToken, uid];
}
