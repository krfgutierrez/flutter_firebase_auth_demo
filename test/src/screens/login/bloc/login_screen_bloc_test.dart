import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<LoginUseCase>(),
  MockSpec<UserSession>(),
])
import 'login_screen_bloc_test.mocks.dart';

void main() {
  group('LoginScreenBloc', () {
    late LoginScreenBloc bloc;

    final useCase = MockLoginUseCase();
    const session = UserSession(accessToken: 'access-token', uid: 'user123');
    const credentials = AccountCredential('user@gmail.com', 'password123');

    setUp(() {
      bloc = LoginScreenBloc(useCase);
    });

    tearDown(() {
      reset(useCase);
    });

    test('Expect loginScreenBloc to have initial state', () {
      expect(bloc.state, equals(LoginScreenState.initial()));
    });

    blocTest<LoginScreenBloc, LoginScreenState>(
      'Successful login expects to emit [processing, authenticated]',
      build: () => bloc,
      act: (bloc) {
        when(useCase.execute(credentials)).thenAnswer((_) async => session);
        bloc.add(LoginScreenEvent.submit(credentials));
      },
      verify: (_) {
        verify(useCase.execute(credentials)).called(1);
      },
      expect: () => <dynamic>[
        LoginScreenState.processing(),
        isA<LoginScreenAuthenticatedState>()
            .having((state) => state.session, 'session', session)
      ],
    );

    blocTest<LoginScreenBloc, LoginScreenState>(
      'Failed login expects to emit [processing, failed]',
      build: () => bloc,
      act: (bloc) {
        when(useCase.execute(credentials))
            .thenThrow(const InvalidCredentialException());
        bloc.add(LoginScreenEvent.submit(credentials));
      },
      verify: (_) {
        verify(useCase.execute(credentials)).called(1);
      },
      expect: () => <dynamic>[
        LoginScreenState.processing(),
        isA<LoginScreenFailedState>().having(
          (state) => state.error,
          'error',
          const InvalidCredentialException(),
        ),
      ],
    );

    blocTest<LoginScreenBloc, LoginScreenState>(
      'Login failed, expect to emit [processing, authenticated] '
      'when login reattempted and was successful',
      build: () => bloc,
      seed: () {
        return LoginScreenState.failed(const InvalidCredentialException());
      },
      act: (bloc) {
        when(useCase.execute(credentials)).thenAnswer((_) async => session);
        bloc.add(LoginScreenEvent.submit(credentials));
      },
      verify: (_) {
        verify(useCase.execute(credentials)).called(1);
      },
      expect: () => <LoginScreenState>[
        LoginScreenState.processing(),
        LoginScreenState.success(session),
      ],
    );
  });
}
