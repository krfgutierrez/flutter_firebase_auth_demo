import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_bloc.dart';
import 'package:get_it/get_it.dart';

typedef OnLogin = void Function(String username, String password);

class LoginForm extends StatefulWidget {
  final OnLogin onLogin;

  const LoginForm({
    super.key,
    required this.onLogin,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginScreenBloc bloc;
  late GlobalKey<FormState> form;
  late Map<String, dynamic> formValues;

  @override
  void initState() {
    form = GlobalKey<FormState>(debugLabel: 'login_form');
    bloc = GetIt.instance.get<LoginScreenBloc>();
    formValues = {};
    super.initState();
  }

  void submit() {
    final valid = form.currentState?.validate() ?? false;
    if (!valid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {
              formValues['email'] = value;
            },
          ),
          TextFormField(
            onSaved: (value) {
              formValues['password'] = value;
            },
          ),
        ],
      ),
    );
  }
}
