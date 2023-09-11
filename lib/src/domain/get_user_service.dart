import 'package:flutter_firebase_auth_demo/src/domain/entities/user.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

export 'package:flutter_firebase_auth_demo/src/domain/entities/user.dart';

abstract class GetUserService extends Executable<void, Future<AppUser>> {}
