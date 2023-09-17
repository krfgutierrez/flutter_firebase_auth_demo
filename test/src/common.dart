import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<UserCredential>(),
  MockSpec<AuthCredential>(),
  MockSpec<User>(),
  MockSpec<AuthRepository>(),
])
export 'common.mocks.dart';
