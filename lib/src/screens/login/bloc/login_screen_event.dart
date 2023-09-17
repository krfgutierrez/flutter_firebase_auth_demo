import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_event.freezed.dart';

@freezed
class LoginScreenEvent with _$LoginScreenEvent {
  factory LoginScreenEvent.submit(AccountCredential credential) =
      LoginScreenSubmitEvent;
}
