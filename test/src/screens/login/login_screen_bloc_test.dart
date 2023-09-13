import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/login_screen_cubit.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/login_screen_event.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/login_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<LoginUseCase>(),
  MockSpec<UserSession>(),
  MockSpec<UserCredentail>()
])
import 'login_screen_bloc_test.mocks.dart';

void main() {
  group('LoginScreenBloc', () {
    late LoginScreenBloc bloc;

    final useCase = MockLoginUseCase();
    const session = UserSession(accessToken: 'access-token', uid: 'user123');
    const credentails = UserCredentail('user@gmail.com', 'password123');

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
        when(useCase.execute(credentails)).thenAnswer((_) async => session);
        bloc.add(LoginScreenEvent.submit(credentails));
      },
      verify: (_) {
        verify(useCase.execute(credentails)).called(1);
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
        when(useCase.execute(credentails))
            .thenThrow(const InvalidCredentialException());
        bloc.add(LoginScreenEvent.submit(credentails));
      },
      verify: (_) {
        verify(useCase.execute(credentails)).called(1);
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
  });
}
