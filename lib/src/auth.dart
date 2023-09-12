import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth_demo/firebase_options.dart';

import 'auth.config.dart';

import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  
)
Future<GetIt> configureDependencies() => getIt.init();

@module
abstract class FlutterFirebaseAuthDemoModule {
  @preResolve
  @singleton
  Future<FirebaseApp> get firebaseApp {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @singleton
  FirebaseAuth firebaseAuth() {
    return FirebaseAuth.instance;
  }
}
