import 'package:flutter/material.dart';
import 'package:tap_it/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    if (isSignUp) {
      return const SignUpPage();
    } else {
      return const SignUpPage();
    }
  }
  //void toggle() => setState(() => isSignUp = !isSignUp);
}