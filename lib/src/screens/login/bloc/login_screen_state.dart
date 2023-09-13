import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@Freezed()
class LoginScreenState with _$LoginScreenState {
  factory LoginScreenState.initial() = LoginScreenInitialState;
  factory LoginScreenState.processing() = LoginScreenProcessingState;
  factory LoginScreenState.success(UserSession session) =
      LoginScreenAuthenticatedState;
  factory LoginScreenState.failed(Object error) = LoginScreenFailedState;
}
