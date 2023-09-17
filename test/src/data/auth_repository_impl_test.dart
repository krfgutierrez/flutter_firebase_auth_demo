import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_repository_impl.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/domain/registration_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<GetUserService>(),
  MockSpec<LoginService>(),
  MockSpec<RegistrationService>()
])
import 'auth_repository_impl_test.mocks.dart';

void main() {
  group('AuthRepositoryImpl', () {

    final loginService = MockLoginService();
    final getUserService = MockGetUserService();
    final registerService = MockRegistrationService();
    const credentials = AccountCredential('user@gmail.com', 'password123');

    tearDown(() {
      reset(loginService);
      reset(getUserService);
      reset(registerService);
    });

    group('User logs in', () {
      test('Expect to get UserSession', () async {
        final loginService = MockLoginService();
        final loginParams =
            LoginServiceParams(credentials.username, credentials.password);
        const mockSessionResult =
            UserSession(accessToken: 'access-token', uid: 'user123');
        when(
          loginService.execute(loginParams),
        ).thenAnswer((_) async => mockSessionResult);
        final repository = AuthRepositoryImpl(
          loginService,
          getUserService,
          registerService,
        );
        final session = await repository.login(credentials);
        expect(session, equals(mockSessionResult));
        verify(loginService.execute(loginParams)).called(1);
      });

      test('Expect an exception when login failed', () async {
        final loginParams =
            LoginServiceParams(credentials.username, credentials.password);
        when(loginService.execute(loginParams))
            .thenThrow(const InvalidCredentialException());

        final repository =
            AuthRepositoryImpl(loginService, getUserService, registerService);

        expect(
          () => repository.login(credentials),
          throwsA(isA<InvalidCredentialException>()),
        );
        verify(loginService.execute(loginParams)).called(1);
      });
    });

    


    group('Retrieving user information', () {
      test('Expect to retrieve user information', () async {
        const mockUserResult = AppUser(
          'user123',
          email: 'user@gmail.com',
          phoneNumber: '+639728371281',
          photoURL: null,
        );
        when(getUserService.execute(null))
            .thenAnswer((_) async => mockUserResult);
        final repository =
            AuthRepositoryImpl(loginService, getUserService, registerService);
        final user = await repository.getUser();
        expect(user, equals(mockUserResult));
        verify(getUserService.execute(null)).called(1);
      });

      test('Expect error when user retrieval failed', () async {
        when(getUserService.execute(null))
            .thenThrow(const UnauthenticatedException());
        final repository =
            AuthRepositoryImpl(loginService, getUserService, registerService);

        expect(() => repository.getUser(),
            throwsA(isA<UnauthenticatedException>()));
        verify(getUserService.execute(null)).called(1);
      });
    });

    group('User registers', () {
      final registerParams =
          RegistrationServiceParams(credentials.username, credentials.password);
      test(
          'Expect to received registered account after a successful registration',
          () async {
        final mockRegisterResult =
            RegisteredAccount('user-123', credentials.username);

        when(registerService.execute(registerParams))
            .thenAnswer((_) async => mockRegisterResult);
        final repository =
            AuthRepositoryImpl(loginService, getUserService, registerService);
        final result = await repository.register(credentials);
        expect(result, equals(mockRegisterResult));
        verify(registerService.execute(registerParams)).called(1);
      });

      test('Expect error when registration failed', () async {
        when(registerService.execute(registerParams))
            .thenThrow(const InvalidEmailException());
        final repository =
            AuthRepositoryImpl(loginService, getUserService, registerService);

        expect(() => repository.register(credentials),
            throwsA(isA<InvalidEmailException>()));
        verify(registerService.execute(registerParams)).called(1);
      });
    });
  });

  // test('Expect a succesful registation', () {});
}
