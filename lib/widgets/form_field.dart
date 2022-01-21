import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObsecure;
  final FieldValidator<String?>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;

  const FormInput({
    Key? key,
    required this.label,
    required this.hint,
    this.isObsecure = false,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(label: label),
          TextFormField(
            obscureText: isObsecure,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: (value) {
              if (validator != null) return validator?.call(value);
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
              isDense: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldLabel extends StatelessWidget {
  final String label;

  const TextFieldLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black45.withOpacity(0.5),
        ),
      ),
    );
  }
}
