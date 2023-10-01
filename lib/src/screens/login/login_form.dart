import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/data/base_exception.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class ILoginFormContract {
  void onLoginSucceed(UserSession session);
}

abstract class ILoginFormValidator {
  String? email(String? email);

  String? password(String? password);
}

class LoginForm extends StatefulWidget {

  final ILoginFormContract contract;
  
  const LoginForm({
    super.key,
    required this.contract,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> form;
  late Map<String, dynamic> formValues;
  late ILoginFormValidator validator;

  @override
  void initState() {
    form = GlobalKey<FormState>(debugLabel: 'login_form');
    validator = GetIt.instance.get<ILoginFormValidator>();
    formValues = {};
    super.initState();
  }
  
  void submit() {
    assert(form.currentState != null);
    final valid = form.currentState!.validate();
    if (valid) {
      form.currentState!.save();
      final credential = AccountCredential(
        formValues['email'],
        formValues['password'] ?? '',
      );
      BlocProvider.of<LoginScreenBloc>(context).add(
        LoginScreenEvent.submit(credential),
      );
    }
  }

  void onAuthenticated(UserSession session) {
    widget.contract.onLoginSucceed(session);
  }

  void onLoginFailed(dynamic error) {
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

  void _onStateChanged(BuildContext context, LoginScreenState state) {
    state.maybeWhen(
      success: onAuthenticated,
      failed: onLoginFailed,
      // coverage:ignore-line
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginScreenBloc>(context);
    return BlocConsumer<LoginScreenBloc, LoginScreenState>(
      bloc: bloc,
      listener: _onStateChanged,
      builder: (context, state) {
        final bool disabled = state.whenOrNull(
              success: (_) => true,
              processing: () => true,
            ) ??
            false;
        return Form(
          key: form,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                key: const Key('LoginForm-textfield-email'),
                validator: validator.email,
                enabled: !disabled,
                onSaved: (value) {
                  formValues['email'] = value;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('LoginForm-textfield-password'),
                validator: validator.password,
                enabled: !disabled,
                onSaved: (value) {
                  formValues['password'] = value;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                key: const Key('LoginForm-button-submit'),
                onPressed: disabled ? null : submit,
                child: Row(
                  children: [
                    Visibility(
                      visible: disabled,
                      maintainSize: false,
                      child: const Row(
                        children: [
                          CircularProgressIndicator.adaptive(),
                          SizedBox(
                            width: 6,
                          )
                        ],
                      ),
                    ),
                    const Text('Login'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    
  }
}
