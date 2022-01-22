import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/auth_screen.dart';
import 'package:flutter_application_2/pages/signin_screen.dart';

import './pages/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AuthScreen.route,
      routes: {
        AuthScreen.route: (ctx) => AuthScreen(),
        SignUpScreen.route: (ctx) => SignUpScreen(),
        SignInScreen.route: (ctx) => SignInScreen(),
      },
    );
  }
}
