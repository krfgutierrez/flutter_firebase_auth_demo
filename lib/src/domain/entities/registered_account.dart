import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_auth_demo/src/domain/registration_service.dart';

/// The data returned when registration through [RegistrationService] is successful.
/// 
class RegisteredAccount extends Equatable {
  final String email;
  final String uid;

  const RegisteredAccount(this.uid, this.email);

  //
  @override
  List<Object?> get props => [uid, email];
}
