import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const kAppMainColor = Colors.lightBlue;

const kDefaultPadding = 20.0;

final kEmailValidator = PatternValidator(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    errorText: 'Invalid email');

final kPhoneValidator = PatternValidator(
  r'^(\+0?1\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$',
  errorText: 'Invalid phone number',
);

final kPasswordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character'),
]);
