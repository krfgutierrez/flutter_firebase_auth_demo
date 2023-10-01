import 'package:equatable/equatable.dart';

class AccountCredential extends Equatable {
  final String username;
  final String password;
  const AccountCredential(this.username, this.password);

  @override
  List<Object?> get props => [username, password];

}
