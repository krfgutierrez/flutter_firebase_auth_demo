import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/register/bloc/register_screen_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<RegisterUseCase>()])
import 'register_screen_bloc_test.mocks.dart';

void main() {
  group('RegisterScreenBloc', () {
    late RegisterScreenBloc bloc;

    final useCase = MockRegisterUseCase();

    const credential = AccountCredential('user@gmail.com', 'password123');
    const account = RegisteredAccount('user123', 'user@gmail.com');

    setUp(() {
      bloc = RegisterScreenBloc(useCase);
    });

    tearDown(() {
      reset(useCase);
    });

    test('Expect bloc to have initial state', () {
      expect(bloc.state, equals(RegisterScreenState.initial()));
    });

    blocTest<RegisterScreenBloc, RegisterScreenState>(
      'Expect a successful account registration',
      build: () => bloc,
      act: (bloc) {
        when(useCase.execute(credential))
            .thenAnswer((realInvocation) async => account);
        bloc.add(RegisterScreenEvent.submit(credential));
      },
      verify: (_) {
        verify(useCase.execute(credential)).called(1);
      },
      expect: () => <dynamic>[
        RegisterScreenState.processing(),
        RegisterScreenState.success(account)
      ],
    );

    blocTest(
      'Expect exception when account registration failed',
      build: () {
        return RegisterScreenBloc(useCase);
      },
      act: (bloc) {
        when(useCase.execute(credential))
            .thenThrow(const InvalidEmailException());
        bloc.add(RegisterScreenEvent.submit(credential));
      },
      verify: (_) {
        verify(useCase.execute(credential)).called(1);
      },
      expect: () => <dynamic>[
        RegisterScreenState.processing(),
        isA<RegisterScreenFailedState>().having(
          (state) => state.error,
          'error',
          const InvalidEmailException(),
        )
      ],
    );
  });
}
