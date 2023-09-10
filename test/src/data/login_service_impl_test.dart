import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_service.dart';
import 'package:flutter_firebase_auth_demo/src/data/login_service_error.dart';
import 'package:flutter_firebase_auth_demo/src/data/login_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<UserCredential>(),
  MockSpec<AuthCredential>(),
  MockSpec<User>()
])
import 'login_service_impl_test.mocks.dart';

void main() {
  group('LoginServiceImpl', () {
    final auth = MockFirebaseAuth();

    setUp(() {});

    tearDown(() {
      reset(auth);
    });

    test('Expect successful login', () async {
      const loginParams = LoginServiceParams('user@gmail.com', 'password123');

      final mockAuthCredential = MockAuthCredential();
      final mockUser = MockUser();
      when(mockAuthCredential.accessToken).thenReturn('access-token');
      when(mockUser.uid).thenReturn('user-123');
      when(mockUser.email).thenReturn(loginParams.email);

      when(auth.signInWithEmailAndPassword(
              email: loginParams.email, password: loginParams.password))
          .thenAnswer((realInvocation) async {
        final credential = MockUserCredential();
        when(credential.credential).thenReturn(mockAuthCredential);
        when(credential.user).thenReturn(mockUser);
        return credential;
      });

      final LoginService loginService = LoginServiceImpl(auth);
      final result = await loginService.execute(loginParams);

      verify(auth.signInWithEmailAndPassword(
              email: loginParams.email, password: loginParams.password))
          .called(1);
      verify(mockAuthCredential.accessToken).called(greaterThan(1));
      verify(mockUser.uid).called(1);
      expect(
        result,
        equals(
          const LoginServiceResult(token: 'access-token', uid: 'user-123'),
        ),
      );
    });

    test('Expect account locked', () async {
      const loginParams = LoginServiceParams('user@gmail.com', 'password123');

      when(auth.signInWithEmailAndPassword(
              email: loginParams.email, password: loginParams.password))
          .thenThrow(FirebaseAuthException(code: 'user-disabled'));

      final LoginService loginService = LoginServiceImpl(auth);
      expect(() => loginService.execute(loginParams),
          throwsA(isA<AccountDisabledException>()));
    });

    group('Invalid credentials', () {
      test('Invalid Email', () async {
        const loginParams = LoginServiceParams('user@gmail.com', 'password123');

        when(auth.signInWithEmailAndPassword(
                email: loginParams.email, password: loginParams.password))
            .thenThrow(FirebaseAuthException(code: 'invalid-email'));

        final LoginService loginService = LoginServiceImpl(auth);
        expect(() => loginService.execute(loginParams),
            throwsA(isA<InvalidCredentialException>()));
      });

      test('User not found', () async {
        const loginParams = LoginServiceParams('user@gmail.com', 'password123');

        when(auth.signInWithEmailAndPassword(
                email: loginParams.email, password: loginParams.password))
            .thenThrow(FirebaseAuthException(code: 'user-not-found'));

        final LoginService loginService = LoginServiceImpl(auth);
        expect(() => loginService.execute(loginParams),
            throwsA(isA<InvalidCredentialException>()));
      });

      test('Incorrect password', () async {
        const loginParams = LoginServiceParams('user@gmail.com', 'password123');

        when(auth.signInWithEmailAndPassword(
                email: loginParams.email, password: loginParams.password))
            .thenThrow(FirebaseAuthException(code: 'wrong-password'));

        final LoginService loginService = LoginServiceImpl(auth);
        expect(() => loginService.execute(loginParams),
            throwsA(isA<InvalidCredentialException>()));
      });
    });

    group('Unexpected error', () {
      test('Unhandled Firebase Auth Error code', () async {
        const loginParams = LoginServiceParams('user@gmail.com', 'password123');

        when(auth.signInWithEmailAndPassword(
                email: loginParams.email, password: loginParams.password))
            .thenThrow(FirebaseAuthException(code: 'something-went-wrong'));

        final LoginService loginService = LoginServiceImpl(auth);
        expect(() => loginService.execute(loginParams),
            throwsA(isA<LoginServiceException>()));
      });
      test(
        'Unhandled exception',
        () async {
          const loginParams =
              LoginServiceParams('user@gmail.com', 'password123');
          when(auth.signInWithEmailAndPassword(
                  email: loginParams.email, password: loginParams.password))
              .thenThrow(RangeError('Invalid range'));
          final LoginService service = LoginServiceImpl(auth);
          expect(() => service.execute(loginParams),
              throwsA(isA<LoginServiceException>()));
          expect(() => service.execute(loginParams), throwsA((error) {
            return error.code == 'ServerError' &&
                error.message == 'RangeError: Invalid range';
          }));
        },
      );

      test(
        'Credetials from Firebase Auth is null',
        () async {
          const loginParams =
              LoginServiceParams('user@gmail.com', 'password123');
          when(auth.signInWithEmailAndPassword(
                  email: loginParams.email, password: loginParams.password))
              .thenAnswer((_) async {
            final credential = MockUserCredential();
            when(credential.credential).thenReturn(null);
            return credential;
          });

          final LoginService service = LoginServiceImpl(auth);
          expect(() => service.execute(loginParams),
              throwsA(isA<LoginServiceException>()));
          expect(() => service.execute(loginParams), throwsA((error) {
            return error.code == 'ServerError' &&
                error.message ==
                    'The property "credential" from Firebase Auth is null';
          }));
        },
      );

      test(
        'Access Token from Firebase Auth is null',
        () async {
          const loginParams =
              LoginServiceParams('user@gmail.com', 'password123');
          when(auth.signInWithEmailAndPassword(
                  email: loginParams.email, password: loginParams.password))
              .thenAnswer((_) async {
            final credential = MockUserCredential();
            final authCredential = MockAuthCredential();
            when(authCredential.accessToken).thenReturn(null);
            when(credential.credential).thenReturn(authCredential);
            return credential;
          });

          final LoginService service = LoginServiceImpl(auth);
          expect(() => service.execute(loginParams),
              throwsA(isA<LoginServiceException>()));
          expect(() => service.execute(loginParams), throwsA((error) {
            return error.code == 'ServerError' &&
                error.message ==
                    'The property "accessToken" from Firebase Auth is null';
          }));
        },
      );

      test(
        'User from Firebase Auth is null',
        () async {
          const loginParams =
              LoginServiceParams('user@gmail.com', 'password123');
          when(auth.signInWithEmailAndPassword(
                  email: loginParams.email, password: loginParams.password))
              .thenAnswer((_) async {
            final credential = MockUserCredential();
            final authCredential = MockAuthCredential();
            when(authCredential.accessToken).thenReturn('access-token');
            when(credential.credential).thenReturn(authCredential);
            when(credential.user).thenReturn(null);
            return credential;
          });

          final LoginService service = LoginServiceImpl(auth);
          expect(() => service.execute(loginParams),
              throwsA(isA<LoginServiceException>()));
          expect(() => service.execute(loginParams), throwsA((error) {
            return error.code == 'ServerError' &&
                error.message ==
                    'The property "user" from Firebase Auth is null';
          }));
        },
      );
    });
  });
}
