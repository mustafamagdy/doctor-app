import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/pages/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../widgets/form_field.dart';
import '../widgets/round_corner_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding * 3,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign Up!'),
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
                            label: 'Password',
                            hint: 'Enter your password',
                            isObsecure: true,
                            validator: kPasswordValidator,
                            onChanged: (val) => _password = val,
                            onSaved: (newValue) => _password = newValue!,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Passwrd?'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
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
