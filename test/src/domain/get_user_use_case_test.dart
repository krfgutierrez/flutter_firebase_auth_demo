import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:flutter_firebase_auth_demo/src/domain/get_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  group('GetUserUseCase', () {
    final authRepository = MockAuthRepository();

    tearDown(() {
      reset(authRepository);
    });

    test('Expect to get AppUser', () async {
      const mockUserResult = AppUser(
        'user123',
        email: 'user@gmail.com',
        phoneNumber: '+6392381234128',
        photoURL: null,
      );
      when(authRepository.getUser()).thenAnswer((_) async => mockUserResult);
      final useCase = GetUserUseCase(authRepository);
      final user = await useCase.execute(null);

      expect(user, equals(mockUserResult));
      verify(authRepository.getUser()).called(1);
    });

    test('Expect to throw UnauthorizedException', () async {
      when(authRepository.getUser()).thenThrow(const UnauthenticatedException());
      final useCase = GetUserUseCase(authRepository);
      expect(
        () => useCase.execute(null),
        throwsA(
          isA<UnauthenticatedException>(),
        ),
      );
      verify(authRepository.getUser()).called(1);
    });
  });
}

