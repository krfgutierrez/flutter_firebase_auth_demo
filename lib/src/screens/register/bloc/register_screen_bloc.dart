import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/register/bloc/register_screen_event.dart';
import 'package:flutter_firebase_auth_demo/src/screens/register/bloc/register_screen_state.dart';

export 'package:flutter_firebase_auth_demo/src/screens/register/bloc/register_screen_event.dart';
export 'package:flutter_firebase_auth_demo/src/screens/register/bloc/register_screen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final RegisterUseCase _useCase;

  RegisterScreenBloc(this._useCase) : super(RegisterScreenState.initial()) {
    on<RegisterScreenSubmitEvent>((event, emit) async {
      emit(RegisterScreenState.processing());
      try {
        final account = await _useCase.execute(event.credential);
        emit(RegisterScreenState.success(account));
      } catch (error) {
        emit(RegisterScreenState.failed(error));
      }
    });
  }
}
