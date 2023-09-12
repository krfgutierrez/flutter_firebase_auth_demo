import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'login_use_case_test.mocks.dart';

void main() {
  group('LoginUseCase', () {
    final authRepository = MockAuthRepository();
    const credentials = UserCredentail('user@gmail.com', 'password123');

    tearDown(() {
      reset(authRepository);
    });

    test('Expect to receive UserSession', () async {
      const mockLoginResult =
          UserSession(accessToken: 'access-token', uid: 'user-123');
      when(authRepository.login(credentials))
          .thenAnswer((_) async => mockLoginResult);

      final useCase = LoginUseCase(authRepository);
      final session = await useCase.execute(credentials);

      expect(session, equals(mockLoginResult));
      verify(authRepository.login(credentials)).called(1);
    });

    test('Expect to throw an exception', () async {
      when(authRepository.login(credentials))
          .thenThrow(AccountDisabledException());
      final useCase = LoginUseCase(authRepository);
      expect(() => useCase.execute(credentials),
          throwsA(isA<AccountDisabledException>()));
    });
  });
}
