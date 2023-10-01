import 'package:flutter_firebase_auth_demo/src/screens/login/login_form.dart';
import 'package:flutter_firebase_auth_demo/src/utils/validators/password_validator.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginFormValidator implements ILoginFormValidator {
  @override
  String? email(String? email) {
    return FormBuilderValidators.email(errorText: 'Invalid Email')(email);
  }

  @override
  String? password(String? password) {
    return passwordValidator(password);
  }
}
