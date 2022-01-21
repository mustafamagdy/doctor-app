import 'package:form_field_validator/form_field_validator.dart';

class PasswordMatchValidator extends FieldValidator<String> {
  final String password;
  PasswordMatchValidator({
    required String errorText,
    required this.password,
  }) : super(errorText);

  @override
  bool isValid(String value) {
    return value == password;
  }
}
