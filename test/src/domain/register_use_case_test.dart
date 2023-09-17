import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'register_use_case_test.mocks.dart';

void main() {
  group('RegisterUseCase', () {
    final repository = MockAuthRepository();
    const credentails = AccountCredential('user@gmail.com', 'password123');

    tearDown(() {
      reset(repository);
    });

    test('Expect to receive registere account after successful registration',
        () async {
      final mockRegisterResult =
          RegisteredAccount('user123', credentails.username);
      when(repository.register(credentails)).thenAnswer(
        (_) async => mockRegisterResult,
      );
      final useCase = RegisterUseCase(repository);
      final result = await useCase.execute(credentails);
      expect(result, equals(mockRegisterResult));
      verify(repository.register(credentails)).called(1);
    });

    test('Expect an error when registration failed', () async {
      when(repository.register(credentails))
          .thenThrow(const InvalidEmailException());
      final useCase = RegisterUseCase(repository);
      expect(() => useCase.execute(credentails),
          throwsA(isA<InvalidEmailException>()));
    });
  });
}
