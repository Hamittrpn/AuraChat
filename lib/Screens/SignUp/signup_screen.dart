import 'package:aura_chat/Screens/SignUp/components/body.dart';
import 'package:aura_chat/Services/auth_base.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final AuthBase authService;

  const SignUpScreen({Key key, @required this.authService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Column(),
      ),
    );
  }
}
