import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart';
import 'package:flutter_firebase_auth_demo/src/domain/models/registration_service_params.dart';
import 'package:flutter_firebase_auth_demo/src/utils/executable.dart';

abstract class RegistrationService
    extends Executable<RegistrationServiceParams, Future<RegisteredAccount>> {}
