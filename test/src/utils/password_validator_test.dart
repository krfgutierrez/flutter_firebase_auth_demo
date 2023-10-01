import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_auth_demo/src/utils/validators/password_validator.dart';

void main() {
  group('passwordValidator', () {
    test('Expect required error', () {
      final error = passwordValidator(null);
      expect(error, equals('Password is required'));
    });

    test('Expect error when no lowercase letter', () {
      const password = '!PASSWORD123';
      final error = passwordValidator(password);
      expect(error, equals('Password must have at least 1 lowercase letter'));
    });

    test('Expect error when no upper letter', () {
      const password = '!password123';
      final error = passwordValidator(password);
      expect(error, equals('Password must have at least 1 uppercase letter'));
    });

    test('Expect min length error', () {
      const password = 'P@ss0';
      final error = passwordValidator(password);
      expect(error, equals('Password must be at least 6 characters'));
    });

    test('Expect max length error', () {
      const password =
          '!j8fWC6kYMj4K5Dy8ZkDzPLZz5e7xM5hmU3KYXBM2HquczAknH9rO4VkT6cVoCFhouH7pkZ9NFd1PPqjotopVFT2Luua71TpDvMl6FXzJlSJJfwSilLP1FbIZTU';
      final error = passwordValidator(password);
      expect(error, equals('Password cannot exceed 120 characters'));
    });

    test('Expect error when no upper letter', () {
      const password = '!Password';
      final error = passwordValidator(password);
      expect(error, equals('Password must have at least 1 digit'));
    });

    test('Expect error when no special character', () {
      const password = 'Password123';
      final error = passwordValidator(password);
      expect(error, equals('1 or more special character are required'));
    });
  });
}
