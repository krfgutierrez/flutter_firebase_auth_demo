import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/data/registration_service_impl.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/domain/registration_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<UserCredential>(),
  MockSpec<AuthCredential>(),
  MockSpec<User>(),
])
import 'registration_service_impl_test.mocks.dart';

void main() {
  group('RegistrationServiceImpl', () {
    late RegistrationService service;

    final auth = MockFirebaseAuth();

    final user = MockUser();
    final authCredential = MockAuthCredential();
    const params = RegistrationServiceParams('user@gmail.com', 'password123');
    const String uid = 'user-123';
    const String email = 'user@gmail.com';
    const String password = 'password123';

    setUp(() {
      service = RegistrationServiceImpl(auth);
    });

    tearDown(() {
      reset(auth);
      reset(authCredential);
      reset(user);
    });

    test('Expect a successful registration', () async {
      when(
        auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenAnswer((_) async {
        final credentails = MockUserCredential();
        when(credentails.credential).thenReturn(authCredential);
        when(user.uid).thenReturn(uid);
        when(user.email).thenReturn(email);
        when(credentails.user).thenReturn(user);
        return credentails;
      });
      final result = await service.execute(params);
      verify(
        auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
      expect(result.email, equals(user.email));
      expect(result.uid, equals(user.uid));
      expect(result, equals(const RegisteredAccount(uid, email)));
    });

    test('Expect Server error when unhandle firebase auth error code', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(FirebaseAuthException(
              code: 'SomethingWentWrong',
              message: 'Something went wrong with your request.'));
      expect(() => service.execute(params), throwsA((error) {
        return error is AuthenticationException &&
            error.code == 'ServerError' &&
            error.message == 'Something went wrong with your request.';
      }));
    });

    test('Unhandled exception, expect server error', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(UnsupportedError('Unsupport account'));
      expect(() => service.execute(params), throwsA((error) {
        return error is AuthenticationException &&
            error.code == 'ServerError' &&
            error.message == 'Unsupported operation: Unsupport account';
      }));
    });

    group('Expect error for successful registration but data are empty', () {
      final authCredential = MockUserCredential();

      tearDown(() {
        reset(authCredential);
      });

      test('Expect error when user from FirebaseAuth is null', () {
        when(auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .thenAnswer((_) async {
          when(authCredential.user).thenReturn(null);
          return authCredential;
        });
        expect(() => service.execute(params), throwsA((error) {
          return error is AuthenticationException &&
              error.code == 'ServerError' &&
              error.message == 'The property "user" from Firebase Auth is null';
        }));
      });

      test('Expect error when user.email from FirebaseAuth is null', () {
        when(auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .thenAnswer((_) async {
          when(user.email).thenReturn(null);
          when(authCredential.user).thenReturn(user);
          return authCredential;
        });
        expect(() => service.execute(params), throwsA((error) {
          return error is AuthenticationException &&
              error.code == 'ServerError' &&
              error.message ==
                  'The property "user.email" from Firebase Auth is null';
        }));
      });
    });

    test('Expect EmailAlreadyInUseException', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));
      expect(() => service.execute(params),
          throwsA(isA<EmailAlreadyInUseException>()));
    });

    test('Expect InvalidEmailException', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(FirebaseAuthException(code: 'invalid-email'));
      expect(
          () => service.execute(params), throwsA(isA<InvalidEmailException>()));
    });

    test('Expect WeakPasswordException', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(FirebaseAuthException(code: 'weak-password'));
      expect(
          () => service.execute(params), throwsA(isA<WeakPasswordException>()));
    });

    test('Expect AuthenticationException with code "ServerError"', () {
      when(auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .thenThrow(FirebaseAuthException(code: 'operation-not-allowed'));
      expect(() => service.execute(params), throwsA((error) {
        return error is AuthenticationException && error.code == 'ServerError';
      }));
    });
  });
}
