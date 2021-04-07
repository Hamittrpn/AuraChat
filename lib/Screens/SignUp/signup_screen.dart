import 'package:aura_chat/screens/SignUp/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final Function onSignIn;

  const SignUpScreen({Key key, @required this.onSignIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Column(),
      ),
    );
  }
}
