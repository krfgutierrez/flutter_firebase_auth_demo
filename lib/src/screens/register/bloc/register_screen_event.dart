import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_screen_event.freezed.dart';

@freezed
class RegisterScreenEvent with _$RegisterScreenEvent {
  factory RegisterScreenEvent.submit(AccountCredential credential) =
      RegisterScreenSubmitEvent;
}
