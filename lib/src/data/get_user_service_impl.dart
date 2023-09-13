import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';

import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserService)
class GetUserServiceImpl implements GetUserService {
  final FirebaseAuth _auth;

  GetUserServiceImpl(this._auth);

  @override
  Future<AppUser> execute(void params) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw const UnauthenticatedException();
    }
    return AppUser(
      user.uid,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
  }
}
