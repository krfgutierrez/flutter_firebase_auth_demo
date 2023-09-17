import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_event.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_state.dart';
import 'package:injectable/injectable.dart';

export 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_event.dart';
export 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_state.dart';

@Injectable()
class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final LoginUseCase _loginUseCase;

  LoginScreenBloc(this._loginUseCase) : super(LoginScreenState.initial()) {
    on<LoginScreenSubmitEvent>((event, emit) async {
      try {
        emit(LoginScreenState.processing());
        final session = await _loginUseCase.execute(event.credential);
        emit(LoginScreenState.success(session));
      } catch (err) {
        emit(LoginScreenState.failed(err));
      }
    });
  }
}
