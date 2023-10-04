import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:get_it/get_it.dart';

abstract class ILoginFormContract {
  void onSubmit(AccountCredential credential);
}

abstract class ILoginFormValidator {
  String? email(String? email);

  String? password(String? password);
}

class LoginForm extends StatefulWidget {

  final ILoginFormContract contract;
  final bool processing;
  
  const LoginForm(this.contract, {
    super.key,
    this.processing = false
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
      widget.contract.onSubmit(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formEnabled = !widget.processing;
    return Form(
      key: form,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          TextFormField(
            key: const Key('LoginForm-textfield-email'),
            validator: validator.email,
            enabled: formEnabled,
            onSaved: (value) {
              formValues['email'] = value;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            key: const Key('LoginForm-textfield-password'),
            validator: validator.password,
            enabled: formEnabled,
            onSaved: (value) {
              formValues['password'] = value;
            },
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            key: const Key('LoginForm-button-submit'),
            onPressed: formEnabled ? submit : null,
            child: Row(
              children: [
                Visibility(
                  visible: !formEnabled,
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
    
  }
}
