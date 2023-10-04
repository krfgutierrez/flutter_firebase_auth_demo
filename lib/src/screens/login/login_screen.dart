import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart';
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_bloc.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/login_form.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatelessWidget implements ILoginFormContract {
  
  @override
  void onSubmit(AccountCredential credential) {
    // TODO: implement onSubmit
  }

  void onLoginFailed(BuildContext context, dynamic error) {
    String title;
    String message;
    if (error is AuthenticationException) {
      title = 'Login Failed';
      message = error.message;
    } else {
      title = 'Error Occured';
      message =
          'Something went wrong with your request, please try again. If this issue continue to persist, please report it to us.';
    }
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          const Text('Firebase Auth Demo'),
          BlocProvider<LoginScreenBloc>.value(
            value: GetIt.instance.get<LoginScreenBloc>(),
            child: LoginForm( this, processing: false,),
          ),
        ],
      ),
    );
  }
}
