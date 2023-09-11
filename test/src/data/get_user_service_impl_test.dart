import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/data/get_user_service_impl.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<firebase_auth.FirebaseAuth>(), MockSpec<firebase_auth.User>()])
import 'get_user_service_impl_test.mocks.dart';

void main() {
  group('GetUserServiceImpl', () {
    final firebaseAuth = MockFirebaseAuth();

    tearDown(() {
      reset(firebaseAuth);
    });

    test('Expect to receive User', () async {
      final mockUser = MockUser();
      when(mockUser.email).thenReturn('user@gmail');
      when(mockUser.uid).thenReturn('user123');
      when(mockUser.photoURL).thenReturn(null);
      when(mockUser.phoneNumber).thenReturn('+639781263712');
      when(firebaseAuth.currentUser).thenAnswer((_) => mockUser);

      final service = GetUserServiceImpl(firebaseAuth);
      final user = await service.execute(null);

      expect(
        user,
        equals(
          AppUser(
            mockUser.uid,
            email: mockUser.email,
            phoneNumber: mockUser.phoneNumber,
            photoURL: mockUser.photoURL,
          ),
        ),
      );
    });

    test('Expect UnauthenticatedException', () async {
      when(firebaseAuth.currentUser).thenAnswer((_) => null);

      final service = GetUserServiceImpl(firebaseAuth);
      expect(() => service.execute(null),
          throwsA(isA<UnauthenticatedException>()));
    });
  });
}
