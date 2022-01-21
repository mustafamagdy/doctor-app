import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/signin_screen.dart';
import 'package:flutter_application_2/pages/signup_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../widgets/round_corner_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('assets/icons/splash_bg.svg'),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset('assets/icons/gerda_logo.svg'),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: kDefaultPadding * 3,
                    child: RoundCornerButton(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => SignUpScreen(),
                          ),
                        );
                      },
                      text: 'Sign Up',
                      color: Colors.cyan,
                      borderColor: Colors.cyan,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: kDefaultPadding * 3,
                    child: RoundCornerButton(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => SignInScreen(),
                          ),
                        );
                      },
                      text: 'Sign In',
                      color: Colors.transparent,
                      borderColor: Colors.cyan,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
