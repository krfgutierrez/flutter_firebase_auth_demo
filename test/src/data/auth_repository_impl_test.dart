import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<GetUserService>(), MockSpec<LoginService>()])
import 'auth_repository_impl_test.mocks.dart';

void main() {
  group('AuthRepositoryImpl', () {
    test('Expect to get UserSession', () async {
      final loginService = MockLoginService();
      const loginParams = LoginServiceParams('user@gmail.com', 'password123');
      const mockSessionResult =
          UserSession(accessToken: 'access-token', uid: 'user123');
      when(loginService.execute(loginParams))
          .thenAnswer((_) async => mockSessionResult);

      final session = await loginService.execute(loginParams);
      expect(session, equals(mockSessionResult));
      verify(loginService.execute(loginParams)).called(1);
    });

    test('Expect an exception when LoginService throw an error', () async {
      final loginService = MockLoginService();
      const loginParams = LoginServiceParams('user@gmail.com', 'password123');
 
      when(loginService.execute(loginParams))
          .thenThrow(const InvalidCredentialException());

      expect(
        () => loginService.execute(loginParams),
        throwsA(isA<InvalidCredentialException>()),
      );
    });
  });

  test('Expect to get AppUser', () async {
    final getUserService = MockGetUserService();
    const mockUserResult = AppUser(
      'user123',
      email: 'user@gmail.com',
      phoneNumber: '+639728371281',
      photoURL: null,
    );
    when(getUserService.execute(null)).thenAnswer((_) async => mockUserResult);

    final user = await getUserService.execute(null);
    expect(user, equals(mockUserResult));
    verify(getUserService.execute(null)).called(1);
  });
}
