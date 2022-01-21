import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/validators/password_match.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../widgets/form_field.dart';
import '../widgets/round_corner_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  void saveUser() {
    if (!_formKey.currentState!.validate()) {
      print('not valid');
    } else {
      print(_formKey.currentState);
    }
  }

  late String _userName, _email, _phone, _password = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          height: size.height,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding * 3,
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Sign In!'),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormInput(
                            label: 'Username',
                            hint: 'Enter your username',
                            validator: RequiredValidator(
                              errorText: 'Username is required',
                            ),
                            onSaved: (newValue) => _userName = newValue!,
                          ),
                          FormInput(
                            label: 'Email',
                            hint: 'Enter your email',
                            validator: MultiValidator([
                              RequiredValidator(
                                errorText: 'Email is required',
                              ),
                              kEmailValidator
                            ]),
                            onSaved: (newValue) => _email = newValue!,
                          ),
                          FormInput(
                            label: 'Phone',
                            hint: 'Enter your phone number',
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Phone is required'),
                              kPhoneValidator,
                            ]),
                            onSaved: (newValue) => _phone = newValue!,
                          ),
                          FormInput(
                            label: 'Password',
                            hint: 'Enter your password',
                            isObsecure: true,
                            validator: kPasswordValidator,
                            onChanged: (val) => _password = val,
                            onSaved: (newValue) => _password = newValue!,
                          ),
                          FormInput(
                            label: 'Confirm Password',
                            hint: 'Confirm your password',
                            isObsecure: true,
                            //! this is not working, as password need to be
                            //  passed again to the password match validator
                            validator: PasswordMatchValidator(
                              errorText: 'Password don\'t match',
                              password: _password,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding * 2),
                    SizedBox(
                      width: double.maxFinite,
                      height: kDefaultPadding * 3,
                      child: RoundCornerButton(
                        onPress: saveUser,
                        text: 'Sign Up',
                        color: Colors.blue,
                        borderColor: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
