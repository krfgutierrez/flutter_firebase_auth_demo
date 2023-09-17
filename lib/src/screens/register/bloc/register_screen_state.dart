

import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_screen_state.freezed.dart';

@freezed
class RegisterScreenState with _$RegisterScreenState {
  factory RegisterScreenState.initial() = RegisterScreenInitialState;
  factory RegisterScreenState.processing() = RegisterScreenProcessingState;
  factory RegisterScreenState.success(RegisteredAccount account) = RegisterScreenSuccessState;
  factory RegisterScreenState.failed(Object error) = RegisterScreenFailedState;
}