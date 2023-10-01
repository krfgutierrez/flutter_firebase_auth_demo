import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;

FormFieldValidator<String> passwordValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(errorText: 'Password is required'),
  FormBuilderValidators.minLength(6,
      errorText: 'Password must be at least 6 characters'),
  FormBuilderValidators.maxLength(120,
      errorText: 'Password cannot exceed 120 characters'),
  FormBuilderValidators.match(r'.*[a-z]',
      errorText: 'Password must have at least 1 lowercase letter'),
  FormBuilderValidators.match(r'.*[A-Z]',
      errorText: 'Password must have at least 1 uppercase letter'),
  FormBuilderValidators.match(r'.\d',
      errorText: 'Password must have at least 1 digit'),
  FormBuilderValidators.match(r'.\W',
      errorText: '1 or more special character are required')
]);
