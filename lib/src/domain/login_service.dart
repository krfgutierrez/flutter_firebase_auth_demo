import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/login_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

export 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
export 'package:flutter_firebase_auth_demo/src/domain/models/login_service_params.dart';
export 'package:flutter_firebase_auth_demo/src/domain/models/login_service_result.dart';
export 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

abstract class LoginService
    implements Executable<LoginServiceParams, Future<UserSession>> {}
